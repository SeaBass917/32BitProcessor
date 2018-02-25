`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineers: Sebastian Thiem, Brian Winkler
// % effort: Sebastian Thiem(50%), Brian Winkler(50%)
// 
// Create Date:    10/11/2017 
// Module Name:    PipeLineRegEX_MEM 
// Project Name:   MIPS 32-bit Processor
//
// Description:    A pipline register from the Execution stage, 
//                 to the Memory stage.  
//
//////////////////////////////////////////////////////////////////////////////////
module PipelineRegEX_MEM(   CLK, RST, 
                            regWrite_In, memToReg_In, memWrite_In, memRead_In, dataSelWrite_In,
                            EXEResult_In, dataWriteMem_In, upperImmediate_In, regDest_In, 
                            
                            regWrite_Out, memToReg_Out, memWrite_Out, memRead_Out, dataSelWrite_Out,
                            EXEResult_Out, dataWriteMem_Out, upperImmediate_Out, regDest_Out);	
    (*keep = "true"*)
    
    input CLK;
    input RST;
    
    // WB
    input regWrite_In; 
    input[1:0] memToReg_In;
    
    // MEM
    input memWrite_In; 
    input memRead_In; 
    input[1:0] dataSelWrite_In;
    
    input[31:0] EXEResult_In; 
    input[31:0] dataWriteMem_In; 
    input[31:0] upperImmediate_In;
    input[4:0] regDest_In;
    
    // WB
    output reg regWrite_Out; 
    output reg[1:0] memToReg_Out;
    
    // MEM
    output reg memWrite_Out; 
    output reg memRead_Out; 
    output reg[1:0] dataSelWrite_Out;
    
    output reg[31:0] EXEResult_Out; 
    output reg[31:0] dataWriteMem_Out; 
    output reg[31:0] upperImmediate_Out;
    output reg[4:0] regDest_Out;
    
    initial begin
        // WB
        regWrite_Out = 1'b0;
        memToReg_Out = 2'b0;
        
        // MEM
        memWrite_Out = 1'b0; 
        memRead_Out = 1'b0; 
        dataSelWrite_Out = 2'b0;
        
        EXEResult_Out = 32'b0; 
        dataWriteMem_Out = 32'b0; 
        upperImmediate_Out = 32'b0;
        regDest_Out = 5'b0;
    end
    
    always@(posedge CLK) begin
        if ( !RST ) begin
            // WB
            regWrite_Out <= regWrite_In;
            memToReg_Out <= memToReg_In;
            
            // MEM
            memWrite_Out <= memWrite_In;
            memRead_Out <= memRead_In;
            dataSelWrite_Out <= dataSelWrite_In;
            
            EXEResult_Out <= EXEResult_In;
            dataWriteMem_Out <= dataWriteMem_In;
            upperImmediate_Out <= upperImmediate_In;
            regDest_Out <= regDest_In;
        end
        else begin
            // WB
            regWrite_Out = 1'b0;
            memToReg_Out = 2'b0;
            
            // MEM
            memWrite_Out = 1'b0; 
            memRead_Out = 1'b0; 
            dataSelWrite_Out = 2'b0;
            
            EXEResult_Out = 32'b0; 
            dataWriteMem_Out = 32'b0; 
            upperImmediate_Out = 32'b0;
            regDest_Out = 5'b0;
        end
    end
    
endmodule
