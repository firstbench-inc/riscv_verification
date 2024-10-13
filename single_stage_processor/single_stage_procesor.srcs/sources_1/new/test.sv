`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2024 13:36:16
// Design Name: 
// Module Name: test
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


module test(input  logic [31:0] instruction,
            input  logic clk,
            input logic regwrite,
            input  logic WriteLoc,
            input  logic [31:0] WriteData,
            output logic [31:0] AluResult,
            output logic [2:0] AluCtrl,
            output logic [1:0] ALUOp,
            output logic [1:0] ImmSrc,
            output  logic AluSrc,
            output logic [10:0] controls,
            output logic [31:0] RD1,
            output logic [31:0] RD2,
            output  logic [31:0] ImmExt,
            output logic [31:0] SrcB


    );
    
//    logic [31:0] RD1;
//    logic [31:0] RD2;
////   logic [31:0] WriteData;
//    logic regwrite; 
//    logic [31:0] ImmExt;
    
//    logic [31:0] SrcB;

    control_unit control_unit(
        .instruction(instruction),
        .AluCtrl(AluCtrl),
        .ALUOp(ALUOp),
        .ImmSrc(ImmSrc),
        .AluSrc(AluSrc),
        .controls(controls)
//        .RegWire(regwrite)
    );
    
    Register_File Register_File(
        .instruction(instruction),
        .WriteData(WriteData),
        .RegWrite(regwrite),
        .ReadData1(RD1),
        .ReadData2(RD2),
        .clk(clk),
        .WriteLoc(WriteLoc)
    );

    ALU ALU(
        .AluResult(AluResult),
        .RD1(RD1),
        .RD2(SrcB),
        .AluControl(AluCtrl)
    );
    data_extender data_extender(
        .instruction(instruction),
        .ImmSrc(ImmSrc),
        .ImmExt(ImmExt)
    );    
    mux_2 mux_2(
        .a(RD2),
        .b(ImmExt),
        .c(AluSrc),
        .o(SrcB)
    );
endmodule
