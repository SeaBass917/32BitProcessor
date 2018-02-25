`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineers: Sebastian Thiem, Brian Winkler
// % effort: Sebastian Thiem(50%), Brian Winkler(50%)
// 
// Create Date:    10/11/2017 
// Module Name:    LowerHalfExtender 
// Project Name:   MIPS 32-bit Processor
//
// Description:    Extends a 16-bit input to a 32-bit output with 16 0's
//                 concattenated to the end.
//
//////////////////////////////////////////////////////////////////////////////////
module LowerHalfExtender(In, 
                            Out );
    (*keep = "true"*)
    
    input [15:0] In;
    output [31:0] Out;
    
    assign Out = {{In},{16'b0}};
    
endmodule
