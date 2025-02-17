`timescale 1ns / 1ps
module rgb_tb();
    logic [1:0] a;
    logic [1:0] b;
    logic R, G, B;
    rgb rgbl (
        .a(a),
        .b(b),
        .R(R),
        .G(G),
        .B(B)
    );
    task monitor();
        reg new_R, new_G, new_B; 
        if (a > b) begin
            new_R = 1; new_G = 0; new_B = 1; // Purple
        end 
        else if (a == b) begin
            new_R = 1; new_G = 1; new_B = 0; // Yellow
        end 
        else begin
            new_R = 0; new_G = 1; new_B = 1; // Cyan
        end
        if (R !== new_R || G !== new_G || B !== new_B) begin
            $display("ERROR: a=%b, b=%b | Expected R=%b, G=%b, B=%b | Got R=%b, G=%b, B=%b | Time=%t",
                     a, b, new_R, new_G, new_B, R, G, B, $time);
        end 
        else begin
            $display("PASS: a=%b, b=%b | R=%b, G=%b, B=%b", a, b, R, G, B);
        end
    endtask
    initial begin
        $display("Starting RGB LED Self-Test...");
        for (int i = 0; i < 4; i++) begin
            for (int j = 0; j < 4; j++) begin
                a = i;
                b = j;
                #10; 
                monitor();
            end
        end

        $display("Test Completed.");
        $finish;
    end

endmodule


