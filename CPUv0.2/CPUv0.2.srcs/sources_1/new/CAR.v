`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/28 17:04:43
// Design Name: 
// Module Name: CAR
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


module CAR(
    input clk,
    input reset,
    input [7:0]IR_out,
    input [31:0]c,
    input [7:0]flag,
    output reg [7:0]address_out//address of micro-operations
    );
    reg [7:0]address;//address of micro-operations
    reg [7:0]opcode;
    //opcode parameter
    parameter FETCH =  8'b00000000,//È¡Ö¸Áî
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
    
    initial
    begin
        address = 0;
    end
    
    always@(posedge clk or negedge reset)
    begin
        if(!reset)//reset CAR
        begin
            address = 8'b00000000;
            address_out = address;
        end
        else
        begin
            if(c[0] == 1)//the current instruction is not finished, and carry on the next micro-operation
            begin
                address = address+1;
                address_out = address;
            end
            else if(c[2] == 1)//Fetch a new instruction and reset CAR
            begin
                address = 8'b00000000;
                address_out = address;
            end
            else if(c[1] == 1)//Operate the instruction
            begin
                opcode = IR_out;
                case(opcode)
                    STORE:
                        address = 8'b00100000;
                    LOAD:
                        address = 8'b00010000;
                    ADD:
                        address = 8'b00110000;
                    SUB:
                        address = 8'b01000000;
                    AND:
                        address = 8'b01100000;
                    OR:
                        address = 8'b01110000;
                    NOT:
                        address = 8'b10000000;
                    SHR:
                        address = 8'b10010000;
                    SHL:
                        address = 8'b10100000;
                    MPY:
                        address = 8'b10110000;
                    JMPGEZ:
                    begin
                        if(flag[0]==0)//ACC>=0
                            address = 8'b11110010;
                        else//ACC<0
                            address = 8'b11110000;
                    end
                    JMP:
                        address = 8'b11110010;
                    HALT:
                        address = 8'b01010000;
                    default:;
                endcase
                address_out = address;
            end      
        end
    end
    
endmodule
