# RISC-V Pipelined Cycle
 RISC-V Pipelined Cycle in verilog with FPGA support

The memory is single ported and byte addressable. The single memory constraint introduces structural hazards that degrade the CPU performance and increase the effective CPI drastically. It issues an instruction every 2 clock cycles (effective CPI=2). By doing so, memory accesses of different instructions will never occur on the same clock cycle.

All forty-seven user-level instructions are implemented except ECALL, EBREAK, FENCE, FENCE.I, and CSR instructions. 

Support for integer multiplication and division to effectively support the full RV32IM instruction set.

Support for compressed instructions to effectively support the full RV32IC instruction set except for compressed instructions that do not map to supported instructions.
