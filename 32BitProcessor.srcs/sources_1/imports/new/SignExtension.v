`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineers: Sebastian Thiem, Brian Winkler
// % effort: Sebastian Thiem(50%), Brian Winkler(50%)
// 
// Create Date:    10/11/2017 
// Module Name:    SignExtension 
// Project Name:   MIPS 32-bit Processor
//
// Description:    Extends a 16-bit input to a 32-bit output signed 
//
//////////////////////////////////////////////////////////////////////////////////
module SignExtension(in, 
                        out);
    (*keep = "true"*)
    
    // A 16-Bit input word 
    input [15:0] in;
    
    // A 32-Bit output word 
    output [31:0] out;
    
    // Assign 'out' to be a 32 bit number that concatenates 16 itterations of the 
    // first bit of 'in' + the 16bits of 'in'
    assign out = {{16{in[15]}}, {in[15:0]}};

endmodule
