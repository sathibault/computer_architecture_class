module storage(
   input 	reset, clk, r0_wr, mdr_wr, mar_wr,
   input [7:0] 	data_in,
   output [7:0] r0_out, mdr_out, mar_out
);
   reg [7:0]  r0_reg, mdr_reg, mar_reg;
   
   always @(posedge clk)
     if (r0_wr)
       r0_reg <= data_in;

   always @(posedge clk)
     if (mdr_wr)
       mdr_reg <= data_in;

   always @(posedge clk)
     if (mar_wr)
       mar_reg <= data_in;

   assign r0_out = r0_reg;
   assign mdr_out = mdr_reg;
   assign mar_out = mar_reg;   
endmodule
