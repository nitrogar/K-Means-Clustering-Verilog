module sum_unit#(parameter SizeOfAcc=24,SizeOfCount=12,NumOfEngines=2)(
    input clk, reset,
    input [NumOfEngines * SizeOfAcc * 3 - 1 : 0] ac,
    input [NumOfEngines * SizeOfCount - 1 : 0] co,
    
    output [SizeOfAcc + NumOfEngines - 1 : 0] red_sum,
    output [SizeOfAcc + NumOfEngines - 1 : 0] green_sum,
    output [SizeOfAcc + NumOfEngines - 1 : 0] blue_sum,
    output [SizeOfCount + NumOfEngines - 1 : 0] co_sum,
    output reg done


);

genvar i, j;

reg [SizeOfAcc + NumOfEngines- 1 : 0] red_pipeline [2*NumOfEngines -1 : 1];   // Pipeline array
reg [SizeOfAcc + NumOfEngines- 1 : 0] green_pipeline [2*NumOfEngines - 1 : 1];   // Pipeline array
reg [SizeOfAcc + NumOfEngines- 1 : 0] blue_pipeline [2*NumOfEngines - 1 : 1];   // Pipeline array
reg [SizeOfCount + NumOfEngines- 1 : 0] counter_pipeline [2*NumOfEngines - 1 : 1];   // Pipeline array
reg [clog2(NumOfEngines)+1:0] stage;

assign red_sum = red_pipeline[1];
assign green_sum = green_pipeline[1];
assign blue_sum = blue_pipeline[1];
assign co_sum = counter_pipeline[1];


always @ (posedge clk) begin
    
     if (reset) begin : x
	  integer i;
        for (i=1; i<2*NumOfEngines; i=i+1) begin
            red_pipeline[i]     <= {SizeOfAcc + NumOfEngines{1'b0}};
            green_pipeline[i]   <= {SizeOfAcc + NumOfEngines{1'b0}};
            blue_pipeline[i]    <= {SizeOfAcc + NumOfEngines{1'b0}};
            counter_pipeline[i] <= {SizeOfCount + NumOfEngines{1'b0}};
        end
		  
		  done <= 0;
		  stage <= 0;
		end
	 else begin : y
		integer i;
		for (i = 2*NumOfEngines; i > NumOfEngines ; i = i - 1) begin
            red_pipeline[i-1]     <= ac[(2*NumOfEngines-i)*72+48 +: 24];
            green_pipeline[i-1]   <= ac[(2*NumOfEngines-i)*72+24 +: 24];
            blue_pipeline[i-1]    <= ac[(2*NumOfEngines-i)*72+0 +: 24];
            counter_pipeline[i-1] <= co[(2*NumOfEngines-i)*12 +: 12];
        end
		for (i = 1; i < NumOfEngines; i = i + 1) begin : add
		  red_pipeline[i]   <= red_pipeline[i*2] + red_pipeline[i*2 + 1];
        green_pipeline[i] <= green_pipeline[i*2] + green_pipeline[i*2 + 1];
        blue_pipeline[i]  <= blue_pipeline[i*2] + blue_pipeline[i*2 + 1];
        counter_pipeline[i] <= counter_pipeline[i*2] + counter_pipeline[i*2 + 1];
      end
		stage <= stage + 1;
		if(stage == clog2(NumOfEngines)) done <= 1;
		
	end

end


function integer clog2;
input integer value;
begin
value = value-1;
for (clog2=0; value>0; clog2=clog2+1)
value = value>>1;
end
endfunction
 

endmodule


