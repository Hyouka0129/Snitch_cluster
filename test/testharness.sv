// Copyright 2020 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51

`include "axi/typedef.svh"

module testharness import snitch_cluster_pkg::*; #(
  parameter NarrowAXIAddrWidth  = 48,
  parameter NarrowAXIDataWidth  = 64,
  parameter NarrowAXIIDWidth    = 4,
  parameter NarrowAXIUserWidth  = 5,
  parameter WideAXIAddrWidth    = 48,
  parameter WideAXIDataWidth    = 512,
  parameter WideAXIIDWidth      = 3,
  parameter WideAXIUserWidth    = 1
)(
  input  logic        clk_i,
  input  logic        rst_ni
);

  narrow_in_req_t   narrow_in_req;
  narrow_in_resp_t  narrow_in_resp;
  narrow_out_req_t  narrow_out_req;
  narrow_out_resp_t narrow_out_resp;
  wide_out_req_t    wide_out_req;
  wide_out_resp_t   wide_out_resp;
  wide_in_req_t     wide_in_req;
  wide_in_resp_t    wide_in_resp;
  logic [snitch_cluster_pkg::NrCores-1:0] msip;
  
  AXI_BUS #(
    .AXI_ADDR_WIDTH ( NarrowAXIAddrWidth  ),
    .AXI_DATA_WIDTH ( NarrowAXIDataWidth  ),
    .AXI_ID_WIDTH   ( NarrowAXIIDWidth    ),
    .AXI_USER_WIDTH ( NarrowAXIUserWidth  )
  ) narrow_axi();

  AXI_BUS #(
    .AXI_ADDR_WIDTH ( WideAXIAddrWidth    ),
    .AXI_DATA_WIDTH ( WideAXIDataWidth    ),
    .AXI_ID_WIDTH   ( WideAXIIDWidth      ),
    .AXI_USER_WIDTH ( WideAXIUserWidth    )
  ) wide_axi(); 

  snitch_cluster_wrapper i_snitch_cluster (
    .clk_i,
    .rst_ni,
    .debug_req_i ('0),
    .meip_i ('0),
    .mtip_i ('0),
    .msip_i (msip),
    .hart_base_id_i (CfgBaseHartId),
    .cluster_base_addr_i (CfgClusterBaseAddr),
    .clk_d2_bypass_i (1'b0),
    .sram_cfgs_i (snitch_cluster_pkg::sram_cfgs_t'('0)),
    .narrow_in_req_i (narrow_in_req),
    .narrow_in_resp_o (narrow_in_resp),
    .narrow_out_req_o (narrow_out_req),
    .narrow_out_resp_i (narrow_out_resp),
    .wide_out_req_o (wide_out_req),
    .wide_out_resp_i (wide_out_resp),
    .wide_in_req_i (wide_in_req),
    .wide_in_resp_o (wide_in_resp)
  );

  // Tie-off unused input ports.
  assign narrow_in_req = '0;
  assign wide_in_req = '0;

  // Narrow port into simulation memory.
  logic narrow_req;
  logic narrow_we;
  logic [NarrowAXIAddrWidth-1:0]    narrow_addr;
  logic [NarrowAXIDataWidth-1:0]    narrow_wdata;
  logic [NarrowAXIDataWidth-1:0]    narrow_rdata;
  logic [NarrowAXIDataWidth/8-1:0]  narrow_be;
  axi2mem #(
    .AXI_ID_WIDTH   ( NarrowAXIIDWidth    ),
    .AXI_ADDR_WIDTH ( NarrowAXIAddrWidth  ),
    .AXI_DATA_WIDTH ( NarrowAXIDataWidth  ),
    .AXI_USER_WIDTH ( NarrowAXIUserWidth  )
  ) i_narrow_axi2mem (
      .clk_i  ( clk_i         ),
      .rst_ni ( rst_ni        ),
      .slave  ( narrow_axi    ),
      .req_o  ( narrow_req    ),
      .we_o   ( narrow_we     ),
      .addr_o ( narrow_addr   ),
      .be_o   ( narrow_be     ),
      .data_o ( narrow_wdata  ),
      .data_i ( narrow_rdata  )
  );
  
	sram #(
		.DATA_WIDTH ( NarrowAXIDataWidth  ),
		.USER_EN	  ( 0			              ),
		.SIM_INIT	  ( "zeros"	            ),
		.NUM_WORDS	( 16384	              )
  ) i_narrow_sram (
		.clk_i		( clk_i 		      ),
		.rst_ni		( rst_ni          ),
		.req_i		( narrow_req		  ),
		.we_i		  ( narrow_we		    ),
		.addr_i		( narrow_addr     ),
		.wuser_i	( '0		          ),
		.wdata_i	( narrow_wdata		),
		.be_i		  ( narrow_be		    ),
		.ruser_o	( 		            ),
		.rdata_o	( narrow_rdata		)
	);

  // Wide port into simulation memory.
  logic wide_req;
  logic wide_we;
  logic [WideAXIAddrWidth-1:0]    wide_addr;
  logic [WideAXIDataWidth-1:0]    wide_wdata;
  logic [WideAXIDataWidth-1:0]    wide_rdata;
  logic [WideAXIDataWidth/8-1:0]  wide_be;

  axi2mem #(
    .AXI_ID_WIDTH   ( WideAXIIDWidth    ),
    .AXI_ADDR_WIDTH ( WideAXIAddrWidth  ),
    .AXI_DATA_WIDTH ( WideAXIDataWidth  ),
    .AXI_USER_WIDTH ( WideAXIUserWidth  )
  ) i_wide_axi2mem (
      .clk_i  ( clk_i         ),
      .rst_ni ( rst_ni        ),
      .slave  ( wide_axi      ),
      .req_o  ( wide_req      ),
      .we_o   ( wide_we       ),
      .addr_o ( wide_addr     ),
      .be_o   ( wide_be       ),
      .data_o ( wide_wdata    ),
      .data_i ( wide_rdata    )
  );

  sram #(
    .DATA_WIDTH ( WideAXIDataWidth    ),
    .USER_EN	  ( 0			              ),
    .SIM_INIT	  ( "zeros"	            ),
    .NUM_WORDS	( 16384	              )
  ) i_wide_sram (
    .clk_i		( clk_i 	      ),
    .rst_ni		( rst_ni        ),
    .req_i		( wide_req		  ),
    .we_i		  ( wide_we		    ),
    .addr_i		( wide_addr     ),
    .wuser_i	( '0		        ),
    .wdata_i	( wide_wdata		),
    .be_i		  ( wide_be		    ),
    .ruser_o	( 		          ),
    .rdata_o	( wide_rdata		)
  );
endmodule
