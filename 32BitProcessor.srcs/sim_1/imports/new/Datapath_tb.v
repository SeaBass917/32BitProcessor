`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////////
// Engineer: Sebastian Thiem, Brian Winkler
// % effort: Sebastian Thiem(50%), Brian Winkler(50%)
// 
// Create Date: 10/07/2017 06:49:43 PM
// Design Name: 
// Module Name: Datapath_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module Datapath_tb();
        
    reg CLK, RST;
    
    wire[31:0] OUTVAL;  
    wire [31:0] HI;
    wire [31:0] LO;
    wire [4:0] REGADDR;   
    wire REGWRITE; 
    wire[31:0] A, B;
    
    Datapath u0(
        .CLK(CLK),
        .RST(RST),
        .OUTVAL(OUTVAL),
        .HI(HI),
        .LO(LO),
        .REGADDR(REGADDR),
        .REGWRITE(REGWRITE),
        .A(A),
        .B(B)
        );

    initial begin
        CLK <= 1'b0; RST <= 1'b1;
        #50 CLK <= 1'b1;
        #50 CLK <= 1'b0;
        #50 CLK <= 1'b1;
        #50 CLK <= 1'b0;
        #50 CLK <= 1'b1;
        #50 CLK <= 1'b0;
        #50 CLK <= 1'b1;
        #50 CLK <= 1'b0;
        #50 CLK <= 1'b1; RST <= 1'b0;
        forever #50 CLK <= ~CLK;
    end
         
endmodule
