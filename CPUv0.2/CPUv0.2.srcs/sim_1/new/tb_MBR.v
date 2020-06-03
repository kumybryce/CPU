`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/01 04:00:06
// Design Name: 
// Module Name: tb_MBR
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


module tb_MBR();
reg clk;
reg reset;
reg [31:0] c;
reg [15:0] MBR_from_RAM;
reg [7:0] MBR_from_PC;
reg [15:0] MBR_from_ACC;
wire [7:0] MBR_to_PC;
wire [7:0] MBR_to_IR;
wire [15:0] MBR_to_ACC;
wire [7:0] MBR_to_MAR;
wire [15:0] MBR_to_RAM;
wire [15:0] MBR_to_BR;

initial
begin
    reset = 1;
    clk = 0;
    c = 32'b11111111111111111111111111111111;
    MBR_from_RAM = 16'b1100100111100001;
    MBR_from_PC = 8'b00010010;
    MBR_from_ACC = 16'b1111000011110000;
    forever #1 clk = !clk;
end
initial
begin
   #2 reset = 0;
   #2 reset = 1;
   #5 c[3] = 0; 
   #5 begin c[3] = 1; c[12] = 0; end
   #5 begin c[12] = 1; c[4] = 0; end
   #5 begin c[4] = 1; c[5] = 0; end
   #5 begin c[5] = 1; c[7] = 0; end
   #5 begin c[7] = 1; c[11] = 0; end
   #5 begin c[11] = 1; c[14] = 0; end
end

MBR dut(
.clk(clk),
.reset(reset),
.c(c),
.MBR_from_RAM(MBR_from_RAM),
.MBR_from_PC(MBR_from_PC),
.MBR_from_ACC(MBR_from_ACC),
.MBR_to_PC(MBR_to_PC),
.MBR_to_IR(MBR_to_IR),
.MBR_to_ACC(MBR_to_ACC),
.MBR_to_MAR(MBR_to_MAR),
.MBR_to_RAM(MBR_to_RAM),
.MBR_to_BR(MBR_to_BR)
);

endmodule
