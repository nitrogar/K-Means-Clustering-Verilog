`timescale 1ns / 1ps
module divider_test;
	 reg clk, ce, sclr;
	 reg [19:0] dividend;
	 reg [11:0] divisor;
	 wire [11:0] fractional;
	 wire [19:0] quotient;

	 
	divider d (
	.clk(clk), // input clk
	.ce(ce), // input ce
	.sclr(sclr), // input sclr
	.dividend(dividend), // input [19 : 0] dividend
	.divisor(divisor), // input [11 : 0] divisor
	.quotient(quotient), // output [19 : 0] quotient
	.fractional(fractional)); // output [11 : 0] fractional

	initial
		begin
			clk = 0; ce = 1; sclr = 0;
			forever #13 clk = ~clk;
		end
	
	initial begin
		dividend = 5234; divisor = 201;
		#760 dividend = 16315; divisor = 3883;
	end
endmodule
