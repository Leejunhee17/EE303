`timescale 1ns / 1ps

module MAC(
  input  wire        clk,
  input  wire        rst,

  input  wire [3:0]  din_a,
  input  wire [3:0]  din_b,
  input  wire [3:0]  din_c,
  input  wire        din_valid,

  output reg  [8:0]  dout_a,
  output reg         dout_valid
);

///////////////////////////////////////
//
// write your code here
reg[8:0] reg_AxB;
reg[3:0] reg_C;
reg reg_val;
always @ ( posedge clk ) begin
  dout_a = reg_AxB + reg_C;
  dout_valid = reg_val;

  reg_AxB = din_a * din_b;
  reg_C = din_c;
  reg_val = din_valid;
end
//
///////////////////////////////////////


endmodule
