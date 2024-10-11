`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.10.2024 13:28:03
// Design Name: 
// Module Name: RISCV_COMPLETE
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

// integration of all modules

module RISCV_COMPLETE(input clk,
                      input [31:0] PcIn
                       );
    logic [31:0] instruction;
//    logic clk;
//     logic [31:0] PcIn;
    logic [31:0] pc_out;
    logic [31:0] ReadData1;
    logic [31:0] ReadData2;
    logic [31:0] ReadData;
    logic [31:0] ImmExt;
    logic [31:0] SrcResult;
    logic [31:0] SrcResultAlu;
    logic [31:32] AluResult;
    logic AluSrc;
    logic PcSrc;
    logic [1:0] ResultSrc;
    logic [2:0] AluCtrl;
    logic [1:0] ALUOp;
    logic [1:0] ImmSrc;
    logic RegWire;
    logic MemWrite;

program_counter program_counter_inst(
    .PcIn(PcIn),
    .PcSrc(PcSrc),
    .ImmExt(ImmExt),
    .clk(clk),
    .pc_out(pc_out)
);


instruction_memory instruction_memory_inst(
    .mem_add(pc_out),
    .clk(clk),
    .instruction(instruction)
);
// initaializing the instruction memory

Register_File register_file_inst(
    .ReadData1(ReadData1),
    .ReadData2(ReadData2),
    .clk(clk),
    .WriteData(SrcResult),
    .RegWrite(RegWire)
    // .WriteReg(control_unit_inst.WriteReg)
);
//initializing the register file
//initializing the program counter

control_unit  control_unit_inst(
    .instruction(instruction),
    .PcSrc(PcSrc),
    .ResultSrc(ResultSrc),
    .AluSrc(AluSrc),
    .AluCtrl(AluCtrl),
    .ALUOp(ALUOp),
    .ImmSrc(ImmSrc),
    .RegWire(RegWire),
    .MemWrite(MemWrite)
);
//initializing the control unit

data_extender data_extender_inst(
    .instruction(instruction),
    .ImmSrc(ImmSrc),
    .ImmExt(ImmExt)
);

//initializing the data extender
ALU ALU_inst(
    .RD1(ReadData1),
    .RD2(SrcResultAlu),
    .AluControl(AluCtrl),
    .AluResult(AluResult)
);
//initializing the ALU



Data_Memory data_memory_inst(
    .ReadData(ReadData),
    .WriteData(ReadData2),
    .clk(clk),
    .MemWrite(MemWrite),
    // .MemRead(ReadData),
    .AluResult(AluResult)
);


mux_2 Alusrc_mux(
    .a(ReadData2),
    .b(ImmExt),
    .c(AluSrc),
    .o(SrcResultAlu)
);


mux_2 result_mux (
    .a(AluResult),
    .b(ReadData),
    .c(ResultSrc),
    .o(SrcResult)
);
//mux_2 pc_mux (
//    .a(pc_out),
//    .b(ImmExt),
//    .c(PcSrc),
//    .o(pc_out)
//);
endmodule
