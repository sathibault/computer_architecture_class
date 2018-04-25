module testbench;
   reg clk, reset;

   initial begin
      reset = 1;
      #12 reset = 0;
      #650 $finish;
   end
   
   initial
     clk = 1;
   always #5 clk = ~clk;

   wire mem_wr;
   wire [7:0] mem_in, mem_out, mem_addr;
   
   mem mem0 (.clk(clk),
	     .data_in(mem_in), .addr(mem_addr), .we(mem_wr),
	     .data_out(mem_out));
   urisc urisc0 (.clk(clk),.reset(reset),
	     .data_in(mem_out), .addr(mem_addr), .we(mem_wr),
	     .data_out(mem_in));

   always @(posedge clk)
     if (mem_wr)
       $display("%03d W %d %d", $time, mem_addr, $signed(mem_in));
     else
       $display("%03d R %d %d", $time, mem_addr, $signed(mem_out));
endmodule // testbench
