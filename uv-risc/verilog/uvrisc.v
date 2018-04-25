// Top-level processor module

// Instantiate all the functional units of the processor here and
// connect them according to the datapath diagram in the ISA
// description including any necessary muxes.

module uvrisc
(
 input 	       clk, reset,
 input [15:0]  instr,
 input [15:0]  mem_out,
 output        mem_we,
 output [15:0] pc,
 output [15:0] mem_in, mem_addr,
 output halt
 );

   // INSTRUCTION FETCH

   // INSTRUCTION DECODE & REGISTER REGISTER
   
   // ALU

   // WRITEBACK

   // DO NOT EDIT BELOW
   assign halt = (pc_we) ? alu_out == pc : 0;
   
endmodule // uvrisc
