`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2017 08:16:36 AM
// Design Name: 
// Module Name: HiLoReg_tb
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


module HiLoReg_tb();
    reg CLK;
    reg [63:0] HiLo; 
    
    wire [63:0] HiLoOut;
    
    HiLoReg u0(
        .CLK(CLK),
        .HiLo(HiLo),
        .HiLoOut(HiLoOut)
    );
    
    initial begin
        CLK <= 1'b0;
        forever #50 CLK <= ~CLK;
    end
    
    always @(*) begin
        #50 HiLo <= 16'h0;
        #50 HiLo <= 16'h1;
        #50 HiLo <= 16'h5;
        #50 HiLo <= 16'h3;
        #50 HiLo <= 16'h2;
        #50 HiLo <= 16'h4;          
    end
    
endmodule
