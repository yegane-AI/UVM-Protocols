class axi_lite_monitor extends uvm_monitor;
  `uvm_component_utils(axi_lite_monitor)

  virtual axi_lite_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    if (!uvm_config_db#(virtual axi_lite_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF", "Virtual interface must be set for monitor")
  endfunction

  virtual task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.ACLK);
      if (vif.AWVALID && vif.AWREADY)
        `uvm_info("AXI_MON", $sformatf("Write Addr: %0h", vif.AWADDR), UVM_MEDIUM)
      if (vif.WVALID && vif.WREADY)
        `uvm_info("AXI_MON", $sformatf("Write Data: %0h, WSTRB: %0h", vif.WDATA, vif.WSTRB), UVM_MEDIUM)
      if (vif.ARVALID && vif.ARREADY)
        `uvm_info("AXI_MON", $sformatf("Read Addr: %0h", vif.ARADDR), UVM_MEDIUM)
    end
  endtask
endclass
