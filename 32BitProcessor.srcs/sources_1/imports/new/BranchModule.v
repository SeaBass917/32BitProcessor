`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineers: Sebastian Thiem, Brian Winkler
// % effort: Sebastian Thiem(50%), Brian Winkler(50%)
// 
// Create Date:    10/11/2017 
// Module Name:    BranchModule
// Project Name:   MIPS 32-bit Processor
//
// Description:    This module handles branching logic, 
//                 and the branch control signals
//
//////////////////////////////////////////////////////////////////////////////////
module BranchModule(rs, rt, immi, PCAddResult, Control,
                                    PCSrc, addResult, jal);
    (*keep = "true"*)
    
    input[31:0] rs;
    input[31:0] rt;
    input[31:0] immi;
    input[31:0] PCAddResult;
    input[4:0] Control;
    output PCSrc;
    output[31:0] addResult;
    output jal;
    
    // will be high if the conditional branch is requested and condition is met, or is unconditional branch
    // so PCSrc only tru when branch control is high, and condition is met
    assign PCSrc =      (Control == 5'b10000 && $signed(rs) == $signed(rt))?     1'b1 :
                        (Control == 5'b10001 && $signed(rs) != $signed(rt))?     1'b1 :
                        (Control == 5'b10010 && $signed(rs) >= $signed(32'b0))?  1'b1 :
                        (Control == 5'b10011 && $signed(rs) > $signed(32'b0))?   1'b1 :
                        (Control == 5'b10100 && $signed(rs) <= $signed(32'b0))?  1'b1 :
                        (Control == 5'b10101 && $signed(rs) < $signed(32'b0))?   1'b1 :
                        (Control == 5'b10110)?                 1'b1 :
                        (Control == 5'b10111)?                 1'b1 :
                        (Control == 5'b11000)?                 1'b1 : 
                        1'b0;
    
    // is its a j then jump by immi fiel *4 or $ra, else for any other branch do normal adding
    assign addResult =  (Control == 5'b10110)? immi[25:0] << 2 :  
                        (Control == 5'b10111)? rs : 
                        (Control == 5'b11000)? immi[25:0] << 2 :  
                        PCAddResult + ({{16{immi[15]}}, {immi[15:0]}} << 2);
    
    // if is JAL instuction, output that signal             
    assign jal = (Control == 5'b11000)? 1'b1 : 1'b0;
    
endmodule
