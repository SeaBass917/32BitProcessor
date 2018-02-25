`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineers: Sebastian Thiem, Brian Winkler
// % effort: Sebastian Thiem(50%), Brian Winkler(50%)
// 
// Create Date:    10/11/2017 
// Module Name:    Mux32Bit4To1 
// Project Name:   MIPS 32-bit Processor
//
// Description:    A 32-bit 4 to 1 multiplexer 
//
//////////////////////////////////////////////////////////////////////////////////
module Mux32Bit4To1(In0, In1, In2, In3, 
                    ctrl, 
                                        Out);
    (*keep = "true"*)     
               
    input[31:0] In0, In1, In2, In3;
    input[1:0] ctrl;
    
    output[31:0] Out;
    
    assign Out = 
                (ctrl == 0) ? In0 :
                (ctrl == 1) ? In1 :
                (ctrl == 2) ? In2 :
                In3;
endmodule
