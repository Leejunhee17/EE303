// 2-bit Multiplier module
module MUL_2b(in1, in2, out);

	// in1 and in2 are 2-bit unsigned inputs of multiplier
	input [1:0] in1;
	input [1:0] in2;

	// out is 4-bit unsigned output of multiplier
	output [3:0] out;

///////////////////////////////////////
//
// write your code here
	reg [3:0] out_R;
	reg a1, b1, cin1, a2, b2, cin2;
	wire s1, cout1, s2, cout2;
	assign out = out_R;

	FULL_ADDER_1b FA1 (a1, b1, cin1, s1, cout1);
	FULL_ADDER_1b FA2 (a2, b2, cin2, s2, cout2);

	reg [2:0] in12;
	reg a3, b3, cin3, a4, b4, cin4, a5, b5, cin5;
	wire s3, cout3, s4, cout4, s5, cout5;
	FULL_ADDER_1b FA3 (a3, b3, cin3, s3, cout3);
	FULL_ADDER_1b FA4 (a4, b4, cin4, s4, cout4);
	FULL_ADDER_1b FA5 (a5, b5, cin5, s5, cout5);

	always @* begin
		if (in2 == 2'b00) begin
			out_R = 4'b0000;
		end
		else if (in2 == 2'b01) begin
			out_R = in1;
		end
		else if (in2 == 2'b10) begin
			a1 = in1[0];
			b1 = in1[0];
			cin1 = 1'b0;
			out_R[0] = s1;
			a2 = in1[1];
			b2 = in1[1];
			cin2 = cout1;
			out_R[1] = s2;
			out_R[2] = cout2;
		end
		else begin
			a1 = in1[0];
			b1 = in1[0];
			cin1 = 1'b0;
			in12[0] = s1;
			a2 = in1[1];
			b2 = in1[1];
			cin2 = cout1;
			in12[1] = s2;
			in12[2] = cout2;

			a3 = in1[0];
			b3 = in12[0];
			cin3 = 1'b0;
			out_R[0] = s3;
			a4 = in1[1];
			b4 = in12[1];
			cin4 = cout3;
			out_R[1] = s4;
			a5 = cout4;
			b5 = in12[2];
			cin5 = 1'b0;
			out_R[2] = s5;
			out_R[3] = cout5;
		end
	end
//
///////////////////////////////////////

endmodule
