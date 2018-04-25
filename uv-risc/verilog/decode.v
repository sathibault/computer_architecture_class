// DECODE UNIT

// This module should produce the outputs according to your decode
// table given the input instruction.

module decode
(
 input [15:0] 	   instr,
 input [3:0] 	   flags,
 output [2:0] 	   rd1_sel,rd2_sel,wr_sel,alu_sel,
 output 	   x_sel, y_sel,
 output 	   sub,muls,
 output 	   reg_we,hi_we,flags_we,pc_we,mem_we,mem_re,
 output reg [15:0] imm
);

endmodule // decode
