`timescale 1ns / 1ps
module lab5tb();
    
    logic [3:0] num;   
    logic [2:0] sel;   
    logic A, B, C, D, E, F, G, DP;
    logic [7:0] anode;
    
    lab5 uut (
        .num(num),
        .sel(sel),
        .A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G), .DP(DP),
        .anode(anode)
    );

    
    logic [6:0] expected_patterns [0:15] = '{
        7'b0000001, // 0
        7'b1001111, // 1
        7'b0010010, // 2
        7'b0000110, // 3
        7'b1001100, // 4
        7'b0100100, // 5
        7'b0100000, // 6
        7'b0001111, // 7
        7'b0000000, // 8
        7'b0000100, // 9
        7'b0001000, // A
        7'b1100000, // B
        7'b0110001, // C
        7'b1000010, // D
        7'b0110000, // E
        7'b0111000  // F
    };

    
    task driver(input logic [3:0] test_num, input logic [2:0] test_sel);
        num = test_num;
        sel = test_sel;
        #10;  
    endtask

    task monitor();
        reg [6:0] expected_output;
        reg [7:0] expected_anode;
        logic [6:0] actual_output;  
        
        expected_output = expected_patterns[num];

    
        case (sel)
            3'b000: expected_anode = 8'b11111110;
            3'b001: expected_anode = 8'b11111101;
            3'b010: expected_anode = 8'b11111011;
            3'b011: expected_anode = 8'b11110111;
            3'b100: expected_anode = 8'b11101111;
            3'b101: expected_anode = 8'b11011111;
            3'b110: expected_anode = 8'b10111111;
            3'b111: expected_anode = 8'b01111111;
            default: expected_anode = 8'b11111111; 
        endcase

        actual_output = {A, B, C, D, E, F, G};

        if (actual_output !== expected_output) 
            $display("ERROR: num=%b sel=%b | Expected %b | Got %b | Time=%t",
                     num, sel, expected_output, actual_output, $time);
        else 
            $display("PASS: num=%b sel=%b | Output=%b", num, sel, actual_output);
        
        if (anode !== expected_anode) 
            $display("ERROR: sel=%b | Expected anode=%b | Got %b | Time=%t",
                     sel, expected_anode, anode, $time);
    endtask

    
    initial begin
        $display("Starting self-test for lab5...");
        for (int i = 0; i < 16; i++) begin
            for (int j = 0; j < 8; j++) begin
                driver(i, j);  
                monitor();     
            end
        end
        
        $display("Test Completed.");
        $finish;
    end

endmodule
