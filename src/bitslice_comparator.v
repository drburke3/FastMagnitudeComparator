`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2024 11:36:50 AM
// Design Name: 
// Module Name: comparator_bitslice
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module comparator_bitslice(
    input A,
    input B,
    input LT_in,
    input EQ_in,
    input GT_in,
    output LT_out,
    output EQ_out,
    output GT_out
    );

// original naive structural Verilog code as per RealDigital
// assign GT_out =  ( A & ~B ) | (~(A ^ B) & GT_in);
// re-expressed in AND-INV form for optimal processing in ABC9 AIG graph format
assign GT_out = ~(~( A & ~B ) & ~(~(~(~A & ~B) & ~(A & B)) & GT_in));

// original naive structural Verilog code as per RealDigital
// assign EQ_out =  EQ_in & (( A & B ) | (~A & ~B));
// re-expressed in AND-INV form for optimal processing in ABC9 AIG graph format
assign EQ_out = EQ_in & ~(~( A & B ) & ~(~A & ~B));

// original naive structural Verilog code as per RealDigital
// assign LT_out = ( B & ~A ) | ( ~(A ^ B) & LT_in);
// re-expressed in AND-INV form for optimal processing in ABC9 AIG graph format
assign LT_out = ~(~( B & ~A ) & ~( ~(( ~(~A & ~B)) & ~(A & B)) & LT_in));

endmodule
