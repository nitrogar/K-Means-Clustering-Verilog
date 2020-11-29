`timescale 1ns / 1ps

module pixel_divider(input clk, ce, reset, [15:0] en, [19:0] red_accum0, red_accum1, red_accum2,
	red_accum3, red_accum4, red_accum5, red_accum6, red_accum7,
	red_accum8, red_accum9, red_accum10, red_accum11, red_accum12,
	red_accum13, red_accum14, red_accum15,
	green_accum0, green_accum1, green_accum2,
	green_accum3, green_accum4, green_accum5, green_accum6, green_accum7,
	green_accum8, green_accum9, green_accum10, green_accum11, green_accum12,
	green_accum13, green_accum14, green_accum15,
	blue_accum0, blue_accum1, blue_accum2,
	blue_accum3, blue_accum4, blue_accum5, blue_accum6, blue_accum7,
	blue_accum8, blue_accum9, blue_accum10, blue_accum11, blue_accum12,
	blue_accum13, blue_accum14, blue_accum15, [11:0] count0, count1, count2, count3, count4, count5,
	count6, count7, count8, count9, count10, count11,
	count12, count13, count14, count15, output final_ready, [19:0] r_mean0, r_mean1, r_mean2, r_mean3, r_mean4, r_mean5,
	r_mean6, r_mean7, r_mean8, r_mean9, r_mean10, r_mean11,
	r_mean12, r_mean13, r_mean14, r_mean15, g_mean0, g_mean1, g_mean2, g_mean3, g_mean4, g_mean5,
	g_mean6, g_mean7, g_mean8, g_mean9, g_mean10, g_mean11,
	g_mean12, g_mean13, g_mean14, g_mean15, b_mean0, b_mean1, b_mean2, b_mean3, b_mean4, b_mean5,
	b_mean6, b_mean7, b_mean8, b_mean9, b_mean10, b_mean11,
	b_mean12, b_mean13, b_mean14, b_mean15);

	wire r_all_ready, g_all_ready, b_all_ready;
	assign final_ready = (r_all_ready && g_all_ready && b_all_ready);
	 
	pixel_component_divider red_divider(clk, ce, reset, en, red_accum0, red_accum1, red_accum2,
		red_accum3, red_accum4, red_accum5, red_accum6, red_accum7,
		red_accum8, red_accum9, red_accum10, red_accum11, red_accum12,
		red_accum13, red_accum14, red_accum15,
		count0, count1, count2, count3, count4, count5,
		count6, count7, count8, count9, count10, count11,
		count12, count13, count14, count15, r_all_ready,
		r_mean0, r_mean1, r_mean2, r_mean3, r_mean4, r_mean5,
		r_mean6, r_mean7, r_mean8, r_mean9, r_mean10, r_mean11,
		r_mean12, r_mean13, r_mean14, r_mean15);

	pixel_component_divider green_divider(clk, ce, reset, en, green_accum0, green_accum1, green_accum2,
		green_accum3, green_accum4, green_accum5, green_accum6, green_accum7,
		green_accum8, green_accum9, green_accum10, green_accum11, green_accum12,
		green_accum13, green_accum14, green_accum15,
		count0, count1, count2, count3, count4, count5,
		count6, count7, count8, count9, count10, count11,
		count12, count13, count14, count15, g_all_ready,
		g_mean0, g_mean1, g_mean2, g_mean3, g_mean4, g_mean5,
		g_mean6, g_mean7, g_mean8, g_mean9, g_mean10, g_mean11,
		g_mean12, g_mean13, g_mean14, g_mean15);

	pixel_component_divider blue_divider(clk, ce, reset, en, blue_accum0, blue_accum1, blue_accum2,
		blue_accum3, blue_accum4, blue_accum5, blue_accum6, blue_accum7,
		blue_accum8, blue_accum9, blue_accum10, blue_accum11, blue_accum12,
		blue_accum13, blue_accum14, blue_accum15,
		count0, count1, count2, count3, count4, count5,
		count6, count7, count8, count9, count10, count11,
		count12, count13, count14, count15, b_all_ready,
		b_mean0, b_mean1, b_mean2, b_mean3, b_mean4, b_mean5,
		b_mean6, b_mean7, b_mean8, b_mean9, b_mean10, b_mean11,
		b_mean12, b_mean13, b_mean14, b_mean15);
endmodule
