`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineers: Sebastian Thiem, Brian Winkler
// % effort: Sebastian Thiem(50%), Brian Winkler(50%)
// 
// Create Date:    10/11/2017 
// Module Name:    PipeLineRegID_EX 
// Project Name:   MIPS 32-bit Processor
//
// Description:    A pipline register from the Instruction Decode stage, 
//                 to the Execution stage.  
//
//////////////////////////////////////////////////////////////////////////////////
module PipeLineRegID_EX(CLK, RST,
                        movCtrl_In, funct_In,
                        pcSrc_In,
                        regWrite_In, memToReg_In, memWrite_In, memRead_In, ALUSrcA_In, ALUSrcB_In, ALUOutMux_In, 
                        signMux_In, hiloMux_In, dataSelWrite_In, ALUCtrl_In, regDst_In, 
                        readData1_In, readData2_In, signExtend_In, upperImmediate_In, rs_In, rt_In, rd_In,
						
						movCtrl_Out, funct_Out,
						pcSrc_Out,
						regWrite_Out, memToReg_Out, memWrite_Out, memRead_Out, ALUSrcA_Out, ALUSrcB_Out, ALUOutMux_Out, 
						signMux_Out, hiloMux_Out, dataSelWrite_Out, ALUCtrl_Out, regDst_Out,
						readData1_Out, readData2_Out, signExtend_Out, upperImmediate_Out, rs_Out, rt_Out, rd_Out);
						
        (*keep = "true"*)
        
        input CLK;
        input RST;
        
        input[1:0] movCtrl_In;
        input[5:0] funct_In;
        
        input pcSrc_In;
        
        // WB
        input regWrite_In; 
        input[1:0] memToReg_In;
        
        // MEM
        input memWrite_In; 
        input memRead_In; 
        
        // EX
        input ALUSrcA_In;
        input ALUSrcB_In;
        input ALUOutMux_In;
        input signMux_In;
        input hiloMux_In;
        input[1:0] dataSelWrite_In;
        input[4:0] ALUCtrl_In;
        input regDst_In;
        
        input[31:0] readData1_In;
        input[31:0] readData2_In;
        input[31:0] signExtend_In;
        input[31:0] upperImmediate_In;
        input[4:0] rs_In;
        input[4:0] rt_In;
        input[4:0] rd_In;
        
        output reg[1:0] movCtrl_Out;
        output reg[5:0] funct_Out;
        
        output reg pcSrc_Out;
        
        // WB
        output reg regWrite_Out; 
        output reg[1:0] memToReg_Out;
        
        // MEM
        output reg memWrite_Out; 
        output reg memRead_Out; 
        
        // EX
        output reg ALUSrcA_Out;
        output reg ALUSrcB_Out;
        output reg ALUOutMux_Out;
        output reg signMux_Out;
        output reg hiloMux_Out;
        output reg[1:0] dataSelWrite_Out;
        output reg[4:0] ALUCtrl_Out;
        output reg regDst_Out;
        
        output reg[31:0] readData1_Out;
        output reg[31:0] readData2_Out;
        output reg[31:0] signExtend_Out;
        output reg[31:0] upperImmediate_Out;
        output reg[4:0] rs_Out;
        output reg[4:0] rt_Out;
        output reg[4:0] rd_Out;
        
        initial begin
            movCtrl_Out <= 2'b0;
            funct_Out <= 6'b0;
            
            pcSrc_Out <= 1'b0;
            
            // WB
            regWrite_Out <= 1'b0; 
            memToReg_Out <= 1'b0;
            
            // MEM
            memWrite_Out <= 1'b0; 
            memRead_Out <= 1'b0; 
            
            // EX
            ALUSrcA_Out <= 1'b0;
            ALUSrcB_Out <= 1'b0;
            ALUOutMux_Out <= 1'b0;
            signMux_Out <= 1'b0;
            hiloMux_Out <= 1'b0;
            dataSelWrite_Out <= 2'b0;
            ALUCtrl_Out <= 5'b0;
            regDst_Out <= 1'b0;
            
            readData1_Out <= 32'b0;
            readData2_Out <= 32'b0;
            signExtend_Out <= 32'b0;
            upperImmediate_Out <= 32'b0;
            rs_Out <= 5'b0;
            rt_Out <= 5'b0;
            rd_Out <= 5'b0;
        end
        
        always@(posedge CLK) begin
            if( !RST ) begin
                movCtrl_Out <= movCtrl_In;
                funct_Out <= funct_In;
                
                pcSrc_Out <= pcSrc_In;
                
                // WB
                regWrite_Out <= regWrite_In;
                memToReg_Out <= memToReg_In;
                
                // MEM
                memWrite_Out <= memWrite_In;
                memRead_Out <= memRead_In;
                
                // EX
                ALUSrcA_Out <= ALUSrcA_In;
                ALUSrcB_Out <= ALUSrcB_In;
                ALUOutMux_Out <= ALUOutMux_In;
                signMux_Out <= signMux_In;
                hiloMux_Out <= hiloMux_In;
                dataSelWrite_Out <= dataSelWrite_In;
                ALUCtrl_Out <= ALUCtrl_In;
                regDst_Out <= regDst_In;
                            
                readData1_Out <= readData1_In;
                readData2_Out <= readData2_In;
                signExtend_Out <= signExtend_In;
                upperImmediate_Out <= upperImmediate_In;
                rs_Out <= rs_In;
                rt_Out <= rt_In;
                rd_Out <= rd_In;
            end
            else begin
                movCtrl_Out = 2'b0;
                funct_Out = 6'b0;
                
                pcSrc_Out <= 1'b0;
                
                // WB
                regWrite_Out = 1'b0; 
                memToReg_Out = 1'b0;
                
                // MEM
                memWrite_Out = 1'b0; 
                memRead_Out = 1'b0; 
                
                // EX
                ALUSrcA_Out = 1'b0;
                ALUSrcB_Out = 1'b0;
                ALUOutMux_Out = 1'b0;
                signMux_Out = 1'b0;
                hiloMux_Out = 1'b0;
                dataSelWrite_Out = 2'b0;
                ALUCtrl_Out = 5'b0;
                regDst_Out = 1'b0;
                
                readData1_Out = 32'b0;
                readData2_Out = 32'b0;
                signExtend_Out = 32'b0;
                upperImmediate_Out = 32'b0;
                rs_Out = 5'b0;
                rt_Out = 5'b0;
                rd_Out = 5'b0;    
            end
        end

endmodule
