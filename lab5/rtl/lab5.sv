`timescale 1ns / 1ps
module lab5(
    input logic [3:0] num,   
    input logic  [2:0] sel,   
    output logic A,B,C,D,E,F,G,DP,    
    output logic [7:0] anode       
);
assign A=(~num[3]&~num[2]&~num[1]&num[0]) | (~num[3]&num[2]&~num[1]&~num[0]) | (num[3]&num[2]&~num[1]&num[0]) |(num[3]&~num[2]&num[1]&num[0]);
assign B=(num[2]&num[1]&~num[0]) | (num[3]&num[2]&~num[0]) | (num[3]&num[1]&num[0]) |(~num[3]&num[2]&~num[1]&num[0]);
assign C=(num[3]&num[2]&~num[0]) | (num[3]&num[2]&num[1]) | (~num[3]&~num[2]&num[1]&~num[0]) ;
assign D=(num[2]&num[1]&num[0]) | (~num[3]&~num[2]&~num[1]&num[0]) | (~num[3]&num[2]&~num[1]&~num[0]) |(num[3]&~num[2]&num[1]&~num[0]);
assign E=(~num[3]&num[0]) | (~num[2]&~num[1]&num[0]) | (~num[3]&num[2]&~num[1]); 
assign F=(~num[3]&~num[2]&num[0]) | (~num[3]&~num[2]&num[1]) | (~num[3]&num[1]&num[0]) |(num[3]&num[2]&~num[1]&num[0]);
assign G=(~num[3]&~num[2]&~num[1]) | (num[3]&num[2]&~num[1]&~num[0]) | (~num[3]&num[2]&num[1]&num[0]) ;
assign DP=1;
assign anode[0] = ( sel[2] | sel[1]| sel[0] );
assign anode[1] = ( sel[2] | sel[1] | ~sel[0] );
assign anode[2] = ( sel[2] | ~sel[1] | sel[0] );
assign anode[3] = ( sel[2] | ~sel[1] | ~sel[0] );
assign anode[4] = ( ~sel[2] | sel[1] | sel[0] );
assign anode[5] = ( ~sel[2] | sel[1] | ~sel[0] );
assign anode[6] = ( ~sel[2] | ~sel[1] | sel[0] );
assign anode[7] = ( ~sel[2] | ~sel[1] | ~sel[0] );

endmodule
