`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2024 23:25:11
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(input logic [31:0] AluResult,
                   input logic clk,
                   input logic MemWrite,
                   input logic [31:0]WriteData,
                   output logic [31:0] ReadData

    );
 
logic [31:0] memory [0:2**32-1];
logic [31:0] data_out;
logic [31:0] address;
    always_ff @(posedge clk ) begin
        if (MemWrite) begin
            memory[AluResult] <= WriteData;
        end
        address = AluResult;
    end
    always_comb begin : data_assign
         ReadData = memory[address];
    end

endmodule
