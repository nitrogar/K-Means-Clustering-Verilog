`timescale 1ns / 1ps

module pixel_component_divider (input clk, ce, reset, [15:0] en, [19:0] divider0, dividend1, dividend2, dividend3,
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
											
	assign q0 = (all_ready) ? out0 : 20'b0; 
	assign q1 = (all_ready) ? out1 : 20'b0;
	assign q2 = (all_ready) ? out2 : 20'b0;
	assign q3 = (all_ready) ? out3 : 20'b0;
	assign q4 = (all_ready) ? out4 : 20'b0;
	assign q5 = (all_ready) ? out5 : 20'b0;
	assign q6 = (all_ready) ? out6 : 20'b0;
	assign q7 = (all_ready) ? out7 : 20'b0;
	assign q8 = (all_ready) ? out8 : 20'b0;
	assign q9 = (all_ready) ? out9 : 20'b0;
	assign q10 = (all_ready) ? out10 : 20'b0;
	assign q11 = (all_ready) ? out11 : 20'b0;
	assign q12 = (all_ready) ? out12: 20'b0;
	assign q13 = (all_ready) ? out13 : 20'b0;
	assign q14 = (all_ready) ? out14 : 20'b0;
	assign q15 = (all_ready) ? out15 : 20'b0;
	
	divider_wrapper d0 (clk, ce, en[0], reset, dividend0, divisor0, r[0], out0);
	divider_wrapper d1 (clk, ce, en[1], reset, dividend1, divisor1, r[1], out1);
	divider_wrapper d2 (clk, ce, en[2], reset, dividend2, divisor2, r[2], out2);
	divider_wrapper d3 (clk, ce, en[3], reset, dividend3, divisor3, r[3], out3);
	divider_wrapper d4 (clk, ce, en[4], reset, dividend4, divisor4, r[4], out4);
	divider_wrapper d5 (clk, ce, en[5], reset, dividend5, divisor5, r[5], out5);
	divider_wrapper d6 (clk, ce, en[6], reset, dividend6, divisor6, r[6], out6);
	divider_wrapper d7 (clk, ce, en[7], reset, dividend7, divisor7, r[7], out7);
	divider_wrapper d8 (clk, ce, en[8], reset, dividend8, divisor8, r[8], out8);
	divider_wrapper d9 (clk, ce, en[9], reset, dividend9, divisor9, r[9], out9);
	divider_wrapper d10 (clk, ce, en[10], reset, dividend10, divisor10, r[10], out10);
	divider_wrapper d11 (clk, ce, en[11], reset, dividend11, divisor11, r[11], out11);
	divider_wrapper d12 (clk, ce, en[12], reset, dividend12, divisor12, r[12], out12);
	divider_wrapper d13 (clk, ce, en[13], reset, dividend13, divisor13, r[13], out13);
	divider_wrapper d14 (clk, ce, en[14], reset, dividend14, divisor14, r[14], out14);
	divider_wrapper d15 (clk, ce, en[15], reset, dividend15, divisor15, r[15], out15);
	
endmodule
