// DFF_SR module
module DFF_SR(
		input wire R, S, D, CLK,
		output reg Q, QN,
		output wire val);

///////////////////////////////////////////////
////////// Write your own code here! //////////
assign val = Q ^ QN;

always @ ( posedge CLK ) begin
	if ({R, S} == 2'b0_0) begin
		{Q, QN} = {D, ~D};
	end
	else if ({R, S} == 2'b1_0) begin
		{Q, QN} = 2'b0_1;
	end
	else if ({R, S} == 2'b0_1) begin
		{Q, QN} = 2'b1_0;
	end
	else if ({R, S} == 2'b1_1) begin
		{Q, QN} = 2'b1_1;
	end
	else begin
		{Q, QN} = 2'b0_0;
	end
end
///////////////////////////////////////////////

endmodule
