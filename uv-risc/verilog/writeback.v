// WRITEBACK MODULE

// This module drives the writeback address and data signals.
// 1. The memory address is the alu_out data
// 2. The mem_in data is data2
// 3. The result is either mem_out when mem_re is high or the alu_out otherwise.

module writeback
(
 input 	       mem_re,
 input [15:0]  alu_out, data2,
 input [15:0]  mem_out,
 output [15:0] mem_addr,
 output [15:0] mem_in,
 output [15:0] result
 );
   
endmodule // writeback

