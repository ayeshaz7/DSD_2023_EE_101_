`timescale 1ns / 1ps
module combinational_circuit (
    input logic a,
    input logic b,
    input logic c,
    output logic x,
    output logic y
); 
    logic or_out;
    logic and_out;
    logic xor_;
    logic nand_;
    logic not_c;
    assign or_out = a | b;
    assign not_c = ~c;
    assign x = not_c ^ or_out;
    assign nand_ = ~(a & b);
    assign xor_ = nand_ ^ or_out;
    assign y = xor_ & or_out;
endmodule