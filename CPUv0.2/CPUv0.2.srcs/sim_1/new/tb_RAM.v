`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/01 16:23:03
// Design Name: 
// Module Name: tb_RAM
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


module tb_RAM();
reg clk;
reg reset;
reg [31:0] c;
reg wea;
wire clk_4div;
//MAR
reg [7:0] MAR_to_RAM = 8'b00000000;
//wire [7:0] MAR_to_RAM;
//reg [7:0] MAR_from_PC;
//MBR
wire [15:0] Mbr_from_RAM;
reg [15:0] MBR_to_RAM = 16'h2020;
initial
begin
    reset = 1;
    clk = 0;
    c = 32'b00000000000000000000000000000000;
    wea = 1'b0;
    //MAR_from_PC = 8'b00000001;
    forever #1 clk = !clk;
end
initial
begin
//   #4 reset = 0;
//   #4 reset = 1;
//   #20 begin c[11] = 1;  wea = 1'b1; end 
   #20 begin c[3] = 1; c[11] = 0;  wea = 1'b0; end 
   
  // #20 begin MAR_from_PC = 8'b00010000; c[10] = 1; c[3] = 1; wea = 1'b0; end 
end


//MAR mar(
//.clk(clk_4div),
//.reset(reset),
//.c(c),
//.MAR_to_RAM(MAR_to_RAM),
//.MAR_from_PC(MAR_from_PC)
//);

//MBR mbr(
//.clk(clk_4div),
//.reset(reset),
//.c(c),
//.MBR_from_RAM(Mbr_from_RAM),
//.MBR_to_RAM(MBR_to_RAM)
//);

//DIVIDER dut(
//.clk(clk),
//.clk_4div(clk_4div)
//);

RAM ram(
.clka(clk),    // input wire clka
.wea(wea),      // input wire [0 : 0] wea 0_read 1_write
.addra(MAR_to_RAM),  // input wire [7 : 0] addra
.dina(MBR_to_RAM),    // input wire [15 : 0] dina
.douta(Mbr_from_RAM)  // output wire [15 : 0] douta

);
endmodule
