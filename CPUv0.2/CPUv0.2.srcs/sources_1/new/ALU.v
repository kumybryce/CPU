`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/28 15:40:49
// Design Name: 
// Module Name: ALU
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


module ALU(input clk,
            input reset,
            input [31:0]c,
            input [15:0]ACC_in,
            input [15:0]BR_in,
            output reg [15:0]MR,  
            output reg [15:0]ALU_out
    );
    reg [31:0]mult;
    reg [15:0]alu_br;
    reg [15:0]alu_acc;
    always @ ( posedge clk or negedge reset )
        begin
            if(!reset)
                begin
                    ALU_out<=16'b0000_0000_0000_0000;
                end
            else 
            begin
                if(c[19]==1)
                    alu_br<=BR_in;//数据从BR_in来
                if(c[20]==1)
                    alu_acc<=ACC_in;      
                if(c[9])//ADD ACC+BR
                    ALU_out<=alu_acc+alu_br;
                else if(c[16])//SUB ACC-BR
                    ALU_out<=alu_acc-alu_br;
                else if(c[28])//AND  ACC AND BR
                    ALU_out<=alu_acc & alu_br;
                else if(c[27])//or  ACC or BR
                    ALU_out<=alu_acc|alu_br;
                else if(c[26])//not  not ACC
                    ALU_out<=^alu_acc;
                else if(c[17])//SHR
                begin
                    ALU_out<=0&alu_acc[15:1];
                end
                else if(c[25])//SHL
                begin
                    ALU_out<=alu_acc[14:0]&0;
                end
                else if(c[24])//ACC*BR,低位结果放入ALU_out
                begin
                    mult<=alu_acc*alu_br;
                    ALU_out<=mult[15:0];
                end
                else if(c[18])//ACC*BR,将乘法结果放入ALU_out与MR中
                begin
                    MR<=mult[31:16];
                end
            //  else if(cs[20])//SAR
           //         ALU_out<=alu[15]&alu[15:1];
           //   else if(cs[29])//SAL
           //        ALU_out<=alu[14:0]&0;
            end                
        end
endmodule
