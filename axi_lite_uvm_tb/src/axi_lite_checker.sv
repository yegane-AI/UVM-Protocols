class axi_lite_checker extends uvm_component;
  `uvm_component_utils(axi_lite_checker)

  virtual axi_lite_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    if (!uvm_config_db#(virtual axi_lite_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF", "No virtual interface provided for checker")
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.ACLK);
      if (vif.WVALID && vif.WREADY) begin
        if (|vif.WSTRB === 0)
          `uvm_error("AXI_CHECK", "Invalid WSTRB: no byte lane selected")
        if ($bits(vif.WDATA) != $bits(vif.WSTRB) * 8)
          `uvm_error("AXI_CHECK", "Data and WSTRB width mismatch")
      end
    end
  endtask
endclass
