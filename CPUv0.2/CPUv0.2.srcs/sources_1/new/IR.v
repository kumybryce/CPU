`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/01 03:10:21
// Design Name: 
// Module Name: IR
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


module IR(
    input clk,
    input reset,
    input [31:0] c,
    input [7:0] IR_from_MBR,
    output [7:0] IR_to_CU,
    
    //test
    output [7:0] reg_ir
    );
    reg [7:0] IR_reg;
    assign IR_to_CU = IR_reg;
    assign reg_ir = IR_reg;//test
    
    always @(posedge clk or negedge reset)
    begin
        if(!reset)
        begin
            IR_reg = 8'b00000000;
        end
        else
        begin
            if(c[4] == 1)//in   一旦有数据到达IR，就输出到CU中去
            begin
                IR_reg = IR_from_MBR;
            end
        end
    end
endmodule
