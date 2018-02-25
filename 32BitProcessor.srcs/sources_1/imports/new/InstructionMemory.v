`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory  1
// Module - InstructionMemory.v
// Description - 32-Bit wide instruction memory.
//
// Engineers: Sebastian Thiem & Brian Winlker
// % effort:  Sebastian Thiem(50%) & Brian Winlker(50%)
//
// INPUT:-
// Address: 32-Bit address input port.
//
// OUTPUT:-
// Instruction: 32-Bit output port.
//
// FUNCTIONALITY:-
// Similar to the DataMemory, this module should also be byte-addressed
// (i.e., ignore bits 0 and 1 of 'Address'). All of the instructions will be 
// hard-coded into the instruction memory, so there is no need to write to the 
// InstructionMemory.  The contents of the InstructionMemory is the machine 
// language program to be run on your MIPS processor.
//
//
//we will store the machine code for a code written in C later. for now initialize 
//each entry to be its index * 4 (memory[i] = i * 4;)
//all you need to do is give an address as input and read the contents of the 
//address on your output port. 
// 
//Using a 32bit address you will index into the memory, output the contents of that specific 
//address. for data memory we are using 1K word of storage space. for the instruction memory 
//you may assume smaller size for practical purpose. you can use 128 words as the size and 
//hardcode the values.  in this case you need 7 bits to index into the memory. 
//
//be careful with the least two significant bits of the 32bit address. those help us index 
//into one of the 4 bytes in a word. therefore you will need to use bit [8-2] of the input address. 
////////////////////////////////////////////////////////////////////////////////
module InstructionMemory(Address, 
                                    Instruction); 
    (*keep = "true"*)
    
    input[31:0] Address;        // Input Address 
    // last 2 bits in address used for indexing one of 4 bytes in some word
    // bits 8-2 are the address

    output reg[31:0] Instruction;    // Instruction at memory location Address
    
    integer i;
    
    reg[31:0] memory [511:0]; // Array of 512 memory blocks, each block being 4 bytes
    
    initial begin
    
        memory[00] = 32'h3c120000;
        memory[01] = 32'h8e520000;
        memory[02] = 32'h3c130000;
        memory[03] = 32'h8e730004;
        memory[04] = 32'h02538820;
        memory[05] = 32'h0233a022;
        memory[06] = 32'h02348822;
        memory[07] = 32'h7233a002;
        memory[08] = 32'h0233a022;
        memory[09] = 32'h02538820;
        memory[10] = 32'h7234b002;
        memory[11] = 32'h02968822;
        memory[12] = 32'h02568820;
        memory[13] = 32'h3631aaaa;
        memory[14] = 32'h00118a80;
        memory[15] = 32'h22350000;
        memory[16] = 32'h22b70000;
        memory[17] = 32'h34120018;
        memory[18] = 32'h8e510000;
        memory[19] = 32'h0235a022;
        memory[20] = 32'h0237b024;
        memory[21] = 32'h0236b825;
        memory[22] = 32'h02339022;
        memory[23] = 32'h02554024;
        memory[24] = 32'h02d24825;
        memory[25] = 32'h02525020;
        memory[26] = 32'h3c110000;
        memory[27] = 32'hae290004;
        memory[28] = 32'h8e2a0004;
        memory[29] = 32'h02339022;
        memory[30] = 32'h02555825;
        memory[31] = 32'h02526020;
        memory[32] = 32'h02525025;
        memory[33] = 32'h02eaa020;
        memory[34] = 32'h3c090000;
        memory[35] = 32'h8d280000;
        memory[36] = 32'h8d2a0004;
        memory[37] = 32'had2a0000;
        memory[38] = 32'had280004;
        memory[39] = 32'h8d280000;
        memory[40] = 32'h8d2a0004;
        memory[41] = 32'h34040018;
        memory[42] = 32'h0800002d;
        memory[43] = 32'h2004ffff;
        memory[44] = 32'h2004ffff;
        memory[45] = 32'h8c900004;
        memory[46] = 32'hac900000;
        memory[47] = 32'h06010003;
        memory[48] = 32'h22100001;
        memory[49] = 32'h0601fffd;
        memory[50] = 32'h0800003e;
        memory[51] = 32'h2010ffff;
        memory[52] = 32'h06000004;
        memory[53] = 32'h20100001;
        memory[54] = 32'h0010082a;
        memory[55] = 32'h1420fffb;
        memory[56] = 32'h0800003e;
        memory[57] = 32'h06000003;
        memory[58] = 32'h2010ffff;
        memory[59] = 32'h0600fffd;
        memory[60] = 32'h0800003e;
        memory[61] = 32'h0800003d;
        memory[62] = 32'h0800003e;
        
        for ( i = 63; i < 512; i= i + 1) begin
            memory[i] = 32'b0;
        end
    /*
        // Arithmatic & Logic
        memory[0] =  32'b00000000000000000000000000000000;
        memory[1] =  32'b00100000000100000000000000000001;
        memory[2] =  32'b00100000000100010000000000000001;
        memory[3] =  32'b00000010000100011000000000100100;
        memory[4] =  32'b00000010000000001000000000100100;
        memory[5] =  32'b00000010001100001000000000100010;
        memory[6] =  32'b00000010000000001000000000100111;
        memory[7] =  32'b00000010000000001000000000100111;
        memory[8] =  32'b00000000000000001000000000100101;
        memory[9] =  32'b00000010001000001000000000100101;
        memory[10] = 32'b00000000000100001000000010000000;
        memory[11] = 32'b00000010001100001000000000000100;
        memory[12] = 32'b00000010000000001000000000101010;
        memory[13] = 32'b00000010000100011000000000101010;
        memory[14] = 32'b00000000000100011000000001000011;
        memory[15] = 32'b00000000000100011000000000000111;
        memory[16] = 32'b00000000000100011000000001000010;
        memory[17] = 32'b00000000000100011000000011000000;
        memory[18] = 32'b00000000000100001000000011000010;
        memory[19] = 32'b00000010001100001000000000000100;
        memory[20] = 32'b00000010001100001000000000000110;
        memory[21] = 32'b00000010000100011000000000100110;
        memory[22] = 32'b00000010000100011000000000100110;
        memory[23] = 32'b00100000000100100000000000000100;
        memory[24] = 32'b01110010000100101000000000000010;
        memory[25] = 32'b00100010000100000000000000000100;
        memory[26] = 32'b00110010000100000000000000000000;
        memory[27] = 32'b00110110000100000000000000000001;
        memory[28] = 32'b00101010000100000000000000000000;
        memory[29] = 32'b00101010000100000000000000000001;
        memory[30] = 32'b00111010000100000000000000000001;
        memory[31] = 32'b00111010000100000000000000000001;
        memory[32] = 32'b00100000000100001111111111111110;
        memory[33] = 32'b00100000000100010000000000000010;
        memory[34] = 32'b00000010001100001001000000101011;
        memory[35] = 32'b00101110001100001111111111111110;
        memory[36] = 32'b00000010001000001000000000001010;
        memory[37] = 32'b00000000000100011000000000001011;
        memory[38] = 32'b00000010001100101000000000100000;
        memory[39] = 32'b00100000000100001111111111111110;
        memory[40] = 32'b00000010001100001000100000100001;
        memory[41] = 32'b00100100000100011111111111111111;
        memory[42] = 32'b00100000000100100000000000100000;
        memory[43] = 32'b00000010001100100000000000011000;
        memory[44] = 32'b00000000000000001010000000010000;
        memory[45] = 32'b00000000000000001010100000010010;
        memory[46] = 32'b00000010001100100000000000011001;
        memory[47] = 32'b00000000000000001010000000010000;
        memory[48] = 32'b00000000000000001010100000010010;
        memory[49] = 32'b01110010001100100000000000000000;
        memory[50] = 32'b00000000000000001010000000010000;
        memory[51] = 32'b00000000000000001010100000010010;
        memory[52] = 32'b00000010010000000000000000010001;
        memory[53] = 32'b00000010001000000000000000010011;
        memory[54] = 32'b00000000000000001010000000010000;
        memory[55] = 32'b00000000000000001010100000010010;
        memory[56] = 32'b00110010001100011111111111111111;
        memory[57] = 32'b01110010100100100000000000000100;
        memory[58] = 32'b00000000000000001010000000010000;
        memory[59] = 32'b00000000000000001010100000010010;
        memory[60] = 32'b00100000000100100000000000000001;
        memory[61] = 32'b00000000001100101000111111000010;
        memory[62] = 32'b00100000000101000000000000011111;
        memory[63] = 32'b00000010100100011000100001000110;
        memory[64] = 32'b00110100000100010000111111110000;
        memory[65] = 32'b01111100000100011010010000100000;
        memory[66] = 32'b01111100000100011010011000100000;            
        
        for ( i = 67; i < 512; i= i + 1) begin
            memory[i] = 32'b0;
        end
        */
    end
    
    always@(*) begin
        Instruction <= memory[Address[10:2]];
    end
    
endmodule
