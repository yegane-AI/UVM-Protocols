class axi_lite_basic_test extends uvm_test;
  `uvm_component_utils(axi_lite_basic_test)
// to do: adding timing features
  axi_lite_monitor mon;
  axi_lite_checker check;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon = axi_lite_monitor::type_id::create("mon", this);
    check = axi_lite_checker::type_id::create("check", this);
  endfunction
endclass
