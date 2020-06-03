`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/01 03:10:21
// Design Name: 
// Module Name: PC
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


module PC(
    input clk,
    input reset,
    input [31:0] c,
    input [7:0] PC_from_MBR,
    output [7:0] PC_to_MAR,
    output [7:0] PC_to_MBR,
    
    //test
    output [7:0] reg_pc
    );
    reg [7:0] PC_reg;
    reg  temp=1;
    
    assign reg_pc = PC_reg;//test
    assign PC_to_MAR = PC_reg;//test
    assign PC_to_MBR = PC_reg;//test
    
    
    always @(posedge clk or negedge reset)
    begin
        if(!reset)
        begin
            PC_reg = 8'b00000000;
        end
        else
        begin
            if(c[6] == 1)// PC + 1
            begin
                if(temp != 0)
                begin
                    PC_reg = PC_reg +1;
                    temp = 0;
                end
            end
            else if(c[14] == 1)//in   PC¡ûMBR
            begin
                PC_reg = PC_from_MBR;
                temp = 1;
            end
            else if(c[15] == 1)//in   PC¡û0
            begin
                PC_reg = 8'b00000000;
                temp = 1;
            end
            else
                temp = 1;
        end
    end
endmodule
