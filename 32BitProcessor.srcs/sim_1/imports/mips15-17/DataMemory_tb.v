`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - DataMemory_tb.v
// Description - Test the 'DataMemory.v' module.
////////////////////////////////////////////////////////////////////////////////

module DataMemory_tb(); 

    reg     [31:0]  Address;
    reg     [31:0]  WriteData;
    reg             Clk;
    reg             MemWrite;
    reg             MemRead;

    wire [31:0] ReadData;

    DataMemory u0(
        .Address(Address), 
        .WriteData(WriteData), 
        .Clk(Clk), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead), 
        .ReadData(ReadData)
    ); 

	initial begin
		Clk <= 1'b0;
		forever #50 Clk <= ~Clk;
	end

	initial begin
	#0  Address <= 32'b111100; 
		WriteData <= 32'b011000; 
		MemWrite <= 1'b0; 
		MemWrite <= 1'b0;
		MemRead <= 1'b0;
	#100 MemWrite <= 1'b1; 
	#100 MemWrite <= 1'b0; 
		 MemRead <= 1'b1;
	#100 Address <= 32'b111000; 
		 WriteData <= 32'b1010;
	#100 MemWrite <= 1'b1;
	#100 MemWrite <= 1'b0;
	#200 Address <= 32'b111100;  
	
	end

endmodule

