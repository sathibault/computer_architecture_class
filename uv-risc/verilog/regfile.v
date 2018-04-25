// REGISTER UNIT

// This module controls the special register R0, general purpose
// registers R1-R7 and flags regsiter.  It also performs the register
// fetch for the current instruction based on rd1_sel/rd2_sel.
// 1. R0 should be initialized to 0
// 2. The data_in data should be written to the register indicated by
//    the wr_sel input when reg_we is high.
// 3. The hi_in data should be written to R1 when hi_we is high.
// 4. The flags_in data should be written when flag_we is high.
// 5. The data1 output should be the current value of the register
//    indicated by rd1_sel.
// 6. The data2 output should be the current value of the register
//    indicated by rd2_sel.

module regfile
  (
 input 		   reset, clk,
 input 		   flags_we, reg_we, hi_we,
 input [2:0] 	   wr_sel, rd1_sel, rd2_sel,
 input [3:0] 	   flags_in,
 input [15:0] 	   data_in, hi_in,
 output reg [15:0] data1, data2,
 output reg [3:0]  flags
);
   
endmodule // regfile
