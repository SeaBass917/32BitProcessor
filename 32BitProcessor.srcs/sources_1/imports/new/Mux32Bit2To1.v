`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineers: Sebastian Thiem, Brian Winkler
// % effort: Sebastian Thiem(50%), Brian Winkler(50%)
// 
// Create Date:    10/11/2017 
// Module Name:    Mux32Bit2To1 
// Project Name:   MIPS 32-bit Processor
//
// Description:    A 32-bit 2 to 1 multiplexer 
//
//////////////////////////////////////////////////////////////////////////////////
module Mux32Bit2To1(inA, inB, sel,
                                   out);
    (*keep = "true"*)
    
    input [31:0] inA;
    input [31:0] inB;
    input sel;
    
    output reg [31:0] out;
    
    always@* begin
        if(sel) begin
            out <= inB;
        end
        else begin
            out <= inA;
        end
    end
    
endmodule
