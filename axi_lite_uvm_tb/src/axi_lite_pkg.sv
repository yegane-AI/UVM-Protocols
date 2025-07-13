package axi_lite_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  typedef enum bit [1:0] {
    BUS_32 = 2'b00,
    BUS_64 = 2'b01
  } bus_width_t;

endpackage
