`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineers: Sebastian Thiem, Brian Winkler
// % effort: Sebastian Thiem(50%), Brian Winkler(50%)
// 
// Create Date:    10/11/2017 
// Module Name:    PipeLineRegMEM_WB 
// Project Name:   MIPS 32-bit Processor
//
// Description:    A pipline register from the Memory stage, 
//                 to the Write Back stage.  
//
//////////////////////////////////////////////////////////////////////////////////
module PipelineRegMEM_WB(CLK, RST,
                            regWrite_In, memToReg_In, 
                            readData_In, EXEResult_In, upperImmediate_In, regDest_In, 
                            
                            regWrite_Out, memToReg_Out, 
                            readData_Out, EXEResult_Out, upperImmediate_Out, regDest_Out);
	(*keep = "true"*)
	
	input CLK;
	input RST;
	
	// WB
	input regWrite_In; 
    input[1:0] memToReg_In; 
    
    input[31:0] readData_In; 
    input[31:0] EXEResult_In; 
    input[31:0] upperImmediate_In;
    input[4:0] regDest_In;
	
	// WB
	output reg regWrite_Out; 
    output reg[1:0] memToReg_Out; 
    
    output reg[31:0] readData_Out; 
    output reg[31:0] EXEResult_Out; 
    output reg[31:0] upperImmediate_Out;
    output reg[4:0] regDest_Out;
    
    initial begin
        // WB
        regWrite_Out = 1'b0; 
        memToReg_Out = 2'b0; 
        
        readData_Out = 32'b0; 
        EXEResult_Out = 32'b0; 
        upperImmediate_Out = 32'b0;
        regDest_Out = 5'b0;
    end
	
	always@(posedge CLK) begin
	   if( !RST ) begin
            // WB
            regWrite_Out <= regWrite_In;
            memToReg_Out <= memToReg_In; 
            
            readData_Out <= readData_In; 
            EXEResult_Out <= EXEResult_In; 
            upperImmediate_Out <= upperImmediate_In;
            regDest_Out <= regDest_In;
        end
        else begin
            // WB
            regWrite_Out = 1'b0; 
            memToReg_Out = 2'b0; 
            
            readData_Out = 32'b0; 
            EXEResult_Out = 32'b0; 
            upperImmediate_Out = 32'b0;
            regDest_Out = 5'b0;
        end
	end
	
endmodule
