`include "uvm_macros.svh"
import uvm_pkg::*;
import axi_lite_pkg::*;

//timing

module testbench_top;

  logic ACLK = 0;
  logic ARESETn = 0;

  always #5 ACLK = ~ACLK;

  axi_lite_if #(64) axi_if(.*);

  initial begin
    ARESETn = 0;
    #20 ARESETn = 1;
  end

  initial begin
    uvm_config_db#(virtual axi_lite_if)::set(null, "*", "vif", axi_if);
    run_test("axi_lite_basic_test");
  end

endmodule
