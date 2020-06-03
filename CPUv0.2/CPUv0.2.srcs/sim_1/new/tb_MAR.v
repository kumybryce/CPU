`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/01 15:53:07
// Design Name: 
// Module Name: tb_PC
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


module tb_MAR();
reg clk;
reg reset;
reg [31:0] c;
reg [7:0] MAR_from_PC;
reg [7:0] MAR_from_MBR;
wire [7:0] MAR_to_RAM;

initial
begin
    reset = 1;
    clk = 0;
    c = 32'b00000000000000000000000000000000;
    MAR_from_PC = 8'b11001000;
    MAR_from_MBR =  8'b11001011;
    forever #1 clk = !clk;
end
initial
begin
   #2 reset = 0;
   #2 reset = 1;
   #5 c[5] = 1; 
   #5 begin c[5] = 0; c[10] = 1; end
end

MAR dut(
.clk(clk),
.reset(reset),
.c(c),
.MAR_from_PC(MAR_from_PC),
.MAR_from_MBR(MAR_from_MBR),
.MAR_to_RAM(MAR_to_RAM)
);
endmodule