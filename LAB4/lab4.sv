`timescale 1ns / 1ps
module rgb(
    input [1:0] a, 
    input [1:0] b,  
    output logic R, G, B 
);
    assign R = (~b[1]&~b[0])|(~b[1]&a[0])| (~b[1]&a[1])|(~b[0]&a[1])|(a[1]&a[0]);
    assign G =(~a[1]&~a[0])|(~a[1]&b[0])|(~a[1]&b[1])|(b[1]&~a[0])|(b[1]&b[0]);
    assign B =(~b[1]&a[1])|(b[1]&~a[1])| (~b[0]&a[0])|(b[0]&~a[0]);
endmodule