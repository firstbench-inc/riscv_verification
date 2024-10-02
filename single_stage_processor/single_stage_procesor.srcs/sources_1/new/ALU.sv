`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2024 22:46:34
// Design Name: 
// Module Name: ALU
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


module ALU(
    output logic [31:0] AluResult,
    input logic [31:0] RD1,
    input logic [31:0] RD2,
    input logic [2:0] AluControl
    );

always_comb begin
    case(AluControl)
        3'b000: AluResult = RD1 + RD2;
        3'b001: AluResult = RD1 - RD2;
        3'b010: AluResult = RD1 & RD2;
        3'b011: AluResult = RD1 | RD2;
        3'b100: AluResult = RD1 ^ RD2;
        // 3'b101: AluResult = RD1 << RD2;
        // 3'b110: AluResult = RD1 >> RD2;
        // 3'b111: AluResult = RD1 >>> RD2;
        default: AluResult = 32'b0;
    endcase
end

endmodule
