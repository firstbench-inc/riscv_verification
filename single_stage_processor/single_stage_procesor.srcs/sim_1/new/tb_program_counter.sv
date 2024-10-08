`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2024 23:48:50
// Design Name: 
// Module Name: tb_program_counter
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


module tb_program_counter();
logic [31:0] PcIn, ImmExt;
logic  PcSrc;
logic [31:0] PcTarget; 
logic clk;
logic [31:0] pc_out;

program_counter dut (.PcIn(PcIn),.PcSrc(PcSrc),.PcTarget(PcTarget),.clk(clk),.pc_out(pc_out),.ImmExt(ImmExt));

//clk 
initial begin
clk=0;
forever #5 clk=~clk; 
end

//test cases
initial begin
PcSrc=1'b0;
PcIn=32'h0000_0000;
ImmExt=32'h0000_0004;
PcTarget=32'h0000_0000;

//PcSRC=0, pc_out=PcIn+4
#20
PcSrc=1'b1;
#20
//PcSrc=1,, pc_out=pctarget+4
//nest set of values
PcSrc=1'b0;
PcIn=32'h0000_0100;
ImmExt=32'h0000_0004;
PcTarget=32'h0000_1000;

#20
PcSrc=1'b1;
#20
$finish;
end

endmodule
