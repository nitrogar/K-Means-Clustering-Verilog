module bengine#(parameter T=16)(input clk , reset,valid,endOfImage,input [23:0] pixelIn, input[16*24-1:0] meanIn,input [15:0] enabled, output [(72*T*2)-1:0] accumolator,output [(12*T*2)-1:0] counters);

reg ab,e0valid,e1valid;
wire read;
reg [1:0] state;
reg  [11:0] fill;
reg  [10:0] memcount_0 , memcount_1;
wire wea,web;
wire [23:0] douta, doutb;
wire [11:0] addra, addrb;
localparam  write   = 2'b00,
            compute = 2'b01,
            done    = 2'b10;

wire [(12*T)-1:0] c0,c1;
wire [(72*T)-1:0] ac0,ac1;
/// for Debugging

wire [11:0] c1_15,c1_14,c1_13,c1_12,c1_11,c1_10,c1_9,c1_8,c1_7,c1_6,c1_5,c1_4,c1_3,c1_2,c1_1,c1_0;
wire [11:0] c0_15,c0_14,c0_13,c0_12,c0_11,c0_10,c0_9,c0_8,c0_7,c0_6,c0_5,c0_4,c0_3,c0_2,c0_1,c0_0;

wire [71:0] ac1_15,ac1_14,ac1_13,ac1_12,ac1_11,ac1_10,ac1_9,ac1_8,ac1_7,ac1_6,ac1_5,ac1_4,ac1_3,ac1_2,ac1_1,ac1_0;
wire [71:0] ac0_15,ac0_14,ac0_13,ac0_12,ac0_11,ac0_10,ac0_9,ac0_8,ac0_7,ac0_6,ac0_5,ac0_4,ac0_3,ac0_2,ac0_1,ac0_0;

assign {c1_15,c1_14,c1_13,c1_12,c1_11,c1_10,c1_9,c1_8,c1_7,c1_6,c1_5,c1_4,c1_3,c1_2,c1_1,c1_0} = c1;
assign {c0_15,c0_14,c0_13,c0_12,c0_11,c0_10,c0_9,c0_8,c0_7,c0_6,c0_5,c0_4,c0_3,c0_2,c0_1,c0_0} = c0;

assign {ac1_15,ac1_14,ac1_13,ac1_12,ac1_11,ac1_10,ac1_9,ac1_8,ac1_7,ac1_6,ac1_5,ac1_4,ac1_3,ac1_2,ac1_1,ac1_0} = ac1;
assign {ac0_15,ac0_14,ac0_13,ac0_12,ac0_11,ac0_10,ac0_9,ac0_8,ac0_7,ac0_6,ac0_5,ac0_4,ac0_3,ac0_2,ac0_1,ac0_0} = ac0;



/// end for Debugging
cluster_engine #(.T(16)) E1( clk, reset , e0valid ,douta,meanIn,  enabled, ac0 , c0);
cluster_engine #(.T(16)) E2( clk, reset , e1valid ,doutb,meanIn,  enabled, ac1 , c1);



assign addra = state == write ? fill : {memcount_0,1'b0}; // alwayse even
assign addrb = {memcount_1,1'b1}; // alwyase odd

assign wea = state ==  write ? 1'b1 :0;
assign read = state == compute;
assign accumolator = {ac1,ac0};
assign counters = {c1,c0};
/*
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
);*/

mb	mb_inst (
	.aclr ( reset ),
	.address_a ( addra ),
	.address_b ( addrb ),
	.clock ( clk ),
	.data_a ( pixelIn ),
	.data_b ( pixelIn ),
	.wren_a ( wea ),
	.wren_b ( 1'b0 ),
	.q_a ( douta ),
	.q_b ( doutb ),
	.rden_a ( read ),
	.rden_b ( read )
	);


always @(posedge clk) begin 
    if(reset) begin
        ab <= 0; 
        fill <= {12{1'b0}};
        memcount_0 <= {11{1'b0}};
        memcount_1 <= {11{1'b0}};
        e0valid <= 0;
        e1valid <= 0;
        state <= 0;
    end
    else
        case(state)
        write: begin
            if(valid) begin
                fill <= fill + 1; // the synthisis dublicate the value of ab on all 12 wires !!!
            end
            if(endOfImage) state <= compute;
        end
        compute: begin
            if({memcount_0,1'b0} <= fill) begin 
                memcount_0 <= memcount_0 + 1'b1;
                e0valid <= 1'b1;
            end
            else e0valid <= 1'b0;

            if({memcount_1,1'b1} <= fill) begin 
                memcount_1 <= memcount_1 + 1'b1;
                e1valid <= 1'b1;
            end
            else e1valid <= 1'b0;

            if({memcount_0,1'b0} == fill || {memcount_1,1'b1} == fill ) begin
					 state <= done;
					 e0valid <= 1'b0;
                e1valid <= 1'b0;

				end

        end
        /* done: just wait for reset*/
        endcase

end
endmodule