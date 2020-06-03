`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/01 16:36:45
// Design Name: 
// Module Name: tb_DIVIDER
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


module tb_DIVIDER();
reg clk;
wire clk_4div;
initial
begin
    clk = 0;
    forever #1 clk = !clk;
end
DIVIDER dut(
.clk(clk),
.clk_4div(clk_4div)
);
endmodule
