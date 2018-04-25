module mem(
   input 	clk,
   input [7:0] 	data_in,
   input [7:0] 	addr,
   input 	we,
   output [7:0] data_out
);
   reg [7:0] 	ram [0:255];

   initial begin
      // ZERO @0, X @16, Y @17, NEGN @18, N @19, ONE @20
      ram[0] = 0;
      // 1: Y,X,DONE
      ram[1] = 17;
      ram[2] = 16;
      ram[3] = 3;
      // ONE,NEGN,-3
      ram[4] = 20;
      ram[5] = 18;
      ram[6] = -6;
      // NEGN,N,0
      ram[7] = 18;
      ram[8] = 19;
      ram[9] = 0;
      // ONE,ZERO,STOP
      ram[10] = 20;
      ram[11] = 0;
      ram[12] = -13;
      // X
      ram[16] = 24;
      // Y
      ram[17] = 7;
      // NEGN
      ram[18] = 0;
      // N
      ram[19] = 0;
      // ONE
      ram[20] = 1;
   end
   
   always @(posedge clk)
     if (we)
       ram[addr] <= data_in;

   assign data_out = ram[addr];
   
endmodule // mem
