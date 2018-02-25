`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineers: Sebastian Thiem, Brian Winkler
// % effort: Sebastian Thiem(50%), Brian Winkler(50%)
// 
// Create Date:    10/11/2017 
// Module Name:    PipelineRegIF_ID 
// Project Name:   MIPS 32-bit Processor
//
// Description:    A pipline register from the Instruction Fetch stage, 
//                 to the Instruction Decode stage. 
//
//////////////////////////////////////////////////////////////////////////////////
module PipelineRegIF_ID(CLK, RST, IFIDStall,
                        PCAddResult_In, instruction_In,
                        
                        PCAddResult_Out, instruction_Out);
    (*keep = "true"*)
    
	input CLK;
	input RST;
	input IFIDStall;
	
	input [31:0] instruction_In;
	input [31:0] PCAddResult_In;
	
	output reg [31:0] instruction_Out;
	output reg [31:0] PCAddResult_Out;
	
	initial begin
        instruction_Out <= 32'b0;
        PCAddResult_Out <= 32'b0;
	end
	
    always@(posedge CLK) begin
        if( !RST ) begin
            if( !IFIDStall ) begin
                instruction_Out <= instruction_In;
                PCAddResult_Out <= PCAddResult_In;
            end
        end
        else begin
            instruction_Out <= 32'b0;
            PCAddResult_Out <= 32'b0;
        end
    end
	
endmodule
