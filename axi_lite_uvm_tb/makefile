# ================================================================
# AXI-Lite Protocol Checker Testbench Makefile
# Simulator: Synopsys VCS
# ================================================================

# Top-level testbench module.
TOP = testbench_top

# UVM test to run
TEST = axi_lite_basic_test

# Files
SRCS = \
  src/axi_lite_if.sv \
  src/axi_lite_pkg.sv \
  src/axi_lite_monitor.sv \
  src/axi_lite_checker.sv \
  src/axi_lite_agent.sv \
  tests/$(TEST).sv \
  src/testbench_top.sv

# VCS compile flags
VCS_FLAGS = -full64 -sverilog +vcs+lic+wait +acc +vpi \
  -ntb_opts uvm \
  -timescale=1ns/1ps \
  +define+UVM_NO_DEPRECATED

# Output binary
EXE = simv

# Default rule
all: compile simulate

compile:
	vcs $(VCS_FLAGS) -top $(TOP) $(SRCS) -o $(EXE)

simulate:
	./$(EXE) +UVM_TESTNAME=$(TEST) | tee sim.log

gui:
	dve -full64 -vpd vcdplus.vpd &

clean:
	rm -rf csrc simv simv.daidir ucli.key DVEfiles *.vpd *.log *.vcd

.PHONY: all compile simulate clean gui
