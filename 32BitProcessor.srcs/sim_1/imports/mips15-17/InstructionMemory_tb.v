`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 
// Module - InstructionMemory_tb.v
// Description - Test the 'InstructionMemory_tb.v' module.
////////////////////////////////////////////////////////////////////////////////

module InstructionMemory_tb(); 

    reg [31:0] Address;
    
    wire [31:0] Instruction;

	InstructionMemory u0(
		.Address(Address),
        .Instruction(Instruction)
	);
    
	initial begin
	   #0  Address <= 32'd0;
	   #10 Address <= 32'd4;
	   #10 Address <= 32'd8;
       #10 Address <= 32'd12;
       #10 Address <= 32'd16;
       #10 Address <= 32'd20;
       #10 Address <= 32'd24;
       #10 Address <= 32'd28;
       #10 Address <= 32'd32;
       #10 Address <= 32'd36;
       #10 Address <= 32'd40;
       #10 Address <= 32'd44;
       #10 Address <= 32'd48;
       #10 Address <= 32'd52;
       #10 Address <= 32'd56;
       #10 Address <= 32'd60;
	end

endmodule
