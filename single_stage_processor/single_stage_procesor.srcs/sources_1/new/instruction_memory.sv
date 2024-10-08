`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2024 04:30:24
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory#(parameter data_width = 32, address_width = 32)(
    input logic [address_width-1:0]mem_add,
    input logic clk,
    output logic [data_width-1:0]instruction
);

logic [data_width-1:0] memory [0:2**address_width-1];
logic [data_width-1:0] data_out;
        always_comb begin
        if (mem_add < 2**address_width) begin

            data_out <= memory[mem_add];
            memory[mem_add] = data_out;

        end
        
    end
endmodule
