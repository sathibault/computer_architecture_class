# Computer Architecture RISC Resources

There are three RISC models in this project that I use for an computer architecture design class:

 * Ultimate RISC - a single-instruction ISA with a multi-cycle implementation.  The ultimate-risc folder includes:
   * ISA specification
   * a datapath block diagram
   * a multi-cycle execution algorithm
   * per-cycle datapath diagrams
   * the state-transition table, and
   * a Verilog implementation
 * Nano RISC - a very small 8-bit ISA with a single-cycle implementation. The nano-risc folder includes:
   * ISA specification
   * a datapath block diagram
   * per-instruction datapath diagrams
   * instruction decoder output table, and
   * a Verilog implementation
 * UV RISC - a decent size 16-bit ISA with an implementation template.  The uv-risc folder includes:
   * ISA specification
   * a datapath block diagram
   * a template for the instruction decoder output table, and
   * Verilog templates for a single-cycle implementation

All of these were designed for and tested on Digilent's [Basys 3 FPGA board](https://www.digikey.com/en/product-highlight/d/digilent/basys3-artix-7-fpga-board)
