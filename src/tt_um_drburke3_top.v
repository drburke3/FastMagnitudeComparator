/*
 * Copyright (c) 2024 Daniel Burke
 * SPDX-License-Identifier: Apache-2.0
 */

`timescale 1ns / 1ps
`define default_netname none

module tt_um_drburke3_top (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  /// assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  assign uio_out = 0;
  assign uio_oe  = 0;
  assign uo_out [7:3] = 0;


magnitude_comparator(
.A      (ui_in[7:0]),   // input A
.LT_out    (uo_out[0]),  // A less than B
.EQ_out    (uo_out[1]),  // A equal to B
.GT_out    (uo_out[2]),  // A greater than B
.B      (uio_in[7:0])  // input B
);

endmodule
//////////////////////////////////////////////////////////////////////////////////
// Company: Berkeley Neuromorphic
// Engineer:  Daniel Burke
// 
// Create Date: 05/13/2024 11:39:15 AM
// Design Name: 
// Module Name: magnitude_comparator_8b_AIG
// Project Name: FastMagnitudeComparator
// Target Devices: 
// Tool Versions: 
// Description: 	For neuron thereshold determination in digital approaches,
//		a fast magnitude determination is often made.  This component
//		is based upon well-documented Clint Cole (Digilent) bit-sliced expandable, 
//		structural code re-expressed in AND-INV format to target optimized
//		ABC9 AIG graph synthesis in OpenLane.  It is intentionally unclocked for measurements.
//		https://www.realdigital.org/doc/a39d855f71772426c968c0151112b476
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module magnitude_comparator(
    input [7:0] A,
    input [7:0] B,
    output LT_out,
    output EQ_out,
    output GT_out
    );

wire [7:0] GT_internal;
wire [7:0] EQ_internal;
wire [7:0] LT_internal;

comparator_bitslice slice_0 (
    .A(A[0]),
    .B(B[0]),
    .LT_in(1'b0),
    .EQ_in(1'b1),
    .GT_in(1'b0),
    .LT_out(LT_internal[0]),
    .EQ_out(EQ_internal[0]),
    .GT_out(GT_internal[0])
    );

comparator_bitslice slice_1 (
    .A(A[1]),
    .B(B[1]),
    .LT_in(LT_internal[0]),
    .EQ_in(EQ_internal[0]),
    .GT_in(GT_internal[0]),
    .LT_out(LT_internal[1]),
    .EQ_out(EQ_internal[1]),
    .GT_out(GT_internal[1])
    );

comparator_bitslice slice_2 (
    .A(A[2]),
    .B(B[2]),
    .LT_in(LT_internal[1]),
    .EQ_in(EQ_internal[1]),
    .GT_in(GT_internal[1]),
    .LT_out(LT_internal[2]),
    .EQ_out(EQ_internal[2]),
    .GT_out(GT_internal[2])
    );

comparator_bitslice slice_3 (
    .A(A[3]),
    .B(B[3]),
    .LT_in(LT_internal[2]),
    .EQ_in(EQ_internal[2]),
    .GT_in(GT_internal[2]),
    .LT_out(LT_internal[3]),
    .EQ_out(EQ_internal[3]),
    .GT_out(GT_internal[3])
    );
    
  comparator_bitslice slice_4 (
    .A(A[4]),
    .B(B[4]),
    .LT_in(LT_internal[3]),
    .EQ_in(EQ_internal[3]),
    .GT_in(GT_internal[3]),
    .LT_out(LT_internal[4]),
    .EQ_out(EQ_internal[4]),
    .GT_out(GT_internal[4])
    );

comparator_bitslice slice_5 (
    .A(A[5]),
    .B(B[5]),
    .LT_in(LT_internal[4]),
    .EQ_in(EQ_internal[4]),
    .GT_in(GT_internal[4]),
    .LT_out(LT_internal[5]),
    .EQ_out(EQ_internal[5]),
    .GT_out(GT_internal[5])
    );
    
comparator_bitslice slice_6 (
    .A(A[6]),
    .B(B[6]),
    .LT_in(LT_internal[5]),
    .EQ_in(EQ_internal[5]),
    .GT_in(GT_internal[5]),
    .LT_out(LT_internal[6]),
    .EQ_out(EQ_internal[6]),
    .GT_out(GT_internal[6])
    );

comparator_bitslice slice_7 (
    .A(A[7]),
    .B(B[7]),
    .LT_in(LT_internal[6]),
    .EQ_in(EQ_internal[6]),
    .GT_in(GT_internal[6]),
    .LT_out(LT_internal[7]),
    .EQ_out(EQ_internal[7]),
    .GT_out(GT_internal[7])
    );
    
assign LT_out = LT_internal[3];
assign EQ_out = EQ_internal[3];
assign GT_out = GT_internal[3];

endmodule
