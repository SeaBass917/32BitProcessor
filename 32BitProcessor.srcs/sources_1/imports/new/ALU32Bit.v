`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// Engineers: Sebastian Thiem & Brian Winlker
// % effort:  Sebastian Thiem(50%) & Brian Winlker(50%)
//
// INPUTS:-
// ALUControl: 4-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU behaviorally, so that it supports addition,  subtraction,
// AND, OR, and set on less than (SLT). The 'ALUResult' will output the 
// corresponding result of the operation based on the 32-Bit inputs, 'A', and 
// 'B'. The 'Zero' flag is high when 'ALUResult' is '0'. The 'ALUControl' signal 
// should determine the function of the ALU based on the table below:-
// Op   | 'ALUControl' value
// ==========================
// ADD  | 0010
// SUB  | 0110
// AND  | 0000
// OR   | 0001
// SLT  | 0111
//
// NOTE:-
// SLT (i.e., set on less than): ALUResult is '32'h000000001' if A < B.
// 
////////////////////////////////////////////////////////////////////////////////
module ALU32Bit(A, B, hiloReg, 
                ALUControl,  
                            thiccResult, ALUResult);                  
    (*keep = "true"*)                        
    
    input[4:0] ALUControl;     // control bits for ALU operation
    input[31:0] A, B;          // input
    input[63:0] hiloReg;       // High and low registers from outside the ALU
    
    wire[63:0] mulFull;        // 64 bit wire used for multiplications
    wire[63:0] mult;
    wire[63:0] multu;
    wire[31:0] mul;
    wire[31:0] andi;
    wire[31:0] rotOutV;
    wire[31:0] addiu;
    wire[4:0] sa;
    wire[31:0] rotOut;     // Wire connected to the rotation module
    wire[31:0] ori;
    
    wire[31:0] bufferOut;  // needs to buffer for the calc of zero
    
    output[63:0] thiccResult;  // 64 bit output sent to two 32bit hi ad lo registers
    output[31:0] ALUResult;    // answer
    
    RotateRight RotateRight_0(A, B[10:6]-1 , rotOut);
    RotateRight RotateRight_1(B, A-1, rotOutV);
    
    assign mulFull = $signed(A)*$signed(B);
    assign mul = mulFull[31:0];
    assign mult = $signed(A)*$signed(B);
    assign multu = A * B;
    assign andi = A & {{16'b0},{B[15:0]}};
    assign sa = B[10:6]; 
    assign ori = A | {{16'b0}, {B[15:0]}};
    
    Mux32x1 Mux32x1_0(  
    /*00 00000*/ A & B,                 	    // AND
    /*01 00001*/ A | B,                 	    // OR
    /*02 00010*/ A ^ B,                  	    // XOR
    /*03 00011*/ A,               	            // A bypass
    /*04 00100*/ ~(A | B),               	    // NOR
    /*05 00101*/ ori,                           // ori
    /*06 00110*/ A + B,                  	    // ADD
    /*07 00111*/ A - B,                  	    // SUB
    /*08 01000*/ mul,                    	    // MUL
    /*09 01001*/ 32'b1,                    	    // MADD
    /*10 01010*/ 32'b1,                    	    // MSUB
    /*11 01011*/ (A < B)? 32'b1 : 32'b0,    	// SLT
    /*12 01100*/ (A <= B)? 32'b1 : 32'b0,   	// SLTE
    /*13 01101*/ (A > B)? 32'b1 : 32'b0,    	// SGT
    /*14 01110*/ (A >= B)? 32'b1 : 32'b0,   	// SGTE
    /*15 01111*/ B << A[4:0],                  	// SLLV
    /*16 10000*/ B >> A[4:0],                  	// SLRV
    /*17 10001*/ $signed(B) >>> $signed(A[4:0]),   // SRAV
    /*18 10010*/ {{24{B[7]}}, {B[7:0]}},  		// EXTEND BYTE
    /*19 10011*/ {{16{B[15]}}, {B[15:0]}},		// EXTEND HALFWORD
    /*20 10100*/ rotOut,                  		// ROTR
    /*21 10101*/ (B == 0)? 32'b1 : 32'b0,     	// (B == 0)? 
    /*22 10110*/ (B != 0)? 32'b1 : 32'b0,    	// (B != 0)? 
    /*23 10111*/ A << sa,                		// SLL
    /*24 11000*/ A >> sa,                		// SLR
    /*25 11001*/ $signed(A) >>> $signed(B[10:6]),    // SRA
    /*26 11010*/ 32'b1,                    		// MTHI
    /*27 11011*/ 32'b1,                    		// MTLO
    /*28 11100*/ rotOutV,                    	// A out
    /*29 11101*/ 32'b1,                    		// MULT
    /*30 11110*/ 32'b1,                    		// MULTU
    /*31 11111*/ andi,                    		// ANDI
    
    ALUControl, 
                bufferOut);
    
    assign thiccResult = (ALUControl == 5'b01001)? hiloReg + mulFull  : 
                         (ALUControl == 5'b01010)? hiloReg - mulFull : (ALUControl == 5'b11010)? {{A},{hiloReg[31:0]}}: 
                         (ALUControl == 5'b11011)? {{hiloReg[63:32]},{A}}: (ALUControl == 5'b11101)? mult :
                         (ALUControl == 5'b11110)? multu : hiloReg;
                         
    assign ALUResult = bufferOut;

endmodule
