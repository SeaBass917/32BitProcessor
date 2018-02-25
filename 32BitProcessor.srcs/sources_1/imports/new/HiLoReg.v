`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineers: Sebastian Thiem, Brian Winkler
// % effort: Sebastian Thiem(50%), Brian Winkler(50%)
// 
// Create Date:    10/11/2017 
// Module Name:    HiLoReg 
// Project Name:   MIPS 32-bit Processor
//
// Description:    The 64-bit register, used for multiplication operations.
//
//////////////////////////////////////////////////////////////////////////////////
module HiLoReg(CLK, HiLo, HiLoOut);

    (*keep = "true"*)       
    
	input CLK;
	input [63:0]HiLo;
	output reg [63:0]HiLoOut;
	
	always@(negedge CLK) begin
	   HiLoOut <= HiLo;
	end
	
endmodule
