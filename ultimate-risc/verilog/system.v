module system(
//CLK Input
 input 	       clk,
	 
// Seven Segment Display Outputs
 output [6:0]  seg,
 output [3:0]  an, 
 output        dp
);

   wire        reset;
   
   wire mem_wr;
   wire [7:0] mem_in, mem_out, mem_addr;
   
   mem mem0 (.clk(clk),
         .data_in(mem_in), .addr(mem_addr), .we(mem_wr),
         .data_out(mem_out));
   urisc urisc0 (.clk(clk),.reset(reset),
         .data_in(mem_out), .addr(mem_addr), .we(mem_wr),
         .data_out(mem_in));

   wire [15:0] disp;
   wire [27:0] digits;
   assign disp = {8'h00,mem_addr};
   word_to_7seg display_decode (.word(disp), .digits(digits));

   strobe strobe0 (.reset(reset), .clock(clk), .digits(digits), .seg(seg), .an(an));

   assign dp = 1'b1;
   
endmodule
