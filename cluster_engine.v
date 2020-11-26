module cluster_engine #(parameter T=16)(input clk, reset , input [23:0] pixelIn,input[16*24-1:0] meanIn,input [15:0] enabled, output [(72*T)-1:0] accumolator,output [(12*T)-1:0] counters);

reg [23:0] pixel0,pixel1;
reg [15:0] closest;
wire [(10*T)-1:0] distance;
wire [(12*T)-1:0] pixelCounter;

genvar i;
generate
    for (i=0; i<T; i=i+1) begin : generate_block_identifier // <-- example block name
        manhattan funct( 1'b1,pixel0, meanIn[i*24 +:24],distance[i*10 +:10]);
        cluster_thread thread (clk, reset, closest[i],  pixel1, accumolator[i*72 +:72],pixelCounter[i*12 +:12]);
    end 
endgenerate

		  distance_comparator cmp(distance,enabled,nearest_mean);




always @(posedge clk, posedge reset) begin
    if(reset) begin
        pixel0 <= 0;
        pixel1 <= 0;
    end
	 else begin
	 
    pixel0 <= pixelIn;
    closest <= nearest_mean;
    pixel1 <= pixel0;
	 end

end



endmodule

