module mean_file#(parameter K=16)(input clk , reset,update,input[(K)*24-1:0] m,output reg[(K)*24-1:0] means,output allStable);

//reg [K*24-1:0] means;
assign mo = means;
assign allStable = means == m;

always @(posedge clk,posedge reset) begin
    if(reset) begin 
        means <=  {K{1'b0}}; 
    end 

    else if(update) begin
        means <= m;
    end
end

endmodule