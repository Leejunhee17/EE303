`timescale 1ns / 1ps

module decoder(
  input  i_A,
  input  i_B,
  input  i_C,
  input  i_D,

  output o_1,
  output o_2,
  output o_3,
  output o_4,
  output o_5,
  output o_6,
  output o_7
);

///////////////////////////////////////
//
// write your code here
//
///////////////////////////////////////
reg o1_R, o2_R, o3_R, o4_R, o5_R, o6_R, o7_R;
assign o_1 = o1_R, o_2 = o2_R, o_3 = o3_R, o_4 = o4_R, o_5 = o5_R ,o_6 = o6_R, o_7 = o7_R;

always @* begin
  o1_R = (i_D | i_C | i_B | ~i_A) & (~i_C | i_B | i_A);
  o2_R = (~i_C | i_B | ~i_A) & (~i_C | ~i_B | i_A);
  o3_R = i_D | i_C | ~i_B | i_A;
  o4_R = (i_D | i_C | i_B | ~i_A) & (~i_C | i_B | i_A) & (~i_C | ~i_B | ~i_A);
  o5_R = ((~i_C) & (~i_A)) | (i_B & (~i_A));
  o6_R = (i_D | i_C | ~i_A) & (~i_B | ~i_A) & (i_C | ~i_B);
  o7_R = (i_D | i_C | i_B) & (~i_C | ~i_B | ~i_A);
end
endmodule
