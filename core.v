module core(
input clk, reset , [23:0] pixelIn, [7:0] init , [4:0] control 
output reg meanStable, reg busy, [23:0] meanOut, [9:0] distance  
);

	wire enable;
	wire compareOnly;
	wire isClosest;
	wire updateMean;

	assign {enable, compareOnly, isClosest, updateMean, allMeansStable} = control;
	
	reg [2:0] state;
	reg [23:0] pixel, mean, meanOld, [9:0] dist, [11:0] counter;
	reg [7:0] redAcc, blueAcc, greenAcc;
	
	localparam sleep      = 3'b000,
				  readPixel  = 3'b001,
				  calcDist   = 3'b010,
				  groupPixel = 3'b011,
				  idle       = 3'b100,
				  update = 3'b101,
				  coreReady  = 3'b110;
				  

	assign man_enable = (state == calcDist);
	assign div_enable = (state == update);

	manhattan dist_funct(man_enable, pixel, mean, d);
	divide red_div (div_enable, redAcc, counter, mean[23:16]);
	divide green_div (div_enable, greenAcc, counter, mean[15:8]);
	divide blue_div (div_enable, blueAcc, counter, mean[7:0]);

	always @(posedge clk, negedge reset) begin
		if (reset) 
			state <= sleep;
		else if(enable) begin
			case(state)
				 sleep: begin
					pixel <= 24'b0000_0000_0000_0000_0000; mean <= 24'b0000_0000_0000_0000_0000; meanOld <=  24'b0000_0000_0000_0000_0000;
					counter <= 12'b0000_0000_0000; dist <= 10'b00_0000_0000; 
					redAcc <= 8'b0000_0000; blueAcc <= 8'b0000_0000; greenAcc <= 8'b0000_0000;
				
					if (enable)
						state <= readPixel;
				end

				readPixel: begin
					pixel <= pixelIn; state <= calcDist;
				end
				
				calcDist: begin
					dist <= d;
					if (compareOnly)
						state <= readPixel;
					else if (isClosest)
						state <= groupPixel;
					else 
						state <= idle;
					end

				groupPixel: begin
					redAcc <= redAcc + pixel[23:16];
					greenAcc <= greenAcc + pixel[15:8];
					blueAcc <= blueAcc + pixel[7:0];
					counter <= counter + 1;
					if (updateMean)
						state <= update;
					else
						state <= readPixel;
				end

				idle: begin
					if (updateMean)
						state <= update;
					else
						state <= readPixel;
				end

				update: begin
					if (busyDivide == 0 && (mean == oldMean)) begin
						meanStable <= 1;
						state <= coreReady;
					end
					else if (busyDivide == 0) begin
						meanStable <= 0;
						state <= coreReady;
					end
					else
						state <= update;
				end

				coreReady: begin
					meanOut <= oldMean;
					if (allMeansStable)
						state <= coreReady;
					else
						state <= readPixel;
				end
			endcase
		end
	end
endmodule


////           [pixel] ==> [distance] ==> [acc]