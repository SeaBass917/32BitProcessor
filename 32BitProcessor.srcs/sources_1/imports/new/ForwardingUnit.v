`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineers: Sebastian Thiem, Brian Winkler
// % effort: Sebastian Thiem(50%), Brian Winkler(50%)
// 
// Create Date:    10/11/2017 
// Module Name:    ForwardingUnit 
// Project Name:   MIPS 32-bit Processor
//
// Description:    Watches for regs from previous instructions and forwards 
//                 their information up the dath if they are writing to a reg 
//                 that the current instruction is reading 
//
//////////////////////////////////////////////////////////////////////////////////
module ForwardingUnit( EX_rs, EX_rt, ID_rs, ID_rt, branch,
                       MEM_regWrite, MEM_rd, WB_regWrite, WB_rd,
                                                                 EX_rsMuxCtrl, EX_rtMuxCtrl, ID_rsMuxCtrl, ID_rtMuxCtrl);
    (*keep = "true"*)
    
    input[4:0] EX_rs;
    input[4:0] EX_rt;
    input[4:0] ID_rs;
    input[4:0] ID_rt;
    input branch;
    input MEM_regWrite;
    input[4:0] MEM_rd;
    input WB_regWrite;
    input[4:0] WB_rd;
    
    output[1:0] EX_rsMuxCtrl;
    output[1:0] EX_rtMuxCtrl;
    output ID_rsMuxCtrl;
    output ID_rtMuxCtrl;
    
    assign EX_rsMuxCtrl = (WB_regWrite  == 1'b1 && WB_rd  == EX_rs && !(MEM_regWrite == 1'b1 && MEM_rd == EX_rs))? 2'b10 :
                          (MEM_regWrite == 1'b1 && MEM_rd == EX_rs)? 2'b01 : 2'b00;
                          
    assign EX_rtMuxCtrl = (WB_regWrite  == 1'b1 && WB_rd  == EX_rt && !(MEM_regWrite == 1'b1 && MEM_rd == EX_rt))? 2'b10 :
                          (MEM_regWrite == 1'b1 && MEM_rd == EX_rt)? 2'b01 : 2'b00;
                          
    assign ID_rsMuxCtrl = (branch == 1'b1 && MEM_regWrite == 1'b1 && MEM_rd == ID_rs)? 1'b1 : 1'b0;
    
    assign ID_rtMuxCtrl = (branch == 1'b1 && MEM_regWrite == 1'b1 && MEM_rd == ID_rt)? 1'b1 : 1'b0;
    
endmodule
