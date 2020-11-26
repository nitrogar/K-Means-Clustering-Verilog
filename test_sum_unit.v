`timescale 1ns/1ns

/* WORKS */
/* NOTHING NEEDS ATTENTION */
module test;

reg clk ,reset;
reg [4 * 24 * 16 * 3 - 1 : 0] ac;
reg [4 * 12 * 16 - 1 : 0] co;

sum_unit #(.NumOfEngines(4)) x(clk, reset,ac,co,red_sum,green_sum,blue_sum,co_sum);

initial begin
	reset = 1; clk = 1 ; #1 reset = 0;  repeat(100) #1 clk =~clk;
end


initial begin
	@(negedge clk) ac = {4{24'd1,24'd2,24'd3} } ; co = {4{12'd1}};
	#300 @(negedge clk) reset = 1;
	#100 	 @(negedge clk) ac = {4{24'd1,24'd2,24'd3} } ; co = {4{12'd1}};

end



endmodule 