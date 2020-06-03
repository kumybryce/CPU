`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/02 17:50:58
// Design Name: 
// Module Name: tbb_CPU
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


module tbb_CPU();
reg clk;
reg reset;

//test
wire [15:0] result;
wire [31:0] c;
wire [15:0] MBR_from_RAM;
wire [7:0] MBR_to_PC;
wire [7:0] MBR_to_IR;
wire [15:0] MBR_to_ACC;
wire [7:0] MBR_to_MAR;
wire [15:0] MBR_to_RAM;
wire [15:0] MBR_to_BR;
wire [7:0] MAR_to_RAM;
wire [7:0] PC_to_MAR;
wire [7:0] PC_to_MBR;
wire [15:0] BR_to_ALU;
wire [7:0] IR_to_CU;
wire [15:0]ACC_to_ALU;
wire [7:0]flag;
wire [15:0]MR;
wire [15:0]ALU_to_ACC;
wire wea;
wire [15:0]reg_mbr;
wire [7:0]reg_mar;
wire [7:0]reg_pc;
wire [15:0]reg_br;
wire [7:0]reg_ir;
wire clk_4div;
wire clk_2div;
initial
begin
    reset = 1;
    clk = 0;
    forever #1 clk = !clk;
end
initial
begin
   #2 reset = 0;
   #2 reset = 1;
end

TB_CPU dut(
.clk(clk),
.reset(reset),

//test
.result(result),
.c(c),
.MBR_from_RAM(MBR_from_RAM),
.MBR_to_PC(MBR_to_PC),
.MBR_to_IR(MBR_to_IR),
.MBR_to_ACC(MBR_to_ACC),
.MBR_to_MAR(MBR_to_MAR),
.MBR_to_RAM(MBR_to_RAM),
.MBR_to_BR(MBR_to_BR),
.MAR_to_RAM(MAR_to_RAM),
.PC_to_MAR(PC_to_MAR),
.PC_to_MBR(PC_to_MBR),
.BR_to_ALU(BR_to_ALU),
.IR_to_CU(IR_to_CU),
.ACC_to_ALU(ACC_to_ALU),
.flag(flag),
.MR(MR),
.ALU_to_ACC(ALU_to_ACC),
.wea(wea),
.reg_mbr(reg_mbr),
.reg_mar(reg_mar),
.reg_pc(reg_pc),
.reg_br(reg_br),
.reg_ir(reg_ir),
.clk_2div(clk_2div),
.clk_4div(clk_4div)
);
endmodule
