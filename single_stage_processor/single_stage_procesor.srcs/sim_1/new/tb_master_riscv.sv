`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2024 22:50:54
// Design Name: 
// Module Name: tb_master_riscv
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


module RISCV_COMPLETE_tb();

logic [31:0] memory [0:2**31];

assign memory[0] = 32'b01000000001100010000000010110011;

  // Testbench signals
  logic clk;
  logic [31:0] PcIn;
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
    logic [31:0] instruction;
  // Instantiate the DUT (Device Under Test)
  RISCV_COMPLETE uut(
    .clk(clk),
    .instruction(instruction)
  );

  // Clock generation
  always #5 clk = ~clk; // Toggle clock every 5 time units

  // Test procedure
  initial begin
    // Initialize signals
    clk = 1;

    instruction = 32'b01000000001100010000000010110011;
end
endmodule