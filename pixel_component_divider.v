`timescale 1ns / 1ps

module pixel_divider (input clk, reset, [15:0] en, [19:0] divider0, dividend1, dividend2, dividend3,
								dividend4, dividend5, dividend6, dividend7, dividend8, 
								dividend9, dividend10, dividend11, dividend12, dividend13,
								dividend14, dividend15,
								[11:0] divisor0, divisor1, divisor2, divisor3, divisor4,
								divisor5, divisor6, divisor7, divisor8,
								divisor9, divisor10, divisor11, divisor12,
								divisor13, divisor14, divisor15,
								output all_ready, [19:0] q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15);
								
	wire [19:0] out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out11, out12, out13, out14, out15;
	wire [15:0] r;
	
	assign all_ready = (en == r); // if all the enabled divider bits are equal the concatenation of the ready bits from the dividers
											// then the division has finished and we are ready
	
	divider_wrapper d0 (clk, en[0], reset, dividend0, divisor0, r[0], out0);
	divider_wrapper d1 (clk, en[1], reset, dividend0, divisor0, r[1], out1);
	divider_wrapper d2 (clk, en[2], reset, dividend0, divisor0, r[2], out2);
	divider_wrapper d3 (clk, en[3], reset, dividend0, divisor0, r[3], out3);
	divider_wrapper d4 (clk, en[4], reset, dividend0, divisor0, r[4], out4);
	divider_wrapper d5 (clk, en[5], reset, dividend0, divisor0, r[5], out5);
	divider_wrapper d6 (clk, en[6], reset, dividend0, divisor0, r[6], out6);
	divider_wrapper d7 (clk, en[7], reset, dividend0, divisor0, r[7], out7);
	divider_wrapper d8 (clk, en[8], reset, dividend0, divisor0, r[8], out8);
	divider_wrapper d9 (clk, en[9], reset, dividend0, divisor0, r[9], out9);
	divider_wrapper d10 (clk, en[10], reset, dividend0, divisor0, r[10], out10);
	divider_wrapper d11 (clk, en[11], reset, dividend0, divisor0, r[11], out11);
	divider_wrapper d12 (clk, en[12], reset, dividend0, divisor0, r[12], out12);
	divider_wrapper d13 (clk, en[13], reset, dividend0, divisor0, r[13], out13);
	divider_wrapper d14 (clk, en[14], reset, dividend0, divisor0, r[14], out14);
	divider_wrapper d15 (clk, en[15], reset, dividend0, divisor0, r[15], out15);
	
endmodule
