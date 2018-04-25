module instr_mem
(
 input 	      clk, we,
 input [15:0] addr, data_in,
 output [15:0] data_out
);
    //synthesis attribute ram_style of mem is distributed
   reg [15:0]   mem[0:2047];
 
   initial begin
   // lhi R2,0
   mem[0] = 16'b110_010_0000000000;
   // add R2,R2,24
   mem[1] = 16'b000_010_010_1_011000;
   // lhi R3,0
   mem[2] = 16'b110_011_0000000000;
   // add R3,R3,7
   mem[3] = 16'b000_011_011_1_000111;
   // add R7,R0,0
   mem[4] = 16'b000_111_000_1_000000;
   // LOOP: sub R2,R2,R3
   mem[5] = 16'b001_010_010_0000_011;
   // bls DONE
   mem[6] = 16'b111_011_0000000011;
   // add R7,R7,1
   mem[7] = 16'b000_111_111_1_000001;
   // ba LOOP
   mem[8] = 16'b111_000_1111111101;
   // DONE: ba DONE
   mem[9] = 16'b111_000_0000000000;
   end
   
   always @(posedge clk)
      if (we)
        mem[addr[10:0]] <= data_in;
    
   assign data_out = mem[addr[10:0]];
   
endmodule // mem
