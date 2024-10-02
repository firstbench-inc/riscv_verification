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


module Data_Memory(input logic AluResult,
                   input logic clk,
                   input logic memwrite,
                   input logic [31:0]Writedata,
                   output logic [31:0] Readdata

    );
 
logic [31:0] memory [0:2**32-1];
logic [31:0] data_out;
logic [31:0] address;
    always_ff @(posedge clk ) begin
        if (memwrite) begin
            memory[AluResult] <= Writedata;
        end
        address = AluResult;
    end
    always_comb begin : data_assign
         Readdata = memory[address];
    end

endmodule
