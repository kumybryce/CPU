`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/02 16:55:04
// Design Name: 
// Module Name: TB_CPU
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


module TB_CPU(
    input clk,
    input reset,
    
    //test
    output [15:0] result,
    output [31:0] c,
    output [15:0] MBR_from_RAM,
    output [7:0] MBR_to_PC,
    output [7:0] MBR_to_IR,
    output [15:0] MBR_to_ACC,
    output [7:0] MBR_to_MAR,
    output [15:0] MBR_to_RAM,
    output [15:0] MBR_to_BR,
    output [7:0] MAR_to_RAM,
    output [7:0] PC_to_MAR,
    output [7:0] PC_to_MBR,
    output [15:0] BR_to_ALU,
    output [7:0] IR_to_CU,
    output [15:0]ACC_to_ALU,
    output [7:0]flag,
    output [15:0]MR,
    output [15:0]ALU_to_ACC,
    output wea,
    output [15:0]reg_mbr,
    output [7:0]reg_mar,
    output [7:0]reg_pc,
    output [15:0]reg_br,
    output [7:0]reg_ir,
    output clk_2div,
    output clk_4div
    );
    
    
    DIVIDER div(
    .clk(clk),
    .clk_2div(clk_2div),
    .clk_4div(clk_4div)
    );

    
    cpu tb_cpu(
    .clk(clk),
    .clk_2div(clk_2div),
    .clk_4div(clk_4div),
    .reset(reset),
    .CPU_from_RAM_D(MBR_from_RAM),
    .wea(wea),
    .CPU_to_RAM_D(MBR_to_RAM),
    .CPU_to_RAM_A(MAR_to_RAM),
    
    //test
    .result(result),
    .c(c),
    .MBR_to_PC(MBR_to_PC),
    .MBR_to_IR(MBR_to_IR),
    .MBR_to_ACC(MBR_to_ACC),
    .MBR_to_MAR(MBR_to_MAR),
    .MBR_to_BR(MBR_to_BR),
    .PC_to_MAR(PC_to_MAR),
    .PC_to_MBR(PC_to_MBR),
    .BR_to_ALU(BR_to_ALU),
    .IR_to_CU(IR_to_CU),
    .ACC_to_ALU(ACC_to_ALU),
    .flag(flag),
    .MR(MR),
    .ALU_to_ACC(ALU_to_ACC),
    .reg_mbr(reg_mbr),
    .reg_mar(reg_mar),
    .reg_pc(reg_pc),
    .reg_br(reg_br),
    .reg_ir(reg_ir)
    
    );
    
    
    RAM ram(
    .clka(clk),    // input wire clka
    .wea(wea),      // input wire [0 : 0] wea 0_read 1_write
    .addra(MAR_to_RAM),  // input wire [7 : 0] addra
    .dina(MBR_to_RAM),    // input wire [15 : 0] dina
    .douta(MBR_from_RAM)  // output wire [15 : 0] douta
   );
endmodule
