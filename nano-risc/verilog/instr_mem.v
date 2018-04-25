module instr_mem
(
 input 	      clk,we,
 input [7:0] addr,data_in,
 output [7:0] data_out
);
   //synthesis attribute ram_style of mem is distributed
   reg [7:0]   mem[0:255];

   initial begin
      // ZERO @0, X @1, Y @2, NEGN @3, N @4, ONE @5
      mem[0] = 8'b11_000000;
      // LOOP: LD Y
      mem[1] = 8'b00_000010;
      // LD X
      mem[2] = 8'b00_000001;
      // SUB (X-Y)
      mem[3] = 8'b10_000001;
      // ST X
      mem[4] = 8'b01_000001;
      // LD NEGN
      mem[5] = 8'b00_000011;
      // BNEG DONE
      mem[6] = 8'b11_001010;
      // DECR (NEGN)
      mem[7] = 8'b10_000011;
      // ST NEGN
      mem[8] = 8'b01_000011;
      // BNEG LOOP
      mem[9] = 8'b11_000001;
      // DONE: LD 0
      mem[10] = 8'b00_000000;
      // SUB (0-NEGN)
      mem[11] = 8'b10_000001;
      // ST N
      mem[12] = 8'b01_000100;
      // LD 0
      mem[13] = 8'b00_000000;
      // DECR
      mem[14] = 8'b10_000011;
      // BNEG STOP
      mem[15] = 8'b11_000000;
   end

   always @(posedge clk)
      if (we)
        mem[addr] <= data_in;
   
   assign data_out = mem[addr];
   
endmodule // instr_mem
