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


/* module program_counter(input logic [31:0] PcIn, ImmExt,
                       input logic  PcSrc,
                       input logic [31:0] PcTarget, 
                       input logic clk,
                       output logic [31:0] pc_out

    );

    
logic [31:0]PCNext, PC;


always_comb begin
if(PcSrc) 
    PCNext= PcTarget+ImmExt;
else
    PCNext= PC+4;
end


always_ff @(posedge clk) begin
PC<=PCNext;
end

initial begin
//pc_out=PCNext;
PcIn=PC;
end
//assign pc_out=PC;

endmodule*/

/*module program_counter(input logic [31:0] PcIn,
                       input logic  PcSrc,
                    //    input logic [31:0] PcTarget,
                       input logic [31:0] ImmExt,
                       input logic clk,
                       output logic [31:0] pc_out

    );

logic [31:0] Pc;
logic [31:0] PcNext;
assign Pc=PcIn;

always_comb  begin
    if(PcSrc == 1'b1)
        PcNext = Pc + ImmExt;
    else
        PcNext = Pc + 4;
    
end
assign pc_out = Pc;

always_ff @(posedge clk) begin
     Pc<= PcNext;
end

endmodule*/





module program_counter(
    input logic [31:0] PcIn,
    input logic PcSrc,
    input logic [31:0] ImmExt,
    input logic clk,reset,
    output logic [31:0] pc_out
);

    logic [31:0] Pc;         // Current value of the program counter
    logic [31:0] PcNext;     // Next value of the program counter

    // Initialize Pc with PcIn on reset or at the first clock cycle
    always_ff @(posedge clk) begin
       /* if (reset) begin
            Pc <= PcIn;      // Set Pc to PcIn at the first clock cycle or reset condition
        end else begin
            Pc <= PcNext;    // Update Pc with the next value
        end*/
        
        case(PcIn)
        32'b0: Pc=PcIn;
        default: Pc=PcNext;
        endcase
    end

    // Calculate the next PC value based on PcSrc

    
    always_comb begin
        if (PcSrc == 1'b1) begin
            PcNext = Pc + ImmExt;  // If branching, add immediate value to the current PC
            pc_out = PcNext;
        end
        else begin
            PcNext = Pc + 4;       // Else, increment PC by 4
            pc_out = PcNext;
        end
    end


    // Output the current program counter value
    //assign pc_out = PcNext;

endmodule

