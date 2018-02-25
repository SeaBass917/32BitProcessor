`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - RegisterFile.v
// Description - Test the register_file
// Suggested test case - First write arbitrary values into 
// the saved and temporary registers (i.e., register 8 through 25). Then, 2-by-2, 
// read values from these registers.
////////////////////////////////////////////////////////////////////////////////


module RegisterFile_tb();

	reg [4:0] ReadRegister1;
	reg [4:0] ReadRegister2;
	reg [4:0] WriteRegister;
	reg [31:0] WriteData;
	reg RegWrite;
	reg Clk;

	wire [31:0] ReadData1;
	wire [31:0] ReadData2;


	RegisterFile u0(
		.ReadRegister1(ReadRegister1), 
		.ReadRegister2(ReadRegister2), 
		.WriteRegister(WriteRegister), 
		.WriteData(WriteData), 
		.RegWrite(RegWrite), 
		.Clk(Clk), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2)
	);

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end
	
	initial begin

		RegWrite <= 1'b0;
		ReadRegister1 <= 4'b10; 
		ReadRegister2 <= 4'h01; 
		WriteData <= 32'h00000100; 
		WriteRegister <= 5'b0; 
		
		#100 RegWrite <= 1'b1; 	WriteData <= 32'h00011100; 

		#100 RegWrite <= 1'b0;
		#100 RegWrite <= 1'b1;
	end

endmodule
