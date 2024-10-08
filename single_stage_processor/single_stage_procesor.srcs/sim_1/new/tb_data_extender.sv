`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2024 08:21:04
// Design Name: 
// Module Name: tb_data_extender
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


module tb_data_extender();
logic [31:0] instruction;
logic [1:0] Immsrc;
logic [31:0]ImmExt;

data_extender dut(.instruction(instruction),.Immsrc(Immsrc),.ImmExt(ImmExt));

initial begin
instruction=32'b11111111110001001010001100000011;
Immsrc=2'b00;
#10
instruction=32'h0064A423;
Immsrc=2'b01;
#10
instruction=32'hFE420AE3;
Immsrc=2'b10;

end
endmodule
