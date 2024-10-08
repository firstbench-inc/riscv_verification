`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2024 00:57:36
// Design Name: 
// Module Name: tb_control_unit
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


/*module tb_control_unit();
logic [31:0]instruction;
logic Pcsrc;
logic [1:0] ResultSrc;
logic  Alusrc;
logic [2:0] Aluctrl;
logic [1:0] ALUOp;
logic [1:0] ImmSrc;
logic regwire;
logic memwrite;

control_unit dut (.instruction(instruction),.Pcsrc(Pcsrc),.ResultSrc(ResultSrc),.Alusrc(Alusrc),.Aluctrl(Aluctrl),.ALUOp(ALUOp), .ImmSrc(ImmSrc),.regwire(regwire),.memwrite(memwrite));

initial begin
        // Test R-type instruction (opcode 7'b011011)
        instruction = 32'b0000000_00000_00000_000_00000_011011;
        #10;
        //lw
        instruction = 32'b0000000_00000_00000_000_00000_000011;
        #10;
        //sw
         instruction = 32'b0000000_00000_00000_000_00000_010011;
         #10;
end

endmodule*/

module tb_control_unit;

    logic [31:0] instruction;
    logic Pcsrc, Alusrc, regwire, memwrite;
    logic [1:0] ResultSrc, ALUOp, ImmSrc;
    logic [2:0] Aluctrl;

    control_unit uut (
        .instruction(instruction),
        .Pcsrc(Pcsrc),
        .ResultSrc(ResultSrc),
        .Alusrc(Alusrc),
        .Aluctrl(Aluctrl),
        .ALUOp(ALUOp),
        .ImmSrc(ImmSrc),
        .regwire(regwire),
        .memwrite(memwrite)
    );

    initial begin
        // Test case: lw
        instruction = 32'b0000000000000000000000000000011; #10;
        
        // Test case: sw
        instruction = 32'b0000000000000000000000000100011; #10;
        
        // Test case: r-type
        instruction = 32'b0000000000000000000000000110011; #10;
        
        // Test case: beq
        instruction = 32'b0000000000000000000000011000011; #10;
        
        // Test case: jal
        instruction = 32'b0000000000000000000000011011111; #10;

        // Finish simulation
        $finish;
    end

endmodule

