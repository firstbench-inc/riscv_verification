`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2024 09:36:59
// Design Name: 
// Module Name: control_unit
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


module control_unit(
                    
                    input logic [31:0]instruction,
                    output logic PcSrc,
                    output logic [1:0] ResultSrc,
                    output logic  AluSrc,
                    output logic [2:0] AluCtrl,
                    output logic [1:0] ALUOp,
                    output logic [1:0] ImmSrc,
                    output logic RegWire,
                    output logic MemWrite,
                    output logic [10:0] controls

    );

logic [6:0] opcode;
logic [3:0] funct3;
logic [6:0] funct7;
//logic [10:0] controls;
logic RtypeSub;

always_comb  begin
    opcode = instruction[6:0];
    funct3 = instruction[14:12];
    funct7 = instruction[31:25];
    
    controls = 11'b0_00_0_0_00_0_00_0;

case (opcode)

//RegWrite_ImmSrc_ALUSrc_Memwrite_ResultSrc_Branch_ALUOp_Jump
7'b0000011: controls=11'b1_00_1_0_01_0_00_0; //lw
7'b010011: controls=11'b0_01_1_1_00_0_00_0; //sw
7'b0110011: controls=11'b1_00_0_0_00_0_10_0; //r-type
7'b1100011: controls=11'b0_10_0_0_00_1_01_0;//beq
7'b0010011: controls=11'b1_00_1_0_00_0_10_0;//ITYPEALU;
7'b1101111: controls =11'b1_11_0_0_10_0_00_1; //jal
default: controls= 11'bx_xx_x_x_xx_x_xx_x;
endcase
{RegWire, ImmSrc, AluSrc, MemWrite, ResultSrc, ALUOp, PcSrc} = controls;

 RtypeSub = funct7[5] & opcode[5];
 
case(ALUOp)
2'b00: AluCtrl = 3'b000; //add
2'b01: AluCtrl = 3'b010; //sub

default: case(funct3)
3'b000: if(RtypeSub)
            AluCtrl = 3'b010; //sub
        else
            AluCtrl = 3'b000; //add, addi
3'b111: AluCtrl = 3'b010 ; //and
3'b110: AluCtrl = 3'b011; //or
3'b100: AluCtrl = 3'b100; //xor
3'b001: AluCtrl = 3'b001; //sll
default:    AluCtrl = 3'bxxx;
endcase
endcase
end

endmodule
