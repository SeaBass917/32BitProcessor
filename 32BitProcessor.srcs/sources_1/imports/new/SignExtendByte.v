`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineers: Sebastian Thiem, Brian Winkler
// % effort: Sebastian Thiem(50%), Brian Winkler(50%)
// 
// Create Date:    10/11/2017 
// Module Name:    SignExtendByte 
// Project Name:   MIPS 32-bit Processor
//
// Description:    Extends a 8-bit input to a 32-bit output signed 
//
//////////////////////////////////////////////////////////////////////////////////
module SignExtendByte(In,
                        Out);
    (*keep = "true"*)
    
    input [7:0] In;
    output [31:0] Out;
    
    assign Out = {{24{In[7]}}, {In}};
    
endmodule
