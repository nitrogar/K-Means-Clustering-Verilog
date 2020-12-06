module bengine#(parameter T=16)(input clk , reset,valid,endOfImage,input [23:0] pixelIn, input[16*24-1:0] meanIn,input [15:0] enabled, output [(72*T*2)-1:0] accumolator,output [(12*T*2)-1:0] counters);

reg ab,e0valid,e1valid;
reg e0valid , e1valid;
reg [1:0] state;
reg  [11:0] addra,[11:0] addrb;
reg  [11:0] memcount_0 , [11:0] memcount_1;
wire wea,web;
wire [23:0] douta, [23:0] doutb;



assign wea = ~ab;
assign web = ab;

assign accumolator = {ac1,ac0};
assign counters = {c1,c0};
mb your_instance_name (
  .clka(clk), // input clka
  .rsta(reset), // input rsta
  .wea(wea), // input [0 : 0] wea
  .addra(addra), // input [11 : 0] addra
  .dina(pixelIn), // input [23 : 0] dina
  .douta(douta), // output [23 : 0] douta
  .clkb(clk), // input clkb
  .rstb(reset), // input rstb
  .web(web), // input [0 : 0] web
  .addrb(addrb), // input [11 : 0] addrb
  .dinb(pixelIn), // input [23 : 0] dinb
  .doutb(doutb) // output [23 : 0] doutb
);


cluster_engine #(T=16) E1( clk, reset , e0valid ,douta,meanIn,  enabled, ac0 , c0);
cluster_engine #(T=16) E2( clk, reset , e1valid ,doutb,meanIn,  enabled, ac1 , c1);


localparam  write   = 2'b00,
            compute = 2'b01,
            done    = 2'b10;

always @(posedge clk) begin 
    if(reset) begin
        ab <= 0; 
        addra <= {12{1'b0}};
        addrb <= {12{1'b0}}
        memcount_0 <= {12{1'b0}};
        memcount_1 <= {12{1'b0}}
    end
    else
        case(state):
        write: begin
            if(valid) begin
                addra <= addra + ~ab;
                addrb <= addrb + ab;
                ab <= ~ab;                
            end
            if(endOfImage) state <= compute;

        compute: begin
            if(memcount_0 <= addra) begin 
                memcount_0 <= memcount_0 + 1'b1;
                e0valid <= 1'b1;
            end
            else e0valid <= 1'b0;

            if(memcount_1 <= addrb) begin 
                memcount_1 <= memcount_1 + 1'b1;
                e1valid <= 1'b1;
            end
            else e1valid <= 1'b0;

            if(memcount_0 <= addra && memcount_1 <= addrb)
                state <= done;

        end
        /* done: just wait for reset*/
end
endmodule