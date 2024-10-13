`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2024 14:25:49
// Design Name: 
// Module Name: test_tb
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


module test_tb(

    );
    
logic [31:0] instruction;
logic [31:0]AluResult;
logic clk;
logic [2:0] AluCtrl;
logic [1:0] ALUOp;
logic [1:0] ImmSrc;
logic [31:0] RD1;
logic [31:0] RD2;
logic [31:0] WriteData;
logic regwrite;
logic [31:0] ImmExt;
logic  AluSrc;
logic [31:0] SrcB;
logic WriteLoc;
logic [10:0] controls;
test test(
    .instruction(instruction),
    .clk(clk),
    .AluResult(AluResult),
    .regwrite(regwrite),
    .WriteData(WriteData),
    .AluCtrl(AluCtrl),
    .AluSrc(AluSrc),
    .WriteLoc(WriteLoc),
    .controls(controls),
    .ALUOp(ALUOp),
    .ImmSrc(ImmSrc),
    .RD1(RD1),
    .RD2(RD2),
    .SrcB(SrcB)
    );


// always clk = ~clk;
initial begin
        clk = 1;
        forever #5 clk = ~clk; // Clock period of 10 time units
    end

initial begin
        clk = 1;
        regwrite = 1;
        WriteData = 1;
        WriteLoc = 1;  

        #40;
        regwrite = 1;
        WriteData = 2;
        WriteLoc = 2;
        #40;
        regwrite = 1;
        WriteData = 3;
        WriteLoc = 3;

        #40;
        regwrite = 0;
        WriteData = 0;
        instruction = 32'b00000000001100010000000010110011;
        
        #10;
          regwrite = 0;
                WriteData = 0;

          instruction = 32'b00000000000000000100000000110011; #10;
   end

endmodule
