`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineers: Sebastian Thiem, Brian Winkler
// % effort: Sebastian Thiem(50%), Brian Winkler(50%)
// 
// Create Date:    10/11/2017 
// Module Name:    HazardControl 
// Project Name:   MIPS 32-bit Processor
//
// Description:    Controls all stalls and flushes needed to prevent data hazards
//
//////////////////////////////////////////////////////////////////////////////////
module HazardControl(rs, rt, branch, pcSrc_EX, rd_EX, memRead_EX, regWrite_EX, rd_MEM, memRead_MEM, 
                                                                                        ctrlMuxStall, IFIDStall, PCStall);
   (*keep = "true"*)        
                                                                                
   input[4:0] rs;
   input[4:0] rt;
   input branch;
   input pcSrc_EX;
   input[4:0] rd_EX;
   input memRead_EX;
   input regWrite_EX;
   input[4:0] rd_MEM;
   input memRead_MEM;
   
   wire stall;
   wire flush;
   
   output ctrlMuxStall;
   output IFIDStall;
   output PCStall;
   
   assign stall = ( ((memRead_EX  == 1'b1 || (branch == 1'b1 && regWrite_EX == 1'b1)) && (rd_EX  == rs || rd_EX  == rt)) ||
                    ((memRead_MEM == 1'b1 && branch == 1'b1) && (rd_MEM == rs || rd_MEM == rt))    )? 1'b1 : 1'b0;
                   
   assign flush = pcSrc_EX;
   
   
   assign ctrlMuxStall = (stall || flush)? 1'b1 : 1'b0;
   
   assign IFIDStall    = (stall && !flush)? 1'b1 : 1'b0;
   
   assign PCStall      = (stall && !flush)? 1'b1 : 1'b0;
      
endmodule
