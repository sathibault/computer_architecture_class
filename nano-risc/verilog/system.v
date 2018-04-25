module system(
//CLK Input
 input 	       clk,
	 
// Seven Segment Display Outputs
 output [6:0]  seg,
 output [3:0]  an, 
 output        dp
);

   wire        reset, clk_25;
   
   auto_reset reset_gen (.clock(clk), .reset(reset));
   //cpu_clk cpuclk0 (.reset(reset),.clk_in1(clk),.clk_out1(clk_25));
   assign clk_25 = clk;
      
   wire [7:0] pc, instr;

   wire mem_we, dummy_we;
   wire [7:0] mem_in, mem_out, mem_addr;
   
   assign dummy_we = &instr;
   
   instr_mem imem (.clk(clk_25),.we(dummy_we),.data_in(mem_in),.addr(pc),.data_out(instr));
   
   data_mem dmem (.clk(clk_25),.we(mem_we),
		  .addr(mem_addr),.data_in(mem_in),.data_out(mem_out));

   wire        halt;
   
   nano nano0 (.reset(reset),.clk(clk_25),.instr_addr(pc),.instr(instr),
		   .data_we(mem_we),.data_addr(mem_addr),
		   .data_out(mem_in),.data_in(mem_out));

   assign halt = (pc == 8'h00);

   wire [27:0] digits;
   word_to_7seg decoder (.word({8'h00,pc}), .digits(digits));

   strobe strobe0 (.reset(reset), .clock(clk), .digits(digits), .seg(seg), .an(an));

   assign dp = halt;
   
endmodule
