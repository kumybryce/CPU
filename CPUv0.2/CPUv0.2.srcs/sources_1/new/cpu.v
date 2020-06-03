`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/02 13:17:45
// Design Name: 
// Module Name: cpu
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


module cpu(
    input clk,
    input clk_2div,
    input clk_4div,
    input reset,
    input [15:0] CPU_from_RAM_D,
    output wea,
    output [15:0] CPU_to_RAM_D,
    output [7:0] CPU_to_RAM_A,
    
    //test
    output [15:0] result,
    output [31:0] c,
    output [7:0] MBR_to_PC,
    output [7:0] MBR_to_IR,
    output [15:0] MBR_to_ACC,
    output [7:0] MBR_to_MAR,
    output [15:0] MBR_to_BR,
    output [7:0] PC_to_MAR,
    output [7:0] PC_to_MBR,
    output [15:0] BR_to_ALU,
    output [7:0] IR_to_CU,
    output [15:0]ACC_to_ALU,
    output [7:0]flag,
    output [15:0]MR,
    output [15:0]ALU_to_ACC,
    output [15:0]reg_mbr,
    output [7:0]reg_mar,
    output [7:0]reg_pc,
    output [15:0]reg_br,
    output [7:0]reg_ir
    );
//    //MBR
//    wire [31:0] c;
//    wire [15:0] MBR_from_RAM;
//    //wire [7:0] MBR_from_PC;
//    //wire [15:0] MBR_from_ACC;
//    wire [7:0] MBR_to_PC;
//    wire [7:0] MBR_to_IR;
//    wire [15:0] MBR_to_ACC;
//    wire [7:0] MBR_to_MAR;
//    wire [15:0] MBR_to_RAM;
//    wire [15:0] MBR_to_BR;
    
//    //MAR
//    //wire [7:0] MAR_from_PC;
//    //wire [7:0] MAR_from_MBR;
//    wire [7:0] MAR_to_RAM;
    
//    //PC
//    //wire [7:0] PC_from_MBR;
//    wire [7:0] PC_to_MAR;
//    wire [7:0] PC_to_MBR;
    
//    //BR
//    //wire [15:0] BR_from_MBR;
//    wire [15:0] BR_to_ALU;
        
//    //IR
//    //wire [7:0] IR_from_MBR;
//    wire [7:0] IR_to_CU;
    
//    //AC
//    //wire [15:0]ALU_in;
//    //wire [15:0]MBR_in;
//    //wire [15:0]ACC_out;
//    wire [15:0]ACC_to_ALU;
//    wire [7:0]flag;
    
//    //ALU
//    //wire [15:0]BR_in;
//    wire [15:0]MR;
//    wire [15:0]ALU_to_ACC;
        
    //CU
    //wire [7:0]IR_out;
    
    MBR mbr(
    .clk(clk_2div),
    .reset(reset),
    .c(c),
    .wea(wea),
    .MBR_from_RAM(CPU_from_RAM_D),
    .MBR_from_ACC(ACC_to_ALU),
    .MBR_from_PC(PC_to_MBR),
    .MBR_to_PC(MBR_to_PC),
    .MBR_to_IR(MBR_to_IR),
    .MBR_to_ACC(MBR_to_ACC),
    .MBR_to_MAR(MBR_to_MAR),
    .MBR_to_RAM(CPU_to_RAM_D),
    .MBR_to_BR(MBR_to_BR),
    
    //test
    .reg_mbr(reg_mbr)
    );
    
    MAR mar(
    .clk(clk_2div),
    .reset(reset),
    .c(c),
    .MAR_from_PC(PC_to_MAR),
    .MAR_from_MBR(MBR_to_MAR),
    .MAR_to_RAM(CPU_to_RAM_A),
    
    //test
    .reg_mar(reg_mar)
    );
    
    PC pc(
    .clk(clk_2div),
    .reset(reset),
    .c(c),
    .PC_from_MBR(MBR_to_PC),
    .PC_to_MAR(PC_to_MAR),
    .PC_to_MBR(PC_to_MBR),
    
    //test
    .reg_pc(reg_pc)
    );
    
    BR br(
    .clk(clk_2div),
    .reset(reset),
    .c(c),
    .BR_from_MBR(MBR_to_BR),
    .BR_to_ALU(BR_to_ALU),
    
    //test
    .reg_br(reg_br)
    );
    
    IR ir(
    .clk(clk_2div),
    .reset(reset),
    .c(c),
    .IR_from_MBR(MBR_to_IR),
    .IR_to_CU(IR_to_CU),
    
    //test
    .reg_ir(reg_ir)
    );
    
    AC ac(
    .clk(clk_2div),
    .reset(reset),
    .c(c),
    .ALU_in(ALU_to_ACC),
    .MBR_in(MBR_to_ACC),
    .ACC_out(ACC_to_ALU),
    .flag(flag),
    .result(result)
    );
    
    ALU alu(
    .clk(clk_2div),
    .reset(reset),
    .c(c),
    .ACC_in(ACC_to_ALU),
    .BR_in(BR_to_ALU),
    .MR(MR),
    .ALU_out(ALU_to_ACC)
    );
    
    CU cu(
    .clk(clk),
    .clk_4div(clk_2div),
    .reset(reset),
    .c(c),
    .IR_out(IR_to_CU),
    .flag(flag)
    );
    
   
        
endmodule
