`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineers: Sebastian Thiem, Brian Winkler
// % effort: Sebastian Thiem(50%), Brian Winkler(50%)
// 
// Create Date:    10/11/2017 
// Module Name:    Controller 
// Project Name:   MIPS 32-bit Processor
//
// Description:    This module watches the instructions in the ID stage, and
//                 updates the datapath control signals accordingly.
//
//////////////////////////////////////////////////////////////////////////////////
module Controller(instruction, ctrlOut);

    (*keep = "true"*)
    
	input [31:0] instruction;
	
	wire[5:0] OP;
	wire[5:0] Funct;
	
	assign OP = instruction[31:26];
	assign Funct = instruction[5:0];
	
	output [24:0] ctrlOut;
    
    // Arithmatic
    wire[24:0] ADD;
    wire[24:0] ADDIU;
    wire[24:0] ADDU;
    wire[24:0] ADDI;
    wire[24:0] SUB;
    wire[24:0] MUL;
    wire[24:0] MULT;
    wire[24:0] MULTU;
    wire[24:0] MADD;
    wire[24:0] MSUB;
    
    // Data
    wire[24:0] LW;
    wire[24:0] SW;
    wire[24:0] SB;
    wire[24:0] LH;
    wire[24:0] LB;
    wire[24:0] SH;
    wire[24:0] MTHI;
    wire[24:0] MTLO;
    wire[24:0] MFHI;
    wire[24:0] MFLO;
    wire[24:0] LUI;
    
    // Branches
    wire[24:0] BGEZ;
    wire[24:0] BEQ;
    wire[24:0] BNE;
    wire[24:0] BGTZ;
    wire[24:0] BLEZ;
    wire[24:0] BLTZ;
    wire[24:0] J;
    wire[24:0] JR;
    wire[24:0] JAL;
    
    // Logical
    wire[24:0] AND;
    wire[24:0] ANDI;
    wire[24:0] OR;
    wire[24:0] NOR;
    wire[24:0] XOR;
    wire[24:0] ORI;
    wire[24:0] XORI;
    wire[24:0] SEH;
    wire[24:0] SLL;
    wire[24:0] SRL;
    wire[24:0] SLLV;
    wire[24:0] SRLV;
    wire[24:0] SLT;
    wire[24:0] SLTI;
    wire[24:0] MOVN;
    wire[24:0] MOVZ;
    wire[24:0] ROTRV;
    wire[24:0] ROTR;
    wire[24:0] SRA;
    wire[24:0] SRAV;
    wire[24:0] SEB;
    wire[24:0] SLTIU;
    wire[24:0] SLTU;
        
    // NOP
    wire[24:0] NOP;
    
    // Arithmatic
    assign ADD =        25'b0000010000000000000110100;
    assign ADDIU =      25'b0000010000010100000110000;
    assign ADDU =       25'b0000010000000100000110100;
    assign ADDI =       25'b0000010000010000000110000;
    assign SUB =        25'b0000010000000000000111100;
    assign MUL =        25'b0000010000000000001000100;
    assign MULT =       25'b0000000000000000011101000;
    assign MULTU =      25'b0000000000000100011110000;
    assign MADD =       25'b0000000000000000001001000;
    assign MSUB =       25'b0000000000000000001010000;
    
    // Data                 
    assign LW =         25'b0000010101010000000110000;
    assign SW =         25'b0000000010010000000110000;
    assign SB =         25'b0000000010010001000110000;
    assign LH =         25'b0000010101010000100110000;
    assign LB =         25'b0000010101010001000110000;
    assign SH =         25'b0000000010010000100110000;
    assign MTHI =       25'b0000000000000000011010000;
    assign MTLO =       25'b0000000000000000011011000;
    assign MFHI =       25'b0000010000001010000000100;
    assign MFLO =       25'b0000010000001000000000100;
    assign LUI =        25'b0000011000000000000000000;
    
    // Branches
    assign BEQ =        25'b1000000000000000000000000;
    assign BNE =        25'b1000100000000000000000000;
    assign BGEZ =       25'b1001000000000000000000000;
    assign BGTZ =       25'b1001100000000000000000000;
    assign BLEZ =       25'b1010000000000000000000000;
    assign BLTZ =       25'b1010100000000000000000000;
    assign J =          25'b1011000000000000000000000;
    assign JR =         25'b1011100000000000000000000;
    assign JAL =        25'b1100010000000000000110000;
    
    // Logical
    assign AND =        25'b0000010000000000000000100;
    assign ANDI =       25'b0000010000010000011111000;
    assign OR =         25'b0000010000000000000001100;
    assign NOR =        25'b0000010000000000000100100;
    assign XOR =        25'b0000010000000000000010100;
    assign ORI =        25'b0000010000010000000101000;
    assign XORI =       25'b0000010000010000000010000;
    assign SEH =        25'b0000010000000000010011100;
    assign SLL =        25'b0000010000110000010111100;
    assign SRL =        25'b0000010000110000011000100;
    assign SLLV =       25'b0000010000000000001111100;
    assign SRLV =       25'b0000010000000000010000100;
    assign SLT =        25'b0000010000000000001011100;
    assign SLTI =       25'b0000010000010000001011000;
    assign MOVN =       25'b0000000000000000000011101;
    assign MOVZ =       25'b0000000000000000000011110;
    assign ROTRV =      25'b0000010000000000011100100;
    assign ROTR =       25'b0000010000110000010100100;
    assign SRA =        25'b0000010000110000011001100;
    assign SRAV =       25'b0000010000000000010001100;
    assign SEB =        25'b0000010000000000010010100;
    assign SLTIU =      25'b0000010000010100001011000;
    assign SLTU =       25'b0000010000000100001011100;
        
    // NOP
    assign NOP =        25'b0000000000110000010111100;
    
    
    assign ctrlOut = 
        // Arithmatic
        (OP == 6'b000000 && Funct == 6'b100000)?                             ADD :
        (OP == 6'b001001)?                                                   ADDIU :
        (OP == 6'b000000 && Funct == 6'b100001)?                             ADDU :
        (OP == 6'b001000)?                                                   ADDI :
        (OP == 6'b000000 && Funct == 6'b100010)?                             SUB :
        (OP == 6'b011100 && Funct == 6'b000010)?                             MUL :
        (OP == 6'b000000 && Funct == 6'b011000)?                             MULT :
        (OP == 6'b000000 && Funct == 6'b011001)?                             MULTU :
        (OP == 6'b011100 && Funct == 6'b000000)?                             MADD :
        (OP == 6'b011100 && Funct == 6'b000100)?                             MSUB :
        
        // Data
        (OP == 6'b100011)?                                                   LW :
        (OP == 6'b101011)?                                                   SW :
        (OP == 6'b101000)?                                                   SB :
        (OP == 6'b100001)?                                                   LH :
        (OP == 6'b100000)?                                                   LB :
        (OP == 6'b101001)?                                                   SH :
        (OP == 6'b000000 && Funct == 6'b010001)?                             MTHI :
        (OP == 6'b000000 && Funct == 6'b010011)?                             MTLO :
        (OP == 6'b000000 && Funct == 6'b010000)?                             MFHI :
        (OP == 6'b000000 && Funct == 6'b010010)?                             MFLO :
        (OP == 6'b001111)?                                                   LUI :
        
        // Branches
        (OP == 6'b000100)?                                                   BEQ :
        (OP == 6'b000101)?                                                   BNE :
        (OP == 6'b000001 && instruction[20:16] == 5'b00001)?                 BGEZ :
        (OP == 6'b000111)?                                                   BGTZ :
        (OP == 6'b000110)?                                                   BLEZ :
        (OP == 6'b000001 && instruction[20:16] == 5'b00000)?                 BLTZ :
        (OP == 6'b000010)?                                                   J :
        (OP == 6'b000000 && Funct == 6'b001000)?                             JR :
        (OP == 6'b000011)?                                                   JAL :
        
        // Logical
        (OP == 6'b000000 && Funct == 6'b100100)?                             AND :
        (OP == 6'b001100)?                                                   ANDI :
        (OP == 6'b000000 && Funct == 6'b100101)?                             OR :
        (OP == 6'b000000 && Funct == 6'b100111)?                             NOR :
        (OP == 6'b000000 && Funct == 6'b100110)?                             XOR :
        (OP == 6'b001101)?                                                   ORI :
        (OP == 6'b001110)?                                                   XORI :
        (OP == 6'b011111 && Funct == 6'b100000 && instruction[9] == 1'b1)?   SEH :
        (OP == 6'b000000 && Funct == 6'b000000 && instruction[10:6] != 5'b00000)? SLL :
        (OP == 6'b000000 && Funct == 6'b000010 && instruction[21] == 1'b0)?  SRL :
        (OP == 6'b000000 && Funct == 6'b000100)?                             SLLV :
        (OP == 6'b000000 && Funct == 6'b000110 && instruction[6] == 1'b0)?   SRLV :
        (OP == 6'b000000 && Funct == 6'b101010)?                             SLT :
        (OP == 6'b001010)?                                                   SLTI :
        (OP == 6'b000000 && Funct == 6'b001011)?                             MOVN :
        (OP == 6'b000000 && Funct == 6'b001010)?                             MOVZ :
        (OP == 6'b000000 && Funct == 6'b000110 && instruction[6] == 1'b1)?   ROTRV :
        (OP == 6'b000000 && Funct == 6'b000010 && instruction[21] == 1'b1)?  ROTR :
        (OP == 6'b000000 && Funct == 6'b000011)?                             SRA :
        (OP == 6'b000000 && Funct == 6'b000111)?                             SRAV :
        (OP == 6'b011111 && Funct == 6'b100000 && instruction[9] == 1'b0)?   SEB :
        (OP == 6'b001011)?                                                   SLTIU :
        (OP == 6'b000000 && Funct == 6'b101011)?                             SLTU :
        
        (OP == 6'b000000 && Funct == 6'b000000 && instruction[10:6] == 5'b00000)? NOP :
        25'b000000000000000000000;
	
endmodule
