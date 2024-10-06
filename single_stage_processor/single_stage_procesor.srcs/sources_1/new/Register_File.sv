`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2024 10:00:05
// Design Name: 
// Module Name: Register_File
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


module Register_File (
    input logic clk,
    input logic [31:0] instruction,
    input logic [31:0] Writedata,
    input logic regwrite,
    output logic [31:0] Readdata1,
    output logic [31:0] Readdata2
);

    // 32 general-purpose registers (x0 - x31)
    logic [31:0] registers [31:0];
    logic [4:0] a1, a2, a3;

    // Extracting register addresses from the instruction fields
    always_comb begin
        a1 = instruction[19:15]; // rs1
        a2 = instruction[24:20]; // rs2
        a3 = instruction[11:7];  // rd
    end

    // Writing to the register file on the positive edge of the clock
    always_ff @(posedge clk) begin
        if (regwrite) begin
            registers[a3] <= Writedata;
        end
    end
       

    // Reading from the register file
    assign Readdata1 = registers[a1];
    assign Readdata2 = registers[a2];

    

endmodule
