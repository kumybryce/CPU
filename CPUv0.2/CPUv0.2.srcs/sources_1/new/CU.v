`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/02 13:43:45
// Design Name: 
// Module Name: CU
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


module CU(
    input clk,
    input clk_4div,
    input reset,
    output [31:0] c,
    input [7:0]IR_out,
    input [7:0]flag
    );
    wire [7:0]address_out; //address of micro-operations
    
    CAR car(
    .clk(clk_4div),
    .reset(reset),
    .c(c),
    .IR_out(IR_out),
    .flag(flag),
    .address_out(address_out)
    );
    
    CM cm(
    .clka(clk),
    .addra(address_out),
    .douta(c)
    );
    
endmodule
