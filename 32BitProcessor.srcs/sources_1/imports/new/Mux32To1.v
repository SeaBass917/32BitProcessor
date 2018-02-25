`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineers: Sebastian Thiem, Brian Winkler
// % effort: Sebastian Thiem(50%), Brian Winkler(50%)
// 
// Create Date:    10/11/2017 
// Module Name:    Mux32To1 
// Project Name:   MIPS 32-bit Processor
//
// Description:    A 1-bit 32 to 1 multiplexer, used by the ALU,
//                 to chose an output.
//
//////////////////////////////////////////////////////////////////////////////////
module Mux32x1( in0, in1, in2, in3, in4, in5, in6, in7,
                in8, in9, in10, in11, in12, in13, in14, in15,
                in16, in17, in18, in19, in20, in21, in22, in23,
                in24, in25, in26, in27, in28, in29, in30, in31,
                control,
                                                            out);
    (*keep = "true"*)
                                                            
    input [31:0] in0, in1, in2, in3, in4, in5, in6, in7;
    input [31:0] in8, in9, in10, in11, in12, in13, in14, in15;
    input [31:0] in16, in17, in18, in19, in20, in21, in22, in23; 
    input [31:0] in24, in25, in26, in27, in28, in29, in30, in31;

    input [4:0] control;

    output [31:0] out;

    assign out = (control == 0)? in0 :   (control == 1)? in1 :   (control == 2)? in2 :   (control == 3)? in3 : 
                 (control == 4)? in4 :   (control == 5)? in5 :   (control == 6)? in6 :   (control == 7)? in7 :
                 (control == 8)? in8 :   (control == 9)? in9 :   (control == 10)? in10 : (control == 11)? in11 : 
                 (control == 12)? in12 : (control == 13)? in13 : (control == 14)? in14 : (control == 15)? in15 :   
                 (control == 16)? in16 : (control == 17)? in17 : (control == 18)? in18 : (control == 19)? in19 :   
                 (control == 20)? in20 : (control == 21)? in21 : (control == 22)? in22 : (control == 23)? in23 :  
                 (control == 24)? in24 : (control == 25)? in25 : (control == 26)? in26 : (control == 27)? in27 : 
                 (control == 28)? in28 : (control == 29)? in29 : (control == 30)? in30 : in31;
endmodule
