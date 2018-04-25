// FETCH UNIT

// The fetch unit is responsible for the program counter (PC) logic.
// It should:
// 1) set the PC to 16'h0000
// 2) set the PC to pc_in when pc_we is high
// 3) increment the PC by 1 otherwise

module fetch
(
 input 		   reset, clk,
 input 		   pc_we,
 input [15:0] 	   pc_in,
 output reg [15:0] pc
 );
   
endmodule // fetch
