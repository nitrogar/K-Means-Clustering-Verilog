module cluster_engine(#parameter T=16)(input clk, reset , [23:0] pixelIn, output [(24*T)-1:0] means, [(72*T)-1:0] accumolator,[(12*T)-1:0] counters);

reg [23:0] pixel0,pixel1;
reg [T-1:0] closest;
wire distance[(12*T)-1:0];
wire pixelCounter[(12*T)-1:0]

genvar i;
generate
    for (i=1; i<=T; i=i+1) begin : generate_block_identifier // <-- example block name
        manhattan funct( 1'b1,pixel0, means[(i+1)*24-1:(i)*24],  distance[(i+1)*12-1:(i)*12]);
        cluster_thread thread (clk, reset, closest[i],  pixel1, accumolator[(i+1)*60-1:(i)*60],pixelCounter[(i+1)*12-1:(i)*12]);
    end 
endgenerate

distance_comparator cmp(distance,nearest_mean);




always @(posedge clk, posedge reset) begin
    if(reset) begin
        pixel0 <= 0;
        pixel1 <= 0;
    end
    pixel0 <= pixelIn;
    closest <= nearest_mean;
    pixel1 <= pixel0;

end



endmodule

