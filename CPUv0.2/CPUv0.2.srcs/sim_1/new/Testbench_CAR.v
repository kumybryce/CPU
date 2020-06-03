`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/31 21:06:07
// Design Name: 
// Module Name: Testbench_CAR
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


module Testbench_CAR(
    );
    reg clk,reset,flag;
    reg [7:0]IR_out;
    reg [31:0]c;
    wire [7:0]address_out;
    
    parameter FETCH =  8'b00000000,
        STORE = 8'b00000001,
        LOAD =  8'b00000010,
        ADD =  8'b00000011,
        SUB =  8'b00000100,
        JMPGEZ =  8'b00000101,
        JMP =  8'b00000110,
        HALT =  8'b00000111,
        MPY =  8'b00001000,
        AND =  8'b00001010,
        OR =  8'b00001011,
        NOT =  8'b00001100,
        SHR =  8'b00001101,
        SHL =  8'b00001110;
        
        CAR my_CAR(
        .clk(clk),
        .reset(reset),
        .IR_out(IR_out),
        .c(c),
        .flag(flag),
        .address_out(address_out));
        
            initial // clk generator
        begin
            clk = 0;
            forever #10 clk = !clk;
        end
        
        initial // reset generator
        begin
            reset = 1;
           //#10 reset = !reset;
        end
        
        initial // flag generator
        begin
            flag = 0;
        end
        
        initial // control signal generator
        begin
            c = 32'b00000000000000000000000000000000;
            #20 c = 32'b00000000000000000000000000000100;//FetchµÄcontrol signal
            #20 c = 32'b00000000000000000000000000001001;
            #20 c = 32'b00000000000000000000000000010001;
            #20 c = 32'b00000000000000000000000000000010;
            #20 c = 32'b00000000000000000000000001100001;//LOADµÄcontrol signal
            #20 c = 32'b00000000000000000000000110000001;
            #20 c = 32'b00000000000000000000001000000001;
            #20 c = 32'b00000000000000000000010000000100;
        end
        
        initial // IR_out generator
        begin
            IR_out = LOAD;
        end
        
endmodule
