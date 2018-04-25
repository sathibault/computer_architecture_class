// ALU module

// The module performs the add/subtract, signed/unsigned multiplication and bitwise nand ALU functions.
// You should implement these as three separate combinational units and an output multiplexor to
// drive the result output with the result of the desired operation given in out_sel:
// 100 - add/subtract
// 010 - multiplication
// 001 - bitwise nand

module alu
(
 input 		   sub, muls,
 input [2:0] 	   out_sel,
 input [15:0] 	   x, y,
 output [15:0] 	   result_hi,
 output reg [15:0] result,
 output 	   C,N,V,Z
);
endmodule
