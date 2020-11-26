module mean_file(#parameter K=16)(input clk , reset,update,[(K)*24-1:0] m,output allStable),

reg [(K)24-1:0] means;

assign allStable = means == m;

always @(posedge clk,posedge reset) begin
    if(reset) begin 
        mean0 <=  {K{1'b0}}; 
    end 

    else if(update) begin
        means <= m;
    end
end

endmodule