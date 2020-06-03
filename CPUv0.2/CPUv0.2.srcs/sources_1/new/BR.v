`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/01 03:54:40
// Design Name: 
// Module Name: BR
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


module BR(
    input clk,
    input reset,
    input [31:0] c,
    input [15:0] BR_from_MBR,
    output [15:0] BR_to_ALU,
    
    //test
    output [15:0] reg_br
    );
    reg [15:0] BR_reg;
    
    assign reg_br = BR_reg;//test
    assign BR_to_ALU = BR_reg;//test
    
    always @(posedge clk or negedge reset)
    begin
        if(!reset)
        begin
            BR_reg = 16'b0000000000000000;
        end
        else
        begin
            if(c[7] == 1)//in   一旦有数据到达IR，就输出到CU中去
            begin
                BR_reg = BR_from_MBR;
            end
        end
    end
endmodule
