`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit_tb.v
// Description - Test the 'ALU32Bit.v' module.
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit_tb(); 

	reg [31:0] A, B;	    // inputs
	reg [63:0] hiloReg;     // HiLo reg for multiplaication
    reg [4:0] ALUControl;   // control bits for ALU operation
        
    wire [63:0] thiccResult;       // Output for 64 bit values{multiplication}
	wire [31:0] ALUResult;	    // answer
	wire Zero;	                // Zero=1 if ALUResult == 0

    ALU32Bit u0( 
        .A(A), 
        .B(B), 
        .hiloReg(hiloReg),
        .ALUControl(ALUControl),
        .thiccResult(thiccResult),
        .ALUResult(ALUResult), 
        .Zero(Zero)
    );
	 

	initial begin
	
		A[31:0] <= 32'b0101;  // 5
		B[31:0] <= 32'b1010;  // 10
		
        #00 ALUControl <= 5'b00000;   // 0  And == 0
        #20 ALUControl <= 5'b00001;   // 1  Or == 15
        #20 ALUControl <= 5'b00010;   // 2  Xor == 15
        #20 ALUControl <= 5'b00011;   // 3  Nand == -1
        #20 ALUControl <= 5'b00100;   // 4  Nor == -16
        #20 ALUControl <= 5'b00101;   // 5  Xnor == -16
        #20 ALUControl <= 5'b00110;   // 6  Add == 15
        #20 ALUControl <= 5'b00111;   // 7  Sub == -5
        #20 ALUControl <= 5'b01000;   // 8  Mul == 50
        #01 hiloReg = thiccResult;        // -- Update the hilo reg --
        #19 ALUControl <= 5'b01001;   // 9  Mul and Add == 100
        #01 hiloReg <= thiccResult;        // -- Update the hilo reg --
        #19 ALUControl <= 5'b01010;   // 10 Mul and Sub == 50
        #01 hiloReg <= thiccResult;        // -- Update the hilo reg --
        #19 ALUControl <= 5'b01011;   // 11 Set on less than == 1
        #20 ALUControl <= 5'b01100;   // 12 Set on equal to or less than == 1
        #20 ALUControl <= 5'b01101;   // 13 Set on greater than == 0
        #20 ALUControl <= 5'b01110;   // 14 Set on equal to or greater than == 0
        #20 ALUControl <= 5'b01111;   // 15 Shift logical left == 5120
        #20 ALUControl <= 5'b10000;   // 16 Shift logical right == 0
        #20 ALUControl <= 5'b10001;   // 17 Shift arithmatic right == 0
        #20 ALUControl <= 5'b10010;   // 18 Sign extend byte == 5
        #20 ALUControl <= 5'b10011;   // 19 Sign extend half == 5
        #20 ALUControl <= 5'b10100;   // 20 Rotate Right == 20 971 520
        #20 ALUControl <= 5'b10101;   // 21 (B == 0)? == 0
        #20 ALUControl <= 5'b10110;   // 22 (B != 0)? == 1
        #20 B <= 32'b0101000000;      // B[10:6] == 5;
            A <= (32'b11111111111111111111111111111111);            // A = -1
            ALUControl <= 5'b10111;   // 23 A << B[10:6] == -32
        #20 ALUControl <= 5'b11000;   // 24 A >> B[10:6] == ?134 217 727?
        #20 ALUControl <= 5'b11001;   // 25 A >>> B[10:6] == -1
        #20 ALUControl <= 5'b11010;   // 0
        #20 ALUControl <= 5'b11011;   // 0    
        #20 ALUControl <= 5'b11100;   // 0
        #20 ALUControl <= 5'b11101;   // 0
        #20 ALUControl <= 5'b11110;   // 0
        #20 ALUControl <= 5'b11111;   // 0
	end

endmodule

