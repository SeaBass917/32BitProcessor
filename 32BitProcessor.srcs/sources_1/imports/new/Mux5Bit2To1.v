`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineers: Sebastian Thiem, Brian Winkler
// % effort: Sebastian Thiem(50%), Brian Winkler(50%)
// 
// Create Date:    10/11/2017 
// Module Name:    Mux5Bit2To1 
// Project Name:   MIPS 32-bit Processor
//
// Description:    A 5-bit 2 to 1 multiplexer 
//
//////////////////////////////////////////////////////////////////////////////////
module Mux5Bit2To1(In0, In1, Ctrl,
                            Out);
    (*keep = "true"*)
    
    input [4:0] In0;
    input [4:0] In1;
    input Ctrl;
    output [4:0] Out;
    
    assign Out = (Ctrl)? In1 : In0;
    
endmodule
