module alu(
   input add,incr,
   input [7:0] 	x, y,
   output [7:0] result,
   output 	neg, zero
);

   wire [7:0] 	z;
   
   assign z = (incr) ? 8'h1 : y;
   assign result = (add|incr) ? x + z : x - z;
   assign neg = result[7];
   assign zero = result == 8'h00;
   
endmodule
