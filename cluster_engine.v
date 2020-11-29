module cluster_engine #(parameter T=16)(input clk, reset , input [23:0] pixelIn,input[16*24-1:0] meanIn,input [15:0] enabled, output [(72*T)-1:0] accumolator,output [(12*T)-1:0] counters);

reg [23:0] pixel0,pixel1;
reg [15:0] closest;
wire [(10*T)-1:0] distance;
//wire [(12*T)-1:0] pixelCounter;
wire [15:0] nearest_mean;
// for debugging
wire [9:0] d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15;
assign {d15,d14,d13,d12,d11,d10,d9,d8,d7,d6,d5,d4,d3,d2,d1,d0} = distance;
wire [23:0] m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15;
assign {m15,m14,m13,m12,m11,m10,m9,m8,m7,m6,m5,m4,m3,m2,m1,m0} = meanIn;
wire [71:0] a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15;
assign {a15,a14,a13,a12,a11,a10,a9,a8,a7,a6,a5,a4,a3,a2,a1,a0} = accumolator;
wire [11:0] c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15;
assign {c15,c14,c13,c12,c11,c10,c9,c8,c7,c6,c5,c4,c3,c2,c1,c0} = counters;




// end for debugging
genvar i;
generate
    for (i=0; i<T; i=i+1) begin : generate_block_identifier // <-- example block name
        manhattan funct( 1'b1,pixel0, meanIn[i*24 +:24],distance[i*10 +:10]);
        cluster_thread thread (clk, reset, closest[i],  pixel1, accumolator[i*72 +:72],counters[i*12 +:12]);
    end 
endgenerate

		  distance_comparator cmp(distance,enabled,nearest_mean);




always @(posedge clk, posedge reset) begin
    if(reset) begin
        pixel0 <= 0;
        pixel1 <= 0;
		  closest <= 0;
    end
	 else begin
	 
    pixel0 <= pixelIn;
    closest <= nearest_mean;
    pixel1 <= pixel0;
	 end

end



endmodule

