`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/31 21:06:31
// Design Name: 
// Module Name: Testbench_CM
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


module Testbench_CM(
    );
    reg clock;
    reg [7:0]address_out;
    wire [31:0]c;
    
    CM my_CM(
    .clka(clock),
    .addra(address_out),
    .douta(c));
    
    initial // clock generator
    begin
        clock = 0;
        forever #5 clock = !clock;
    end
    
    initial // address generator
    begin
        address_out = 8'b00000000;
        #20 address_out = 8'b00000000;//FETCH微操作的address
        #20 address_out = 8'b00000001;
        #20 address_out = 8'b00000010;
        #20 address_out = 8'b00100000;//LOAD微操作的address
        #20 address_out = 8'b00100001;
        #20 address_out = 8'b00100010;
        #20 address_out = 8'b00100011;
        #20 address_out = 8'b00000000;
    end
      
endmodule
