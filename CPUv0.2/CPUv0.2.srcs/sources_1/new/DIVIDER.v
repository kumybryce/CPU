`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/01 16:30:25
// Design Name: 
// Module Name: DIVIDER
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


module DIVIDER(
    input clk,
    output reg clk_2div=0,
    output reg clk_4div=0
    );
    reg [3:0] count = 4'd0;
    reg [3:0] count1 = 4'd0;
    always @(posedge clk)
    begin
        if(count == 4'd1)
        begin
            clk_2div = !clk_2div;
            count = 4'd0;
        end
        count = count + 1;
    end
    always @(posedge clk)
    begin
        if(count1 == 4'd3)
        begin
            clk_4div = !clk_4div;
            count1 = 4'd0;
        end
        count1 = count1 + 1;
    end
endmodule
