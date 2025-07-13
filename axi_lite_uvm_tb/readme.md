# AXI-Lite Protocol Checker Testbench (UVM)

This repository contains a UVM-based testbench for verifying AXI-Lite protocol compliance.

### Features
- Support for both 32-bit and 64-bit AXI-Lite bus widths
- 8-bit granularity with write strobe (`WSTRB`)
- UVM Monitor and Protocol Checker to validate transactions
- Easy to extend for coverage or scoreboard-based verification

### Structure
- `axi_lite_if.sv`: AXI-Lite interface
- `axi_lite_monitor.sv`: Observes bus transactions
- `axi_lite_checker.sv`: Validates protocol rules
- `axi_lite_basic_test.sv`: Basic UVM test
- `testbench_top.sv`: Top-level testbench wrapper

### Running the Simulation
