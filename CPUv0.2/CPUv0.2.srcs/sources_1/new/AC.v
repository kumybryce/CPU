`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/28 15:44:14
// Design Name: 
// Module Name: AC
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


module AC(
       input clk,
       input [31:0]c,
       input reset,
       input [15:0]ALU_in,
       input [15:0]MBR_in,
       output reg[15:0]ACC_out,
       output reg [7:0]flag,
       output [15:0] result
           
    );
    assign result = ACC_out;
    always @(posedge clk or negedge reset) 
        begin
            if(!reset)
                ACC_out<=16'b0000_0000_0000_0000;//ACC置零
            else
            begin
                if(c[8]==1)
                   ACC_out<=16'b0000_0000_0000_0000;//ACC置零
                if(c[21]==1)
                   ACC_out<=ALU_in;//ALU赋值给ACC,存放来自ALU的结果
                if(c[29]==1)
                   ACC_out<=MBR_in;//MBR赋值给ACC
                if(ACC_out[15]==0)
                   flag[0]<=0;//ACC>0
                else
                   flag[0]<=1;//ACC<=0
             end
        end
endmodule
