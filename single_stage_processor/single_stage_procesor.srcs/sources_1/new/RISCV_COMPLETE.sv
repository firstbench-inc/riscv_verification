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

module RISCV_COMPLETE(input logic [31:0] instruction,
                      input logic clk,
                      input logic reset,
                      output logic [31:0] pc_out,
                      output logic [31:0] Readdata1,
                      output logic [31:0] Readdata2,
                      output logic [31:0] ReadData,
                      output logic [31:0] ImmExt,
                      output logic [31:0] SrcResult,SrcResultAlu,
                      output logic [31:0] AluResult,
                      output logic  Alusrc,
                      output logic Pcsrc,
                      output logic [1:0] ResultSrc,
                      output logic [2:0] Aluctrl,
                      output logic [1:0] ALUOp,
                      output logic [1:0] ImmSrc,
                      output logic regwire,
                      output logic memwrite


    );

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
    .Readdata1(Readdata1),
    .Readdata2(Readdata2),
    .clk(clk),
    .Writedata(SrcResult),
    .regwrite(regwire)
    // .WriteReg(control_unit_inst.WriteReg)
);
//initializing the register file
//initializing the program counter

control_unit  control_unit_inst(
    .instruction(instruction),
    .Pcsrc(Pcsrc),
    .ResultSrc(ResultSrc),
    .Alusrc(Alusrc),
    .Aluctrl(Aluctrl),
    .ALUOp(ALUOp),
    .ImmSrc(ImmSrc),
    .regwire(regwire),
    .memwrite(memwrite)
);
//initializing the control unit

data_extender data_extender_inst(
    .instruction(instruction),
    .ImmSrc(Immsrc),
    .ImmExt(ImmExt)
);

//initializing the data extender
ALU ALU_inst(
    .RD1(Readdata1),
    .RD2(SrcResultAlu),
    .AluControl(Aluctrl),
    .AluResult(AluResult)
);
//initializing the ALU



Data_Memory data_memory_inst(
    .Readdata(ReadData),
    .Writedata(Readdata2),
    .clk(clk),
    .memwrite(memwrite),
    // .MemRead(ReadData),
    .AluResult(AluResult)
);


mux_2 Alusrc_mux(
    .a(Readdata2),
    .b(ImmExt),
    .c(Alusrc),
    .o(SrcResultAlu)
);


mux_2 result_mux (
    .a(AluResult),
    .b(ReadData),
    .c(ResultSrc),
    .o(SrcResult)
);
mux_2 pc_mux (
    .a(pc_out),
    .b(ImmExt),
    .c(Pcsrc),
    .o(pc_out)
);
endmodule
