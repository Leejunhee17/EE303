// Testing workbench module for 2-bit multipier
`timescale 1ns/1ps	// Simulation precision

module TEST_BENCH_MUL2b;

	reg[1:0] in1;
	reg[1:0] in2;
	wire[3:0] out;
	reg  [3:0] sol_cnt;
	
	parameter SOLUTION_1 = 4'b0000;
	parameter SOLUTION_2 = 4'b0001;
	parameter SOLUTION_3 = 4'b0010;
	parameter SOLUTION_4 = 4'b0011;
	parameter SOLUTION_5 = 4'b0010;
	parameter SOLUTION_6 = 4'b0100;
	parameter SOLUTION_7 = 4'b0110;
	parameter SOLUTION_8 = 4'b0011;
	parameter SOLUTION_9 = 4'b0110;
	parameter SOLUTION_10 = 4'b1001;
	
	MUL_2b M_2b(in1, in2, out);
	
	initial begin

	sol_cnt = 0;
	in1=2'b00;
	in2=2'b00;
	#10 
	$display("in1 = %b, in2 = %b, out = %b",in1, in2, out);
	#10
	if (out==SOLUTION_1) begin
    $display ("Case 1 is passed");
    sol_cnt = sol_cnt + 1;
	end
	else begin
    $display ("Case 1 is failed");
	end
	
	in1=2'b01;
	in2=2'b01;
	#10 
	$display("in1 = %b, in2 = %b, out = %b",in1, in2, out);
	#10
	if (out==SOLUTION_2) begin
    $display ("Case 2 is passed");
    sol_cnt = sol_cnt + 1;
	end
	else begin
    $display ("Case 2 is failed");
	end
	
	in1=2'b01;
	in2=2'b10;
	#10 
	$display("in1 = %b, in2 = %b, out = %b",in1, in2, out);
	#10
	if (out==SOLUTION_3) begin
    $display ("Case 3 is passed");
    sol_cnt = sol_cnt + 1;
	end
	else begin
    $display ("Case 3 is failed");
	end
	
	in1=2'b01;
	in2=2'b11;
	#10 
	$display("in1 = %b, in2 = %b, out = %b",in1, in2, out);
	#10
	if (out==SOLUTION_4) begin
    $display ("Case 4 is passed");
    sol_cnt = sol_cnt + 1;
	end
	else begin
    $display ("Case 4 is failed");
	end
	
	in1=2'b10;
	in2=2'b01;
	#10 
	$display("in1 = %b, in2 = %b, out = %b",in1, in2, out);
	#10
	if (out==SOLUTION_5) begin
    $display ("Case 5 is passed");
    sol_cnt = sol_cnt + 1;
	end
	else begin
    $display ("Case 5 is failed");
	end
	
	in1=2'b10;
	in2=2'b10;
	#10 
	$display("in1 = %b, in2 = %b, out = %b",in1, in2, out);
	#10
	if (out==SOLUTION_6) begin
    $display ("Case 6 is passed");
    sol_cnt = sol_cnt + 1;
	end
	else begin
    $display ("Case 6 is failed");
	end
	
	in1=2'b10;
	in2=2'b11;
	#10 
	$display("in1 = %b, in2 = %b, out = %b",in1, in2, out);
	#10
	if (out==SOLUTION_7) begin
    $display ("Case 7 is passed");
    sol_cnt = sol_cnt + 1;
	end
	else begin
    $display ("Case 7 is failed");
	end
	
	in1=2'b11;
	in2=2'b01;
	#10 
	$display("in1 = %b, in2 = %b, out = %b",in1, in2, out);
	#10
	if (out==SOLUTION_8) begin
    $display ("Case 8 is passed");
    sol_cnt = sol_cnt + 1;
	end
	else begin
    $display ("Case 8 is failed");
	end
	
	in1=2'b11;
	in2=2'b10;
	#10 
	$display("in1 = %b, in2 = %b, out = %b",in1, in2, out);
	#10
	if (out==SOLUTION_9) begin
    $display ("Case 9 is passed");
    sol_cnt = sol_cnt + 1;
	end
	else begin
    $display ("Case 9 is failed");
	end
	
	in1=2'b11;
	in2=2'b11;
	#10 
	$display("in1 = %b, in2 = %b, out = %b",in1, in2, out);
	#10
	if (out==SOLUTION_10) begin
    $display ("Case 10 is passed");
    sol_cnt = sol_cnt + 1;
	end
	else begin
    $display ("Case 10 is failed");
	end
  
	
	$display ("Total score: %d", sol_cnt);
	end
	
	// Include the following lines to export waveform during simulation
	initial begin
        $dumpfile("tb_mul2b.vcd");
        $dumpvars();
    end
	
endmodule