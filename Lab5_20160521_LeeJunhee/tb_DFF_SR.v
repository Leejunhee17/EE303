// Testing workbench module for Synchronous Set-Reset D-Flip Flop
`timescale 1ns/1ps	// Simulation precision

module TEST_BENCH_DFF_SR;

///////////////////////////////////////////////
////////// Write your own code here! //////////
	parameter CLK_FREQ = 100;
	reg rst;
	reg CLK;

	reg  [3:0] sol_cnt;
	reg R, S ,D;
	wire Q, QN, val;

	///////////////////////////////////////

	initial begin
	  CLK = 0;
	  #1;
	  forever begin
	    CLK = #((1000/CLK_FREQ)/2) ~CLK;
	  end
	end

	///////////////////////////////////////

	DFF_SR u_DFFSR(R, S, D, CLK, Q, QN, val);

	initial begin

	sol_cnt = 0;
	{R, S, D} = 3'b0_0_0;
	#10
	$display("R = %b, S = %b, D = %b, Q = %b, Q' = %b, val = %b", R, S, D, Q, QN, val);
	#10
	if ({Q, QN, val} == 3'b0_1_1) begin
		$display ("Case 1 is passed");
		sol_cnt = sol_cnt + 1;
	end
	else begin
		$display ("Case 1 is failed");
	end

	{R, S, D} = 3'b0_0_1;
	#10
	$display("R = %b, S = %b, D = %b, Q = %b, Q' = %b, val = %b", R, S, D, Q, QN, val);
	#10
	if ({Q, QN, val} == 3'b1_0_1) begin
		$display ("Case 2 is passed");
		sol_cnt = sol_cnt + 1;
	end
	else begin
		$display ("Case 2 is failed");
	end

	{R, S, D} = 3'b1_0_0;
	#10
	$display("R = %b, S = %b, D = %b, Q = %b, Q' = %b, val = %b", R, S, D, Q, QN, val);
	#10
	if ({Q, QN, val} == 3'b0_1_1) begin
		$display ("Case 3 is passed");
		sol_cnt = sol_cnt + 1;
	end
	else begin
		$display ("Case 3 is failed");
	end

	{R, S, D} = 3'b1_0_1;
	#10
	$display("R = %b, S = %b, D = %b, Q = %b, Q' = %b, val = %b", R, S, D, Q, QN, val);
	#10
	if ({Q, QN, val} == 3'b0_1_1) begin
		$display ("Case 4 is passed");
		sol_cnt = sol_cnt + 1;
	end
	else begin
		$display ("Case 4 is failed");
	end

	{R, S, D} = 3'b0_1_0;
	#10
	$display("R = %b, S = %b, D = %b, Q = %b, Q' = %b, val = %b", R, S, D, Q, QN, val);
	#10
	if ({Q, QN, val} == 3'b1_0_1) begin
		$display ("Case 5 is passed");
		sol_cnt = sol_cnt + 1;
	end
	else begin
		$display ("Case 5 is failed");
	end

	{R, S, D} = 3'b0_1_1;
	#10
	$display("R = %b, S = %b, D = %b, Q = %b, Q' = %b, val = %b", R, S, D, Q, QN, val);
	#10
	if ({Q, QN, val} == 3'b1_0_1) begin
		$display ("Case 6 is passed");
		sol_cnt = sol_cnt + 1;
	end
	else begin
		$display ("Case 6 is failed");
	end

	{R, S, D} = 3'b1_1_0;
	#10
	$display("R = %b, S = %b, D = %b, Q = %b, Q' = %b, val = %b", R, S, D, Q, QN, val);
	#10
	if ({Q, QN, val} == 3'b1_1_0) begin
		$display ("Case 7 is passed");
		sol_cnt = sol_cnt + 1;
	end
	else begin
		$display ("Case 7 is failed");
	end

	{R, S, D} = 3'b1_1_1;
	#10
	$display("R = %b, S = %b, D = %b, Q = %b, Q' = %b, val = %b", R, S, D, Q, QN, val);
	#10
	if ({Q, QN, val} == 3'b1_1_0) begin
		$display ("Case 8 is passed");
		sol_cnt = sol_cnt + 1;
	end
	else begin
		$display ("Case 8 is failed");
	end

	$display ("Total score: %d", sol_cnt);
	$finish;
	end

	// Include the following lines to export waveform during simulation
	initial begin
				$dumpfile("tb_DFF_SR.vcd");
				$dumpvars();
		end
	///////////////////////////////////////////////

endmodule
