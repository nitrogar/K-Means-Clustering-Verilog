`timescale 1ns / 1ps

module divider_wrapper(input clk, sclr, [19:0] dividend, [11:0] divisor,
	 output wire ready, wire [19:0] quotient);
	 
	 assign ready = (quotient == 0) ? 0 : 1;
	 
		divider d (
			.clk(clk), // input clk
			.ce(clk), // input ce
			.sclr(sclr), // input sclr
			.dividend(dividend), // input [19 : 0] dividend
			.divisor(divisor), // input [11 : 0] divisor
			.quotient(quotient), // output [19 : 0] quotient
			.fractional(fractional)); // output [11 : 0] fractional
endmodule

