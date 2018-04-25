module nano(
 input 	      reset, clk,
 input [7:0]  instr,data_in,
 output [7:0] instr_addr,data_addr,
 output [7:0] data_out,
 output       data_we
 );
   reg [7:0]  R0,R1;
   reg 	      flag;

   // FETCH UNIT
   reg [7:0]  pc;
   wire [7:0] next_pc;
   wire       pc_we;
   
   always @(posedge clk)
     if (reset)
       pc <= 8'h01;
     else
       pc <= next_pc;

   assign next_pc = (pc_we) ? imm8 : pc+8'h01;
   assign instr_addr = pc;
   
   // DECODE UNIT
   wire       ld, st, alu, br;
   wire       do_sub, inc_dec;
   wire       reg_we, flag_we;
   wire [7:0] imm8;
   
   assign ld = instr[7:6] == 2'b00;
   assign st = instr[7:6] == 2'b01;
   assign alu = instr[7:6] == 2'b10;
   assign br = instr[7:6] == 2'b11;
   
   assign do_sub = instr[0];
   assign inc_dec = instr[1];
   assign imm8 = {2'b00, instr[5:0]};

   assign pc_we = br & flag;
   assign reg_we = ld | alu;
   assign flag_we = alu;
   assign data_we = st;
      
   // EXECUTION UNIT
   wire [7:0] reg_in,alu_out,x,y;
   wire       flag_in;

   assign x = R0;
   assign y = (inc_dec) ? 8'h01 : R1;

   assign alu_out = (do_sub) ? x-y : x+y;

   // WRITEBACK UNIT
   assign reg_in = (alu) ? alu_out : data_in;
   assign flag_in = alu_out[7];
   assign data_out = R0;
   assign data_addr = imm8;   
   
   
   // REGISTERS   
   always @(posedge clk)
     if (reg_we) begin
	R0 <= reg_in;
	R1 <= R0;
     end
 
   always @(posedge clk)
     if (flag_we)
       flag <= flag_in;
endmodule // nano
