// 1-bit full adder module

module FULL_ADDER_1b(a, b, cin, s, cout);

	// a, b, and cin are inputs of 1-bit full adder
	input a;
	input b;
	input cin;

	// s and cout are outputs of 1-bit full adder
	output s;
	output cout;

///////////////////////////////////////
//
// write your code here
	assign s = a ^ b ^ cin;
	assign cout = (a & b) | (b & cin) | (a & cin);
//
///////////////////////////////////////

endmodule
