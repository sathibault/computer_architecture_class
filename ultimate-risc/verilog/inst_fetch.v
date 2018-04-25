module inst_fetch(
   input 	reset, clk, wr,
   input [7:0] 	data_in,
   output [7:0] data_out
);

   reg [7:0] 	pc_reg;
   
   always @(posedge clk)
     if (reset)
       pc_reg <= 1;
     else if (wr)
       pc_reg <= data_in;
   
   assign data_out = pc_reg;
endmodule // inst_fetch
