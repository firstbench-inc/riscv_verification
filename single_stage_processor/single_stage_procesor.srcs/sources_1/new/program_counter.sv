`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.10.2024 13:20:11
// Design Name: 
// Module Name: program_counter
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


module program_counter(input logic [31:0] PcIn, ImmExt,
                       input logic  PcSrc,
                       input logic [31:0] PcTarget, 
                       input logic clk,
                       output logic [31:0] pc_out

    );
/*    
always_ff @(posedge clk ) begin
case(PcSrc)
    1'b0: pc_out = PcIn + 4;
    1'b1: pc_out = PcTarget + 4;
    
endcase
    end*/
    
logic [31:0]PCNext, PC;


always_comb begin
if(PcSrc) 
    PCNext<= PcTarget+ImmExt;
else
    PCNext<= PcIn+4;
end

always_ff @(posedge clk) begin
PC<=PCNext;
end

assign pc_out=PC;

endmodule
