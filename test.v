`timescale 1ns/1ns

/* WORKS */
/* NOTHING NEEDS ATTENTION */
module test;

reg clk ,reset;
reg [23 : 0] pixelIn;
reg [24 * 16 - 1 : 0] meanIn;
reg [15:0] enabled;

cluster_engine e0(clk,reset ,pixelIn,meanIn,enabled, accumolator,counters);

initial begin
	reset = 1; clk = 1 ; meanIn = {{3{8'd0}},
											{3{8'd16}},
											{3{8'd32}},
											{3{8'd48}},
											{3{8'd64}},
											{3{8'd80}},
											{3{8'd96}},
											{3{8'd112}},
											{3{8'd128}},
											{3{8'd144}},
											{3{8'd160}},
											{3{8'd176}},
											{3{8'd192}},
											{3{8'd208}},
											{3{8'd224}},
											{3{8'd255}}}; 
	enabled = {16{1'b1}} ;#1 reset = 0;  repeat(1000) #1 clk =~clk;
end


initial begin
	@(negedge clk) pixelIn = {3{24'd16} };

end



endmodule 