`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineers: Sebastian Thiem, Brian Winkler
// % effort: Sebastian Thiem(50%), Brian Winkler(50%)
// 
// Create Date:    10/11/2017 
// Module Name:    MovComponent
// Project Name:   MIPS 32-bit Processor
//
// Description:    This module handles the movn and movz instruction logic.
//
//////////////////////////////////////////////////////////////////////////////////
module MovComponent(rtIn, functIn, movSel, movOut);
    
    (*keep = "true"*)
    
	input [31:0]rtIn;
	input [5:0]functIn;
	input [1:0]movSel;
	output movOut;
	
	wire movz;
    wire movn;
    
    assign movz = (rtIn == 0)? 1'b1 : 1'b0;
    assign movn = (rtIn != 0)? 1'b1 : 1'b0;
    
	assign movOut = (movSel == 2'b10)? movz : (movSel == 2'b01)? movn : 1'b0;
	
endmodule
