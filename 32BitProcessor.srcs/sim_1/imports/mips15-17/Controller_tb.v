`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:03:52 10/15/2017 
// Design Name: 
// Module Name:    Controller 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module Controller_tb();
    
    reg[31:0] instruction;
    wire[20:0] ctrlOut;
    
    Controller u0(
    .instruction(instruction), 
    .ctrlOut(ctrlOut)
    );
    
    initial begin
        
        instruction <= 32'b00000000000000000000000000100000;    // ADD
        instruction <= 32'b00100100000000000000000000000000;    // ADDIU
        instruction <= 32'b00000000000000000000000000100001;    // ADDU
        instruction <= 32'b00000000000000000000000000000000;    // SLL
        instruction <= 32'b00000000000000000000000000000010;    // SRL
        instruction <= 32'b00000000001000000000000000000010;    // ROTR
        instruction <= 32'b00000000000000000000000000000110;    // SRLV
                                                                                                           
        instruction <= 32'b00000000000000000000000001000110;    // ROTRV    
    end
    
endmodule
