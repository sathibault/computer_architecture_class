module word_to_7seg(
 input [15:0]  word,
 output [27:0] digits
);
   bcd_to_7seg digit0 (.digit(word[15:12]), .seg(digits[27:21]));
   bcd_to_7seg digit1 (.digit(word[11:8]), .seg(digits[20:14]));
   bcd_to_7seg digit2 (.digit(word[7:4]), .seg(digits[13:7]));
   bcd_to_7seg digit3 (.digit(word[3:0]), .seg(digits[6:0]));
endmodule // word_to_7seg
