module systemV2 (#parameter E=16,K=16,T=16)( input clk,reset,start,newImage,[23:0] serialIn, output [23:0] c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15)

  reg [2:0] state;

  wire meanUpdate,allMeanStable;
  wire [K*24-1:0] means;
  wire [E*T*(72)-1:0] accumolator;
  wire [E*T*(12)-1:0] counters
  mean_file mf0(clk,reset,meanUpdate,means,allMeanStable);  
  // main memory controller to fill each block//

  genvar i;
  generate
    for (i=1; i<=E; i=i+1) begin
    // Memory Controller for each engine//
     cluser_engine e0(clk, reset , /* Data out */, accumolator[(i+1)*72-1:(i)*72] , counters[(i+1)*12-1:(i)*12]);
end 
endgenerate
 
    localparam  inital        = 3'b000,
            readImageSizeAndK = 3'b001,
            storeImage        = 3'b010,
            readPixel         = 3'b011,
            accumolate        = 3'b110,
            divide            = 3'b100,
            stop              = 3'b101;

    always @(posedge clk , posedge reset) begin
        if(reset) state <= inital;
        else 
            case(state)
                readPixel: begin
                    




                end



            endcase




end


endmodule

