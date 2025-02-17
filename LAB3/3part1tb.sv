`timescale 1ns / 1ps
module testbench;
    logic a, b, c;
    logic x, y;
    combinational_circuit cc (
        .a(a), 
        .b(b), 
        .c(c), 
        .x(x), 
        .y(y)
    );
    initial begin
        $display("a b c | x y");
        $display("--------------");
        $monitor("%b %b %b | %b %b", a, b, c, x, y);
        a = 0; b = 0; c = 0; #10;
        a = 0; b = 0; c = 1; #10;
        a = 0; b = 1; c = 0; #10;
        a = 0; b = 1; c = 1; #10;
        a = 1; b = 0; c = 0; #10;
        a = 1; b = 0; c = 1; #10;
        a = 1; b = 1; c = 0; #10;
        a = 1; b = 1; c = 1; #10;
        $stop; 
    end
endmodule