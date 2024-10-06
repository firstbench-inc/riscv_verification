`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.10.2024 13:10:16
// Design Name: 
// Module Name: data_extender
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


module data_extender(input logic [31:0] instruction,
                     input logic [1:0] ImmSrc,
                     output logic [31:0] ImmExt

    );
logic data_in;
assign data_in = instruction[31:7];

always_comb begin
    case(ImmSrc)
        2'b00: ImmExt = {22'b0, data_in};
        2'b01: ImmExt = {16'b0, data_in};
        2'b10: ImmExt = {8'b0, data_in};
        2'b11: ImmExt = data_in;
    endcase
end
endmodule
