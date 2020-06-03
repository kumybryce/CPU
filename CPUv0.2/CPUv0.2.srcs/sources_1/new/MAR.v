`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/01 03:10:21
// Design Name: 
// Module Name: MAR
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


module MAR(
    input clk,
    input reset,
    input [31:0] c,
    input [7:0] MAR_from_PC,
    input [7:0] MAR_from_MBR,
    output [7:0] MAR_to_RAM,
    //test
    output [7:0] reg_mar
    );
    reg [7:0] MAR_reg;
    
    assign reg_mar = MAR_reg;//test
    assign MAR_to_RAM = MAR_reg;//test
    
    always @(posedge clk or negedge reset)
    begin
        if(!reset)
        begin
            MAR_reg = 8'b00000000;
        end
        else
        begin
            if(c[5] == 1)//in  一旦有数据到达MAR，就输出到RAM中去
            begin
                MAR_reg = MAR_from_MBR;
            end
            else if(c[10] == 1)//in  一旦有数据到达MAR，就输出到RAM中去
            begin
                MAR_reg = MAR_from_PC;
            end
        end
    end
endmodule
