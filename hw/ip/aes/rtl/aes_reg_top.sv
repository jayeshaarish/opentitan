// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Top module auto-generated by `reggen`

`include "prim_assert.sv"

module aes_reg_top (
  input clk_i,
  input rst_ni,

  // Below Regster interface can be changed
  input  tlul_pkg::tl_h2d_t tl_i,
  output tlul_pkg::tl_d2h_t tl_o,
  // To HW
  output aes_reg_pkg::aes_reg2hw_t reg2hw, // Write
  input  aes_reg_pkg::aes_hw2reg_t hw2reg, // Read

  // Config
  input devmode_i // If 1, explicit error return for unmapped register access
);

  import aes_reg_pkg::* ;

  localparam int AW = 7;
  localparam int DW = 32;
  localparam int DBW = DW/8;                    // Byte Width

  // register signals
  logic           reg_we;
  logic           reg_re;
  logic [AW-1:0]  reg_addr;
  logic [DW-1:0]  reg_wdata;
  logic [DBW-1:0] reg_be;
  logic [DW-1:0]  reg_rdata;
  logic           reg_error;

  logic          addrmiss, wr_err;

  logic [DW-1:0] reg_rdata_next;

  tlul_pkg::tl_h2d_t tl_reg_h2d;
  tlul_pkg::tl_d2h_t tl_reg_d2h;

  assign tl_reg_h2d = tl_i;
  assign tl_o       = tl_reg_d2h;

  tlul_adapter_reg #(
    .RegAw(AW),
    .RegDw(DW)
  ) u_reg_if (
    .clk_i,
    .rst_ni,

    .tl_i (tl_reg_h2d),
    .tl_o (tl_reg_d2h),

    .we_o    (reg_we),
    .re_o    (reg_re),
    .addr_o  (reg_addr),
    .wdata_o (reg_wdata),
    .be_o    (reg_be),
    .rdata_i (reg_rdata),
    .error_i (reg_error)
  );

  assign reg_rdata = reg_rdata_next ;
  assign reg_error = (devmode_i & addrmiss) | wr_err ;

  // Define SW related signals
  // Format: <reg>_<field>_{wd|we|qs}
  //        or <reg>_{wd|we|qs} if field == 1 or 0
  logic [31:0] key_share0_0_wd;
  logic key_share0_0_we;
  logic [31:0] key_share0_1_wd;
  logic key_share0_1_we;
  logic [31:0] key_share0_2_wd;
  logic key_share0_2_we;
  logic [31:0] key_share0_3_wd;
  logic key_share0_3_we;
  logic [31:0] key_share0_4_wd;
  logic key_share0_4_we;
  logic [31:0] key_share0_5_wd;
  logic key_share0_5_we;
  logic [31:0] key_share0_6_wd;
  logic key_share0_6_we;
  logic [31:0] key_share0_7_wd;
  logic key_share0_7_we;
  logic [31:0] key_share1_0_wd;
  logic key_share1_0_we;
  logic [31:0] key_share1_1_wd;
  logic key_share1_1_we;
  logic [31:0] key_share1_2_wd;
  logic key_share1_2_we;
  logic [31:0] key_share1_3_wd;
  logic key_share1_3_we;
  logic [31:0] key_share1_4_wd;
  logic key_share1_4_we;
  logic [31:0] key_share1_5_wd;
  logic key_share1_5_we;
  logic [31:0] key_share1_6_wd;
  logic key_share1_6_we;
  logic [31:0] key_share1_7_wd;
  logic key_share1_7_we;
  logic [31:0] iv_0_wd;
  logic iv_0_we;
  logic [31:0] iv_1_wd;
  logic iv_1_we;
  logic [31:0] iv_2_wd;
  logic iv_2_we;
  logic [31:0] iv_3_wd;
  logic iv_3_we;
  logic [31:0] data_in_0_wd;
  logic data_in_0_we;
  logic [31:0] data_in_1_wd;
  logic data_in_1_we;
  logic [31:0] data_in_2_wd;
  logic data_in_2_we;
  logic [31:0] data_in_3_wd;
  logic data_in_3_we;
  logic [31:0] data_out_0_qs;
  logic data_out_0_re;
  logic [31:0] data_out_1_qs;
  logic data_out_1_re;
  logic [31:0] data_out_2_qs;
  logic data_out_2_re;
  logic [31:0] data_out_3_qs;
  logic data_out_3_re;
  logic ctrl_shadowed_operation_qs;
  logic ctrl_shadowed_operation_wd;
  logic ctrl_shadowed_operation_we;
  logic ctrl_shadowed_operation_re;
  logic [5:0] ctrl_shadowed_mode_qs;
  logic [5:0] ctrl_shadowed_mode_wd;
  logic ctrl_shadowed_mode_we;
  logic ctrl_shadowed_mode_re;
  logic [2:0] ctrl_shadowed_key_len_qs;
  logic [2:0] ctrl_shadowed_key_len_wd;
  logic ctrl_shadowed_key_len_we;
  logic ctrl_shadowed_key_len_re;
  logic ctrl_shadowed_manual_operation_qs;
  logic ctrl_shadowed_manual_operation_wd;
  logic ctrl_shadowed_manual_operation_we;
  logic ctrl_shadowed_manual_operation_re;
  logic trigger_start_wd;
  logic trigger_start_we;
  logic trigger_key_clear_wd;
  logic trigger_key_clear_we;
  logic trigger_iv_clear_wd;
  logic trigger_iv_clear_we;
  logic trigger_data_in_clear_wd;
  logic trigger_data_in_clear_we;
  logic trigger_data_out_clear_wd;
  logic trigger_data_out_clear_we;
  logic trigger_prng_reseed_wd;
  logic trigger_prng_reseed_we;
  logic status_idle_qs;
  logic status_stall_qs;
  logic status_output_valid_qs;
  logic status_input_ready_qs;

  // Register instances

  // Subregister 0 of Multireg key_share0
  // R[key_share0_0]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_key_share0_0 (
    .re     (1'b0),
    .we     (key_share0_0_we),
    .wd     (key_share0_0_wd),
    .d      (hw2reg.key_share0[0].d),
    .qre    (),
    .qe     (reg2hw.key_share0[0].qe),
    .q      (reg2hw.key_share0[0].q ),
    .qs     ()
  );

  // Subregister 1 of Multireg key_share0
  // R[key_share0_1]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_key_share0_1 (
    .re     (1'b0),
    .we     (key_share0_1_we),
    .wd     (key_share0_1_wd),
    .d      (hw2reg.key_share0[1].d),
    .qre    (),
    .qe     (reg2hw.key_share0[1].qe),
    .q      (reg2hw.key_share0[1].q ),
    .qs     ()
  );

  // Subregister 2 of Multireg key_share0
  // R[key_share0_2]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_key_share0_2 (
    .re     (1'b0),
    .we     (key_share0_2_we),
    .wd     (key_share0_2_wd),
    .d      (hw2reg.key_share0[2].d),
    .qre    (),
    .qe     (reg2hw.key_share0[2].qe),
    .q      (reg2hw.key_share0[2].q ),
    .qs     ()
  );

  // Subregister 3 of Multireg key_share0
  // R[key_share0_3]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_key_share0_3 (
    .re     (1'b0),
    .we     (key_share0_3_we),
    .wd     (key_share0_3_wd),
    .d      (hw2reg.key_share0[3].d),
    .qre    (),
    .qe     (reg2hw.key_share0[3].qe),
    .q      (reg2hw.key_share0[3].q ),
    .qs     ()
  );

  // Subregister 4 of Multireg key_share0
  // R[key_share0_4]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_key_share0_4 (
    .re     (1'b0),
    .we     (key_share0_4_we),
    .wd     (key_share0_4_wd),
    .d      (hw2reg.key_share0[4].d),
    .qre    (),
    .qe     (reg2hw.key_share0[4].qe),
    .q      (reg2hw.key_share0[4].q ),
    .qs     ()
  );

  // Subregister 5 of Multireg key_share0
  // R[key_share0_5]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_key_share0_5 (
    .re     (1'b0),
    .we     (key_share0_5_we),
    .wd     (key_share0_5_wd),
    .d      (hw2reg.key_share0[5].d),
    .qre    (),
    .qe     (reg2hw.key_share0[5].qe),
    .q      (reg2hw.key_share0[5].q ),
    .qs     ()
  );

  // Subregister 6 of Multireg key_share0
  // R[key_share0_6]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_key_share0_6 (
    .re     (1'b0),
    .we     (key_share0_6_we),
    .wd     (key_share0_6_wd),
    .d      (hw2reg.key_share0[6].d),
    .qre    (),
    .qe     (reg2hw.key_share0[6].qe),
    .q      (reg2hw.key_share0[6].q ),
    .qs     ()
  );

  // Subregister 7 of Multireg key_share0
  // R[key_share0_7]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_key_share0_7 (
    .re     (1'b0),
    .we     (key_share0_7_we),
    .wd     (key_share0_7_wd),
    .d      (hw2reg.key_share0[7].d),
    .qre    (),
    .qe     (reg2hw.key_share0[7].qe),
    .q      (reg2hw.key_share0[7].q ),
    .qs     ()
  );



  // Subregister 0 of Multireg key_share1
  // R[key_share1_0]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_key_share1_0 (
    .re     (1'b0),
    .we     (key_share1_0_we),
    .wd     (key_share1_0_wd),
    .d      (hw2reg.key_share1[0].d),
    .qre    (),
    .qe     (reg2hw.key_share1[0].qe),
    .q      (reg2hw.key_share1[0].q ),
    .qs     ()
  );

  // Subregister 1 of Multireg key_share1
  // R[key_share1_1]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_key_share1_1 (
    .re     (1'b0),
    .we     (key_share1_1_we),
    .wd     (key_share1_1_wd),
    .d      (hw2reg.key_share1[1].d),
    .qre    (),
    .qe     (reg2hw.key_share1[1].qe),
    .q      (reg2hw.key_share1[1].q ),
    .qs     ()
  );

  // Subregister 2 of Multireg key_share1
  // R[key_share1_2]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_key_share1_2 (
    .re     (1'b0),
    .we     (key_share1_2_we),
    .wd     (key_share1_2_wd),
    .d      (hw2reg.key_share1[2].d),
    .qre    (),
    .qe     (reg2hw.key_share1[2].qe),
    .q      (reg2hw.key_share1[2].q ),
    .qs     ()
  );

  // Subregister 3 of Multireg key_share1
  // R[key_share1_3]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_key_share1_3 (
    .re     (1'b0),
    .we     (key_share1_3_we),
    .wd     (key_share1_3_wd),
    .d      (hw2reg.key_share1[3].d),
    .qre    (),
    .qe     (reg2hw.key_share1[3].qe),
    .q      (reg2hw.key_share1[3].q ),
    .qs     ()
  );

  // Subregister 4 of Multireg key_share1
  // R[key_share1_4]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_key_share1_4 (
    .re     (1'b0),
    .we     (key_share1_4_we),
    .wd     (key_share1_4_wd),
    .d      (hw2reg.key_share1[4].d),
    .qre    (),
    .qe     (reg2hw.key_share1[4].qe),
    .q      (reg2hw.key_share1[4].q ),
    .qs     ()
  );

  // Subregister 5 of Multireg key_share1
  // R[key_share1_5]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_key_share1_5 (
    .re     (1'b0),
    .we     (key_share1_5_we),
    .wd     (key_share1_5_wd),
    .d      (hw2reg.key_share1[5].d),
    .qre    (),
    .qe     (reg2hw.key_share1[5].qe),
    .q      (reg2hw.key_share1[5].q ),
    .qs     ()
  );

  // Subregister 6 of Multireg key_share1
  // R[key_share1_6]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_key_share1_6 (
    .re     (1'b0),
    .we     (key_share1_6_we),
    .wd     (key_share1_6_wd),
    .d      (hw2reg.key_share1[6].d),
    .qre    (),
    .qe     (reg2hw.key_share1[6].qe),
    .q      (reg2hw.key_share1[6].q ),
    .qs     ()
  );

  // Subregister 7 of Multireg key_share1
  // R[key_share1_7]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_key_share1_7 (
    .re     (1'b0),
    .we     (key_share1_7_we),
    .wd     (key_share1_7_wd),
    .d      (hw2reg.key_share1[7].d),
    .qre    (),
    .qe     (reg2hw.key_share1[7].qe),
    .q      (reg2hw.key_share1[7].q ),
    .qs     ()
  );



  // Subregister 0 of Multireg iv
  // R[iv_0]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_iv_0 (
    .re     (1'b0),
    .we     (iv_0_we),
    .wd     (iv_0_wd),
    .d      (hw2reg.iv[0].d),
    .qre    (),
    .qe     (reg2hw.iv[0].qe),
    .q      (reg2hw.iv[0].q ),
    .qs     ()
  );

  // Subregister 1 of Multireg iv
  // R[iv_1]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_iv_1 (
    .re     (1'b0),
    .we     (iv_1_we),
    .wd     (iv_1_wd),
    .d      (hw2reg.iv[1].d),
    .qre    (),
    .qe     (reg2hw.iv[1].qe),
    .q      (reg2hw.iv[1].q ),
    .qs     ()
  );

  // Subregister 2 of Multireg iv
  // R[iv_2]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_iv_2 (
    .re     (1'b0),
    .we     (iv_2_we),
    .wd     (iv_2_wd),
    .d      (hw2reg.iv[2].d),
    .qre    (),
    .qe     (reg2hw.iv[2].qe),
    .q      (reg2hw.iv[2].q ),
    .qs     ()
  );

  // Subregister 3 of Multireg iv
  // R[iv_3]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_iv_3 (
    .re     (1'b0),
    .we     (iv_3_we),
    .wd     (iv_3_wd),
    .d      (hw2reg.iv[3].d),
    .qre    (),
    .qe     (reg2hw.iv[3].qe),
    .q      (reg2hw.iv[3].q ),
    .qs     ()
  );



  // Subregister 0 of Multireg data_in
  // R[data_in_0]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("WO"),
    .RESVAL  (32'h0)
  ) u_data_in_0 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (data_in_0_we),
    .wd     (data_in_0_wd),

    // from internal hardware
    .de     (hw2reg.data_in[0].de),
    .d      (hw2reg.data_in[0].d ),

    // to internal hardware
    .qe     (reg2hw.data_in[0].qe),
    .q      (reg2hw.data_in[0].q ),

    .qs     ()
  );

  // Subregister 1 of Multireg data_in
  // R[data_in_1]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("WO"),
    .RESVAL  (32'h0)
  ) u_data_in_1 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (data_in_1_we),
    .wd     (data_in_1_wd),

    // from internal hardware
    .de     (hw2reg.data_in[1].de),
    .d      (hw2reg.data_in[1].d ),

    // to internal hardware
    .qe     (reg2hw.data_in[1].qe),
    .q      (reg2hw.data_in[1].q ),

    .qs     ()
  );

  // Subregister 2 of Multireg data_in
  // R[data_in_2]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("WO"),
    .RESVAL  (32'h0)
  ) u_data_in_2 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (data_in_2_we),
    .wd     (data_in_2_wd),

    // from internal hardware
    .de     (hw2reg.data_in[2].de),
    .d      (hw2reg.data_in[2].d ),

    // to internal hardware
    .qe     (reg2hw.data_in[2].qe),
    .q      (reg2hw.data_in[2].q ),

    .qs     ()
  );

  // Subregister 3 of Multireg data_in
  // R[data_in_3]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("WO"),
    .RESVAL  (32'h0)
  ) u_data_in_3 (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (data_in_3_we),
    .wd     (data_in_3_wd),

    // from internal hardware
    .de     (hw2reg.data_in[3].de),
    .d      (hw2reg.data_in[3].d ),

    // to internal hardware
    .qe     (reg2hw.data_in[3].qe),
    .q      (reg2hw.data_in[3].q ),

    .qs     ()
  );



  // Subregister 0 of Multireg data_out
  // R[data_out_0]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_data_out_0 (
    .re     (data_out_0_re),
    .we     (1'b0),
    .wd     ('0),
    .d      (hw2reg.data_out[0].d),
    .qre    (reg2hw.data_out[0].re),
    .qe     (),
    .q      (reg2hw.data_out[0].q ),
    .qs     (data_out_0_qs)
  );

  // Subregister 1 of Multireg data_out
  // R[data_out_1]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_data_out_1 (
    .re     (data_out_1_re),
    .we     (1'b0),
    .wd     ('0),
    .d      (hw2reg.data_out[1].d),
    .qre    (reg2hw.data_out[1].re),
    .qe     (),
    .q      (reg2hw.data_out[1].q ),
    .qs     (data_out_1_qs)
  );

  // Subregister 2 of Multireg data_out
  // R[data_out_2]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_data_out_2 (
    .re     (data_out_2_re),
    .we     (1'b0),
    .wd     ('0),
    .d      (hw2reg.data_out[2].d),
    .qre    (reg2hw.data_out[2].re),
    .qe     (),
    .q      (reg2hw.data_out[2].q ),
    .qs     (data_out_2_qs)
  );

  // Subregister 3 of Multireg data_out
  // R[data_out_3]: V(True)

  prim_subreg_ext #(
    .DW    (32)
  ) u_data_out_3 (
    .re     (data_out_3_re),
    .we     (1'b0),
    .wd     ('0),
    .d      (hw2reg.data_out[3].d),
    .qre    (reg2hw.data_out[3].re),
    .qe     (),
    .q      (reg2hw.data_out[3].q ),
    .qs     (data_out_3_qs)
  );


  // R[ctrl_shadowed]: V(True)

  //   F[operation]: 0:0
  prim_subreg_ext #(
    .DW    (1)
  ) u_ctrl_shadowed_operation (
    .re     (ctrl_shadowed_operation_re),
    .we     (ctrl_shadowed_operation_we),
    .wd     (ctrl_shadowed_operation_wd),
    .d      (hw2reg.ctrl_shadowed.operation.d),
    .qre    (reg2hw.ctrl_shadowed.operation.re),
    .qe     (reg2hw.ctrl_shadowed.operation.qe),
    .q      (reg2hw.ctrl_shadowed.operation.q ),
    .qs     (ctrl_shadowed_operation_qs)
  );


  //   F[mode]: 6:1
  prim_subreg_ext #(
    .DW    (6)
  ) u_ctrl_shadowed_mode (
    .re     (ctrl_shadowed_mode_re),
    .we     (ctrl_shadowed_mode_we),
    .wd     (ctrl_shadowed_mode_wd),
    .d      (hw2reg.ctrl_shadowed.mode.d),
    .qre    (reg2hw.ctrl_shadowed.mode.re),
    .qe     (reg2hw.ctrl_shadowed.mode.qe),
    .q      (reg2hw.ctrl_shadowed.mode.q ),
    .qs     (ctrl_shadowed_mode_qs)
  );


  //   F[key_len]: 9:7
  prim_subreg_ext #(
    .DW    (3)
  ) u_ctrl_shadowed_key_len (
    .re     (ctrl_shadowed_key_len_re),
    .we     (ctrl_shadowed_key_len_we),
    .wd     (ctrl_shadowed_key_len_wd),
    .d      (hw2reg.ctrl_shadowed.key_len.d),
    .qre    (reg2hw.ctrl_shadowed.key_len.re),
    .qe     (reg2hw.ctrl_shadowed.key_len.qe),
    .q      (reg2hw.ctrl_shadowed.key_len.q ),
    .qs     (ctrl_shadowed_key_len_qs)
  );


  //   F[manual_operation]: 10:10
  prim_subreg_ext #(
    .DW    (1)
  ) u_ctrl_shadowed_manual_operation (
    .re     (ctrl_shadowed_manual_operation_re),
    .we     (ctrl_shadowed_manual_operation_we),
    .wd     (ctrl_shadowed_manual_operation_wd),
    .d      (hw2reg.ctrl_shadowed.manual_operation.d),
    .qre    (reg2hw.ctrl_shadowed.manual_operation.re),
    .qe     (reg2hw.ctrl_shadowed.manual_operation.qe),
    .q      (reg2hw.ctrl_shadowed.manual_operation.q ),
    .qs     (ctrl_shadowed_manual_operation_qs)
  );


  // R[trigger]: V(False)

  //   F[start]: 0:0
  prim_subreg #(
    .DW      (1),
    .SWACCESS("WO"),
    .RESVAL  (1'h0)
  ) u_trigger_start (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (trigger_start_we),
    .wd     (trigger_start_wd),

    // from internal hardware
    .de     (hw2reg.trigger.start.de),
    .d      (hw2reg.trigger.start.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.trigger.start.q ),

    .qs     ()
  );


  //   F[key_clear]: 1:1
  prim_subreg #(
    .DW      (1),
    .SWACCESS("WO"),
    .RESVAL  (1'h1)
  ) u_trigger_key_clear (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (trigger_key_clear_we),
    .wd     (trigger_key_clear_wd),

    // from internal hardware
    .de     (hw2reg.trigger.key_clear.de),
    .d      (hw2reg.trigger.key_clear.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.trigger.key_clear.q ),

    .qs     ()
  );


  //   F[iv_clear]: 2:2
  prim_subreg #(
    .DW      (1),
    .SWACCESS("WO"),
    .RESVAL  (1'h1)
  ) u_trigger_iv_clear (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (trigger_iv_clear_we),
    .wd     (trigger_iv_clear_wd),

    // from internal hardware
    .de     (hw2reg.trigger.iv_clear.de),
    .d      (hw2reg.trigger.iv_clear.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.trigger.iv_clear.q ),

    .qs     ()
  );


  //   F[data_in_clear]: 3:3
  prim_subreg #(
    .DW      (1),
    .SWACCESS("WO"),
    .RESVAL  (1'h1)
  ) u_trigger_data_in_clear (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (trigger_data_in_clear_we),
    .wd     (trigger_data_in_clear_wd),

    // from internal hardware
    .de     (hw2reg.trigger.data_in_clear.de),
    .d      (hw2reg.trigger.data_in_clear.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.trigger.data_in_clear.q ),

    .qs     ()
  );


  //   F[data_out_clear]: 4:4
  prim_subreg #(
    .DW      (1),
    .SWACCESS("WO"),
    .RESVAL  (1'h1)
  ) u_trigger_data_out_clear (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (trigger_data_out_clear_we),
    .wd     (trigger_data_out_clear_wd),

    // from internal hardware
    .de     (hw2reg.trigger.data_out_clear.de),
    .d      (hw2reg.trigger.data_out_clear.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.trigger.data_out_clear.q ),

    .qs     ()
  );


  //   F[prng_reseed]: 5:5
  prim_subreg #(
    .DW      (1),
    .SWACCESS("WO"),
    .RESVAL  (1'h1)
  ) u_trigger_prng_reseed (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (trigger_prng_reseed_we),
    .wd     (trigger_prng_reseed_wd),

    // from internal hardware
    .de     (hw2reg.trigger.prng_reseed.de),
    .d      (hw2reg.trigger.prng_reseed.d ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.trigger.prng_reseed.q ),

    .qs     ()
  );


  // R[status]: V(False)

  //   F[idle]: 0:0
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h1)
  ) u_status_idle (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.status.idle.de),
    .d      (hw2reg.status.idle.d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (status_idle_qs)
  );


  //   F[stall]: 1:1
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_status_stall (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.status.stall.de),
    .d      (hw2reg.status.stall.d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (status_stall_qs)
  );


  //   F[output_valid]: 2:2
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_status_output_valid (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.status.output_valid.de),
    .d      (hw2reg.status.output_valid.d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (status_output_valid_qs)
  );


  //   F[input_ready]: 3:3
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h1)
  ) u_status_input_ready (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    .we     (1'b0),
    .wd     ('0  ),

    // from internal hardware
    .de     (hw2reg.status.input_ready.de),
    .d      (hw2reg.status.input_ready.d ),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (status_input_ready_qs)
  );




  logic [30:0] addr_hit;
  always_comb begin
    addr_hit = '0;
    addr_hit[ 0] = (reg_addr == AES_KEY_SHARE0_0_OFFSET);
    addr_hit[ 1] = (reg_addr == AES_KEY_SHARE0_1_OFFSET);
    addr_hit[ 2] = (reg_addr == AES_KEY_SHARE0_2_OFFSET);
    addr_hit[ 3] = (reg_addr == AES_KEY_SHARE0_3_OFFSET);
    addr_hit[ 4] = (reg_addr == AES_KEY_SHARE0_4_OFFSET);
    addr_hit[ 5] = (reg_addr == AES_KEY_SHARE0_5_OFFSET);
    addr_hit[ 6] = (reg_addr == AES_KEY_SHARE0_6_OFFSET);
    addr_hit[ 7] = (reg_addr == AES_KEY_SHARE0_7_OFFSET);
    addr_hit[ 8] = (reg_addr == AES_KEY_SHARE1_0_OFFSET);
    addr_hit[ 9] = (reg_addr == AES_KEY_SHARE1_1_OFFSET);
    addr_hit[10] = (reg_addr == AES_KEY_SHARE1_2_OFFSET);
    addr_hit[11] = (reg_addr == AES_KEY_SHARE1_3_OFFSET);
    addr_hit[12] = (reg_addr == AES_KEY_SHARE1_4_OFFSET);
    addr_hit[13] = (reg_addr == AES_KEY_SHARE1_5_OFFSET);
    addr_hit[14] = (reg_addr == AES_KEY_SHARE1_6_OFFSET);
    addr_hit[15] = (reg_addr == AES_KEY_SHARE1_7_OFFSET);
    addr_hit[16] = (reg_addr == AES_IV_0_OFFSET);
    addr_hit[17] = (reg_addr == AES_IV_1_OFFSET);
    addr_hit[18] = (reg_addr == AES_IV_2_OFFSET);
    addr_hit[19] = (reg_addr == AES_IV_3_OFFSET);
    addr_hit[20] = (reg_addr == AES_DATA_IN_0_OFFSET);
    addr_hit[21] = (reg_addr == AES_DATA_IN_1_OFFSET);
    addr_hit[22] = (reg_addr == AES_DATA_IN_2_OFFSET);
    addr_hit[23] = (reg_addr == AES_DATA_IN_3_OFFSET);
    addr_hit[24] = (reg_addr == AES_DATA_OUT_0_OFFSET);
    addr_hit[25] = (reg_addr == AES_DATA_OUT_1_OFFSET);
    addr_hit[26] = (reg_addr == AES_DATA_OUT_2_OFFSET);
    addr_hit[27] = (reg_addr == AES_DATA_OUT_3_OFFSET);
    addr_hit[28] = (reg_addr == AES_CTRL_SHADOWED_OFFSET);
    addr_hit[29] = (reg_addr == AES_TRIGGER_OFFSET);
    addr_hit[30] = (reg_addr == AES_STATUS_OFFSET);
  end

  assign addrmiss = (reg_re || reg_we) ? ~|addr_hit : 1'b0 ;

  // Check sub-word write is permitted
  always_comb begin
    wr_err = 1'b0;
    if (addr_hit[ 0] && reg_we && (AES_PERMIT[ 0] != (AES_PERMIT[ 0] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 1] && reg_we && (AES_PERMIT[ 1] != (AES_PERMIT[ 1] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 2] && reg_we && (AES_PERMIT[ 2] != (AES_PERMIT[ 2] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 3] && reg_we && (AES_PERMIT[ 3] != (AES_PERMIT[ 3] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 4] && reg_we && (AES_PERMIT[ 4] != (AES_PERMIT[ 4] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 5] && reg_we && (AES_PERMIT[ 5] != (AES_PERMIT[ 5] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 6] && reg_we && (AES_PERMIT[ 6] != (AES_PERMIT[ 6] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 7] && reg_we && (AES_PERMIT[ 7] != (AES_PERMIT[ 7] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 8] && reg_we && (AES_PERMIT[ 8] != (AES_PERMIT[ 8] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[ 9] && reg_we && (AES_PERMIT[ 9] != (AES_PERMIT[ 9] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[10] && reg_we && (AES_PERMIT[10] != (AES_PERMIT[10] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[11] && reg_we && (AES_PERMIT[11] != (AES_PERMIT[11] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[12] && reg_we && (AES_PERMIT[12] != (AES_PERMIT[12] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[13] && reg_we && (AES_PERMIT[13] != (AES_PERMIT[13] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[14] && reg_we && (AES_PERMIT[14] != (AES_PERMIT[14] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[15] && reg_we && (AES_PERMIT[15] != (AES_PERMIT[15] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[16] && reg_we && (AES_PERMIT[16] != (AES_PERMIT[16] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[17] && reg_we && (AES_PERMIT[17] != (AES_PERMIT[17] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[18] && reg_we && (AES_PERMIT[18] != (AES_PERMIT[18] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[19] && reg_we && (AES_PERMIT[19] != (AES_PERMIT[19] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[20] && reg_we && (AES_PERMIT[20] != (AES_PERMIT[20] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[21] && reg_we && (AES_PERMIT[21] != (AES_PERMIT[21] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[22] && reg_we && (AES_PERMIT[22] != (AES_PERMIT[22] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[23] && reg_we && (AES_PERMIT[23] != (AES_PERMIT[23] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[24] && reg_we && (AES_PERMIT[24] != (AES_PERMIT[24] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[25] && reg_we && (AES_PERMIT[25] != (AES_PERMIT[25] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[26] && reg_we && (AES_PERMIT[26] != (AES_PERMIT[26] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[27] && reg_we && (AES_PERMIT[27] != (AES_PERMIT[27] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[28] && reg_we && (AES_PERMIT[28] != (AES_PERMIT[28] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[29] && reg_we && (AES_PERMIT[29] != (AES_PERMIT[29] & reg_be))) wr_err = 1'b1 ;
    if (addr_hit[30] && reg_we && (AES_PERMIT[30] != (AES_PERMIT[30] & reg_be))) wr_err = 1'b1 ;
  end

  assign key_share0_0_we = addr_hit[0] & reg_we & ~wr_err;
  assign key_share0_0_wd = reg_wdata[31:0];

  assign key_share0_1_we = addr_hit[1] & reg_we & ~wr_err;
  assign key_share0_1_wd = reg_wdata[31:0];

  assign key_share0_2_we = addr_hit[2] & reg_we & ~wr_err;
  assign key_share0_2_wd = reg_wdata[31:0];

  assign key_share0_3_we = addr_hit[3] & reg_we & ~wr_err;
  assign key_share0_3_wd = reg_wdata[31:0];

  assign key_share0_4_we = addr_hit[4] & reg_we & ~wr_err;
  assign key_share0_4_wd = reg_wdata[31:0];

  assign key_share0_5_we = addr_hit[5] & reg_we & ~wr_err;
  assign key_share0_5_wd = reg_wdata[31:0];

  assign key_share0_6_we = addr_hit[6] & reg_we & ~wr_err;
  assign key_share0_6_wd = reg_wdata[31:0];

  assign key_share0_7_we = addr_hit[7] & reg_we & ~wr_err;
  assign key_share0_7_wd = reg_wdata[31:0];

  assign key_share1_0_we = addr_hit[8] & reg_we & ~wr_err;
  assign key_share1_0_wd = reg_wdata[31:0];

  assign key_share1_1_we = addr_hit[9] & reg_we & ~wr_err;
  assign key_share1_1_wd = reg_wdata[31:0];

  assign key_share1_2_we = addr_hit[10] & reg_we & ~wr_err;
  assign key_share1_2_wd = reg_wdata[31:0];

  assign key_share1_3_we = addr_hit[11] & reg_we & ~wr_err;
  assign key_share1_3_wd = reg_wdata[31:0];

  assign key_share1_4_we = addr_hit[12] & reg_we & ~wr_err;
  assign key_share1_4_wd = reg_wdata[31:0];

  assign key_share1_5_we = addr_hit[13] & reg_we & ~wr_err;
  assign key_share1_5_wd = reg_wdata[31:0];

  assign key_share1_6_we = addr_hit[14] & reg_we & ~wr_err;
  assign key_share1_6_wd = reg_wdata[31:0];

  assign key_share1_7_we = addr_hit[15] & reg_we & ~wr_err;
  assign key_share1_7_wd = reg_wdata[31:0];

  assign iv_0_we = addr_hit[16] & reg_we & ~wr_err;
  assign iv_0_wd = reg_wdata[31:0];

  assign iv_1_we = addr_hit[17] & reg_we & ~wr_err;
  assign iv_1_wd = reg_wdata[31:0];

  assign iv_2_we = addr_hit[18] & reg_we & ~wr_err;
  assign iv_2_wd = reg_wdata[31:0];

  assign iv_3_we = addr_hit[19] & reg_we & ~wr_err;
  assign iv_3_wd = reg_wdata[31:0];

  assign data_in_0_we = addr_hit[20] & reg_we & ~wr_err;
  assign data_in_0_wd = reg_wdata[31:0];

  assign data_in_1_we = addr_hit[21] & reg_we & ~wr_err;
  assign data_in_1_wd = reg_wdata[31:0];

  assign data_in_2_we = addr_hit[22] & reg_we & ~wr_err;
  assign data_in_2_wd = reg_wdata[31:0];

  assign data_in_3_we = addr_hit[23] & reg_we & ~wr_err;
  assign data_in_3_wd = reg_wdata[31:0];

  assign data_out_0_re = addr_hit[24] && reg_re;

  assign data_out_1_re = addr_hit[25] && reg_re;

  assign data_out_2_re = addr_hit[26] && reg_re;

  assign data_out_3_re = addr_hit[27] && reg_re;

  assign ctrl_shadowed_operation_we = addr_hit[28] & reg_we & ~wr_err;
  assign ctrl_shadowed_operation_wd = reg_wdata[0];
  assign ctrl_shadowed_operation_re = addr_hit[28] && reg_re;

  assign ctrl_shadowed_mode_we = addr_hit[28] & reg_we & ~wr_err;
  assign ctrl_shadowed_mode_wd = reg_wdata[6:1];
  assign ctrl_shadowed_mode_re = addr_hit[28] && reg_re;

  assign ctrl_shadowed_key_len_we = addr_hit[28] & reg_we & ~wr_err;
  assign ctrl_shadowed_key_len_wd = reg_wdata[9:7];
  assign ctrl_shadowed_key_len_re = addr_hit[28] && reg_re;

  assign ctrl_shadowed_manual_operation_we = addr_hit[28] & reg_we & ~wr_err;
  assign ctrl_shadowed_manual_operation_wd = reg_wdata[10];
  assign ctrl_shadowed_manual_operation_re = addr_hit[28] && reg_re;

  assign trigger_start_we = addr_hit[29] & reg_we & ~wr_err;
  assign trigger_start_wd = reg_wdata[0];

  assign trigger_key_clear_we = addr_hit[29] & reg_we & ~wr_err;
  assign trigger_key_clear_wd = reg_wdata[1];

  assign trigger_iv_clear_we = addr_hit[29] & reg_we & ~wr_err;
  assign trigger_iv_clear_wd = reg_wdata[2];

  assign trigger_data_in_clear_we = addr_hit[29] & reg_we & ~wr_err;
  assign trigger_data_in_clear_wd = reg_wdata[3];

  assign trigger_data_out_clear_we = addr_hit[29] & reg_we & ~wr_err;
  assign trigger_data_out_clear_wd = reg_wdata[4];

  assign trigger_prng_reseed_we = addr_hit[29] & reg_we & ~wr_err;
  assign trigger_prng_reseed_wd = reg_wdata[5];





  // Read data return
  always_comb begin
    reg_rdata_next = '0;
    unique case (1'b1)
      addr_hit[0]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[1]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[2]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[3]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[4]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[5]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[6]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[7]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[8]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[9]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[10]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[11]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[12]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[13]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[14]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[15]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[16]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[17]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[18]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[19]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[20]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[21]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[22]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[23]: begin
        reg_rdata_next[31:0] = '0;
      end

      addr_hit[24]: begin
        reg_rdata_next[31:0] = data_out_0_qs;
      end

      addr_hit[25]: begin
        reg_rdata_next[31:0] = data_out_1_qs;
      end

      addr_hit[26]: begin
        reg_rdata_next[31:0] = data_out_2_qs;
      end

      addr_hit[27]: begin
        reg_rdata_next[31:0] = data_out_3_qs;
      end

      addr_hit[28]: begin
        reg_rdata_next[0] = ctrl_shadowed_operation_qs;
        reg_rdata_next[6:1] = ctrl_shadowed_mode_qs;
        reg_rdata_next[9:7] = ctrl_shadowed_key_len_qs;
        reg_rdata_next[10] = ctrl_shadowed_manual_operation_qs;
      end

      addr_hit[29]: begin
        reg_rdata_next[0] = '0;
        reg_rdata_next[1] = '0;
        reg_rdata_next[2] = '0;
        reg_rdata_next[3] = '0;
        reg_rdata_next[4] = '0;
        reg_rdata_next[5] = '0;
      end

      addr_hit[30]: begin
        reg_rdata_next[0] = status_idle_qs;
        reg_rdata_next[1] = status_stall_qs;
        reg_rdata_next[2] = status_output_valid_qs;
        reg_rdata_next[3] = status_input_ready_qs;
      end

      default: begin
        reg_rdata_next = '1;
      end
    endcase
  end

  // Assertions for Register Interface
  `ASSERT_PULSE(wePulse, reg_we)
  `ASSERT_PULSE(rePulse, reg_re)

  `ASSERT(reAfterRv, $rose(reg_re || reg_we) |=> tl_o.d_valid)

  `ASSERT(en2addrHit, (reg_we || reg_re) |-> $onehot0(addr_hit))

  // this is formulated as an assumption such that the FPV testbenches do disprove this
  // property by mistake
  `ASSUME(reqParity, tl_reg_h2d.a_valid |-> tl_reg_h2d.a_user.parity_en == 1'b0)

endmodule
