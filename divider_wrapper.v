`timescale 1ns / 1ps

module divider_wrapper(input clk, ce, en, sclr, [19:0] dividend, [11:0] divisor,
	 output wire ready, wire [19:0] quotient);
	 
	 assign ready = (quotient == 0) ? 0 : 1;
	 assign enable = (ce && en); // ce is enabled when we need to divide while en is enabled when the cluster mean is activated for the whole algorithm
		divider d (
			.clk(clk), // input clk
			.ce(enable), // input ce
			.sclr(sclr), // input sclr
			.dividend(dividend), // input [19 : 0] dividend
			.divisor(divisor), // input [11 : 0] divisor
			.quotient(quotient), // output [19 : 0] quotient
			.fractional(fractional)); // output [11 : 0] fractional
endmodule
