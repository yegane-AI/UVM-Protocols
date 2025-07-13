interface axi_lite_if #(parameter DATA_WIDTH = 32) (input logic ACLK, input logic ARESETn);
  logic [DATA_WIDTH-1:0] AWADDR, WDATA, ARADDR;
  logic [3:0] WSTRB;
  logic AWVALID, AWREADY, WVALID, WREADY, ARVALID, ARREADY;
  logic BVALID, BREADY, RVALID, RREADY;
  logic [1:0] BRESP, RRESP;
  logic [DATA_WIDTH-1:0] RDATA;
endinterface
