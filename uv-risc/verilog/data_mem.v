module data_mem
(
 input 	       clk,
 input [15:0]  data_in,
 input [15:0]  addr,
 input 	       we,
 output [15:0] data_out
);
   reg [15:0] 	ram[0:2047];

   always @(posedge clk)
     if (we)
       ram[addr[10:0]] <= data_in;

   assign data_out = ram[addr[10:0]];
   
endmodule
