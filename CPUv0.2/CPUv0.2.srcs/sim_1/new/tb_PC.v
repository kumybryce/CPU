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


module tb_PC();
reg clk;
reg reset;
reg [31:0] c;
reg [7:0] PC_from_MBR;
wire [7:0] PC_to_MAR;
wire [7:0] PC_to_MBR;

initial
begin
    reset = 1;
    clk = 0;
    c = 32'b00000000000000000000000000000000;
    PC_from_MBR = 8'b11001000;
    forever #1 clk = !clk;
end
initial
begin
   #2 reset = 0;
   #2 reset = 1;
   #5 c[6] = 1; 
   #5 begin c[6] = 0; c[10] = 1; end
   #5 begin c[10] = 0; c[14] = 1; end
   #5 begin c[14] = 0; c[15] = 1; end
end

PC dut(
.clk(clk),
.reset(reset),
.c(c),
.PC_from_MBR(PC_from_MBR),
.PC_to_MAR(PC_to_MAR),
.PC_to_MBR(PC_to_MBR)
);
endmodule
