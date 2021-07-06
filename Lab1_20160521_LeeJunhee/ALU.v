module ALU (
	input	[15:0]									A,
	input	[15:0]									B,
	input	[2:0]									SEL,
	output	[15:0]									ALU_OUT,
	output  										Cout
);

/********************************
  Write your own code here.
*********************************/
reg [3:1] C_;
reg [3:1] C;

reg[15:0] ALU_OUT_R;
reg Cout_;
reg Overflow_R;

assign ALU_OUT = ALU_OUT_R;
assign Cout = Overflow_R;

task FullAdder(
	input X, Y, Cin_,
	output Cout_, Sum
);
	begin
		assign Sum = X ^ Y ^ Cin_;
		assign Cout_ = (X & Y) | (Y & Cin_) | (X & Cin_);
	end
endtask

task Adder4(
	input [3:0] A_, B_,
	input Ci_,
	output Co_,
	output [3:0] S_
);
	begin
		FullAdder(A_[0], B_[0], Ci_, C_[1], S_[0]);
		FullAdder(A_[1], B_[1], C_[1], C_[2], S_[1]);
		FullAdder(A_[2], B_[2], C_[2], C_[3], S_[2]);
		FullAdder(A_[3], B_[3], C_[3], Co_, S_[3]);
	end
endtask

task Adder16(
	input [15:0] P, Q,
	input Ci,
	output Co,
	output [15:0] S
);
	begin
		Adder4(P[3:0], Q[3:0], Ci, C[1], S[3:0]);
		Adder4(P[7:4], Q[7:4], C[1], C[2], S[7:4]);
		Adder4(P[11:8], Q[11:8], C[2], C[3], S[11:8]);
		Adder4(P[15:12], Q[15:12], C[3], Co, S[15:12]);
	end
endtask

	always @* begin
		case(SEL)
			// ADD_SEL
			3'b000:
			 	begin
					Adder16(A, B, 0, Cout_, ALU_OUT_R);
					Overflow_R = (~A[15] & ~B[15] & ALU_OUT_R[15]) | (A[15] & B[15] & ~ALU_OUT_R[15]);
				end
			// SUB_SEL
			3'b001:
				begin
					Adder16(A, ~B, 1, Cout_, ALU_OUT_R);
					Overflow_R = (~A[15] & B[15] & ALU_OUT_R[15]) | (A[15] & ~B[15] & ~ALU_OUT_R[15]);
				end
			// NAND_SEL
			3'b010:
				begin
					ALU_OUT_R = ~(A & B);
					Overflow_R = 0;
				end
			// NOR_SEL
			3'b011:
				begin
					ALU_OUT_R = ~(A | B);
					Overflow_R = 0;
				end
			// NOT_SEL
			3'b100:
				begin
					ALU_OUT_R = ~A;
					Overflow_R = 0;
				end
			// LRS_SEL
			3'b101:
				begin
					ALU_OUT_R = A >> 1;
					Overflow_R = 0;
				end
		endcase
	end

endmodule
