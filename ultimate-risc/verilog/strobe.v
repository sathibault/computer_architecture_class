module strobe
(
 input 	      reset,clock,
 input [27:0] digits,
 output reg [6:0] seg,
 output reg [3:0] an
 );
 
   wire [1:0] sel;
   reg [19:0] clkdiv;
   
   always @(posedge clock)
     if (reset)
       clkdiv <= 0;
     else
       clkdiv = clkdiv + 1;
       
   assign sel = clkdiv[19:18];
   
   always @(sel)
     case (sel)
       4'b00: an = 4'b1110;
       4'b01: an = 4'b1101;
       4'b10: an = 4'b1011;
       4'b11: an = 4'b0111;
     endcase
     
   always @(digits or an)
     case (an)
       4'b0111: seg = digits[27:21];
       4'b1011: seg = digits[20:14];
       4'b1101: seg = digits[13:7];
       4'b1110: seg = digits[6:0];
       default: seg = 7'bxxxxxxx;
     endcase
endmodule // strobe
