module data_mem
(
 input 	       clk,
 input [7:0]  data_in,
 input [7:0]  addr,
 input 	       we,
 output [7:0] data_out
);
   reg [7:0] 	ram[0:255];

   initial begin
      // 0
      ram[0] = 0;
      // X
      ram[1] = 24;
      // Y
      ram[2] = 7;
      // NEGN
      ram[3] = 0;
      // N
      ram[4] = 0;
      // ONE
      ram[5] = 1;
   end
   
   always @(posedge clk)
     if (we)
       ram[addr] <= data_in;

   assign data_out = ram[addr];
   
endmodule
