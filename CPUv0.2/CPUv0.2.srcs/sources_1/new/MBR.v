`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/01 02:17:46
// Design Name: 
// Module Name: MBR
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


module MBR(
    input clk,
    input reset,
    input [31:0] c,
    //inputs
    input [15:0] MBR_from_RAM,
    input [7:0] MBR_from_PC,
    input [15:0] MBR_from_ACC,
    //outputs
    output  [7:0] MBR_to_PC,
    output  [7:0] MBR_to_IR,
    output  [15:0] MBR_to_ACC,
    output  [7:0] MBR_to_MAR,
    output  [15:0] MBR_to_RAM,
    output  [15:0] MBR_to_BR,
    output wea,
    
    //test
    output [15:0]reg_mbr
    );
    
    assign wea = c[11];
    reg [15:0] MBR_reg;
    
    assign reg_mbr = MBR_reg;//test
    assign MBR_to_PC = MBR_reg[7:0];//test
    assign MBR_to_IR = MBR_reg[15:8];//test
    assign MBR_to_ACC = MBR_reg;//test
    assign MBR_to_MAR = MBR_reg[7:0];//test
    assign MBR_to_BR = MBR_reg;//test
    assign MBR_to_RAM = MBR_reg;//test
    
    always @(posedge clk or negedge reset)
    begin
        if(!reset)
        begin
            MBR_reg = 16'b0000000000000000;
        end
        else
        begin
            if(c[3] == 1)
                MBR_reg = MBR_from_RAM;
            else if(c[12] == 1)
                MBR_reg = MBR_from_ACC;
        end
    end
endmodule
