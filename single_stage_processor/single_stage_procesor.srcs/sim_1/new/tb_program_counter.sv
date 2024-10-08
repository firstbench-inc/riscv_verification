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


/*module tb_program_counter();
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

endmodule*/

/*module program_counter_tb;

  // Declare signals to connect to the DUT (Device Under Test)
  logic [31:0] PcIn;
  logic PcSrc;
  logic [31:0] ImmExt;
  logic clk;
  logic [31:0] pc_out;

  // Instantiate the program counter module (DUT)
  program_counter dut (
    .PcIn(PcIn),
    .PcSrc(PcSrc),
    .ImmExt(ImmExt),
    .clk(clk),
    .pc_out(pc_out)
  );

  // Clock generation
  always begin
    clk = 0;
    #5;   // 5 time units low
    clk = 1;
    #5;   // 5 time units high (clock period = 10 time units)
  end

  // Test process
  initial begin
    // Initialize inputs
    PcIn = 32'b0;    // Start the program counter at 0
    //Pc=PcIn;
    PcSrc = 0;       // Select the normal PC + 4 increment
    ImmExt = 32'b0;  // No immediate extension
    #10;             // Wait for the clock edge

    // Test 1: Normal PC increment (PcSrc = 0, expect pc_out = Pc + 4)
    #10;
    $display("Test 1: PcSrc = 0, pc_out = %0d, expected 4", pc_out);

    // Test 2: Immediate extension (PcSrc = 1, expect pc_out = Pc + ImmExt)
    PcSrc = 1;
    ImmExt = 32'd8;  // Immediate value to extend PC by 8
    #10;
    $display("Test 2: PcSrc = 1, ImmExt = 8, pc_out = %0d, expected 12", pc_out);

    $finish;
  end

endmodule*/

module program_counter_tb;

    // Parameters
    parameter DATA_WIDTH = 32;

    // Inputs
    logic [DATA_WIDTH-1:0] PcIn;
    logic PcSrc;
    logic [DATA_WIDTH-1:0] ImmExt;
    logic clk;

    // Outputs
    logic [DATA_WIDTH-1:0] pc_out;

    // Instantiate the program counter module
    program_counter dut (
        .PcIn(PcIn),
        .PcSrc(PcSrc),
        .ImmExt(ImmExt),
        .clk(clk),
        .pc_out(pc_out)
    );

    // Clock generation
    initial begin
        clk = 1;
        forever #5 clk = ~clk; // Clock period of 10 time units
    end

    // Stimulus process
    initial begin
        // Initialize inputs
        PcIn = 32'h00000000; // Initial value of PC
        PcSrc = 0;           // No branch
        ImmExt = 32'h00000004; // Normally would add 4

        // Test case 1: Normal operation (increment by 4)
        #10; // Wait for clock to update
        
        // Expected output after one clock cycle:
        // pc_out should be 0 + 4 = 4
        //$display("Test Case 1 (PcSrc = 0):");
        //$display("Time: %0t | PcIn: %h | PcSrc: %b | ImmExt: %h | pc_out: %h", 
                 //$time, PcIn, PcSrc, ImmExt, pc_out);

        // Test case 2: Branching operation
        PcIn = 32'h00001000; // Reset PC
        PcSrc = 1;           // Enable branching
        ImmExt = 32'h0000000C; // Immediate value to add (12)

        #10; // Wait for clock to update

        // Expected output after one clock cycle:
        // pc_out should be 0 + 12 = 12 (since PcSrc is now 1)
        //$display("Test Case 2 (PcSrc = 1):");
        //$display("Time: %0t | PcIn: %h | PcSrc: %b | ImmExt: %h | pc_out: %h", 
                 //$time, PcIn, PcSrc, ImmExt, pc_out);

        // Finish the simulation
        #10; // Wait for another clock cycle
        $finish;
    end

endmodule


