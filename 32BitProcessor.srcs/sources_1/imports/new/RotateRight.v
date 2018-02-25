`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineers: Sebastian Thiem, Brian Winkler
// % effort: Sebastian Thiem(50%), Brian Winkler(50%)
// 
// Create Date:    10/11/2017 
// Module Name:    RotateRight 
// Project Name:   MIPS 32-bit Processor
//
// Description:    Rotates a word right by a given amount, used by the ALU. 
//
//////////////////////////////////////////////////////////////////////////////////
module RotateRight( value, amount, 
                                    out);
    (*keep = "true"*)
    
    input[31:0] value, amount;
    
    output[31:0] out;
    
    assign out = (value >> amount[4:0] | value << ~amount[4:0]);
     
endmodule
