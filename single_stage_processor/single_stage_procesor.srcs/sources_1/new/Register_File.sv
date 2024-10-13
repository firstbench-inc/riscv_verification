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
    input logic [31:0] WriteData,
    input logic RegWrite,
    output logic [31:0] ReadData1,//can be5
    output logic [31:0] ReadData2,
//    input logic WriteSig,
    input logic WriteLoc
);

    // 32 general-purpose registers (x0 - x31)
    logic [31:0] registers [31:0];
    logic [4:0] a1, a2, a3;
// always_comb begin
//             registers[0] = 32'b0; // x0 is hardwired to 0
//             registers[1] = 1;
//             registers[2] = 2;
//             registers[3] = 3;
//             registers[4] = 4;
//             registers[5] = 5;
//         end
    // Extracting register addresses from the instruction fields
    always_comb begin
        a1 = instruction[19:15]; // rs1
        a2 = instruction[24:20]; // rs2
        a3 = instruction[11:7];  // rd
    end

    // Writing to the register file on the positive edge of the clock
    always_ff @(posedge clk) begin
        if (RegWrite) begin
            registers[WriteLoc] <= WriteData;
        end
    end
       

    // Reading from the register file
    always_comb begin
    ReadData1 = registers[a1];
    ReadData2 = registers[a2];
end
    

endmodule
