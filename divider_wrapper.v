`timescale 1ns / 1ps

module divider_wrapper(input clk, ce, sclr, [19:0] dividend, [11:0] divisor,
	 output wire ready, wire [19:0] quotient);
	 
	 assign ready = (quotient == 0) ? 0 : 1;
	 
		divider d (
			.clk(clk), // input clk
			.ce(ce), // input ce
			.sclr(sclr), // input sclr
			.dividend(dividend), // input [19 : 0] dividend
			.divisor(divisor), // input [11 : 0] divisor
			.quotient(quotient), // output [19 : 0] quotient
			.fractional(fractional)); // output [11 : 0] fractional
			
			memory your_instance_name (
				.clka(clka), // input clka
				.ena(ena), // input ena
				.wea(wea), // input [0 : 0] wea
				.addra(addra), // input [8 : 0] addra
				.dina(dina), // input [23 : 0] dina
				.douta(douta), // output [23 : 0] douta
				.clkb(clkb), // input clkb
				.web(web), // input [0 : 0] web
				.addrb(addrb), // input [8 : 0] addrb
				.dinb(dinb), // input [23 : 0] dinb
				.doutb(doutb) // output [23 : 0] doutb
			);
endmodule
