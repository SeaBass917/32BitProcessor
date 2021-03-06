`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 1
// Module - ProgramCounter_tb.v
// Description - Test the 'ProgramCounter.v' module.
////////////////////////////////////////////////////////////////////////////////

module ProgramCounter_tb(); 

	reg [31:0] Address;
	reg Reset, Clk;

	wire [31:0] PCResult;
	
	integer i;

    ProgramCounter u0(
        .Address(Address), 
        .PCResult(PCResult), 
        .Reset(Reset), 
        .Clk(Clk)
    );

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	   
	   #0  Address <= 32'd0; Reset <= 0;
	   #10 Address <= 32'd4; 
	   #10 Address <= 32'd8;
	   #10 Address <= 32'd12; 
	   #10 Address <= 32'd16; 
	   #10 Reset <= 1;
       #10 Address <= 32'd20;
       #10 Address <= 32'd24; 
       #10 Reset <= 0;
	end

endmodule

