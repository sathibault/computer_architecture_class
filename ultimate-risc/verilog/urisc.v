module urisc(
 input 	      reset, clk,
 input [7:0]  data_in,
 output [7:0] addr,
 output [7:0] data_out,
 output       we
 );

   parameter FETCH1 = 0;
   parameter LOAD1 = 1;
   parameter FETCH2 = 2;
   parameter LOAD2 = 3;
   parameter WRITE = 4;
   parameter FETCH3 = 5;
   parameter TEST = 6;
   parameter BRANCH = 7;
   parameter HALT = 8;

   reg [3:0]  next_state, state;

   wire       pc_we;
   wire       r_we, mdr_we, mar_we;
   wire [7:0] pc, r, mdr, mar;
   
   wire       alu_add, alu_incr, alu_neg, alu_zero;
   wire [7:0] alu_out, alu_in1, alu_in2;
   
   inst_fetch inst_fetch0 (.reset(reset), .clk(clk),
			   .wr(pc_we), .data_in(alu_out),
			   .data_out(pc));
			   
   storage storage0 (.reset(reset), .clk(clk), .data_in(data_in),
		     .r0_wr(r_we), .r0_out(r),
		     .mdr_wr(mdr_we), .mdr_out(mdr),
		     .mar_wr(mar_we), .mar_out(mar));

   alu alu0 (.add(alu_add), .incr(alu_incr), .x(alu_in1), .y(alu_in2),
	     .result(alu_out), .neg(alu_neg), .zero(alu_zero));
	     
   assign pc_we = (state == FETCH1 || state == FETCH2 || state == FETCH3 || state == BRANCH);
   
   assign r_we = (state == LOAD2);
   assign mdr_we = (state == LOAD1 || state == FETCH3);
   assign neg_we = (state == WRITE);
   assign mar_we = (state == FETCH1 || state == FETCH2 || state == FETCH3);
   
   wire       pc_in;
   assign pc_in = state != WRITE;
   
   assign alu_in1 = (pc_in) ? pc : r;
   assign alu_in2 = mdr;
   assign alu_add = (state != WRITE);
   assign alu_incr = state != WRITE && state != BRANCH;

   reg 	      neg;
   always @(posedge clk)
     neg <= alu_neg;
   
   always @(state or neg or alu_zero)
     case (state)
       FETCH1: next_state = LOAD1;
       LOAD1: next_state = FETCH2;
       FETCH2: next_state = LOAD2;
       LOAD2: next_state = WRITE;
       WRITE: next_state = FETCH3;
       FETCH3:
	 if (neg) next_state = BRANCH;
	 else next_state = FETCH1;
       BRANCH:
	 if (alu_zero) next_state = HALT;
	 else next_state = FETCH1;
       HALT: next_state = HALT;
     endcase // case (state)

   always @(posedge clk)
     if (reset)
       state <= FETCH1;
     else
       state <= next_state;

   assign addr = (state == LOAD1 || state == LOAD2 || state == WRITE) ? mar : pc;
   assign data_out = alu_out;
   assign we = (state == WRITE);
   
//   initial
//     $monitor("%03d %d %d %d %d",$time,state,alu_add,alu_in1,alu_in2,alu_out,data_in);
   
endmodule // urisc
