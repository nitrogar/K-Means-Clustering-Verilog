`timescale 1ns/1ns

module main_tb;

reg reset, clk, valid,endOfImage; 
reg [23:0] in_im [(4096*3)-1:0] ;
reg [23:0] Sin ;
reg [12:0] count ;
reg [24 * 16 - 1 : 0] meanIn;
reg [15:0] enabled;

wire [(72*2)-1:0] thread_0,thread_1,thread_2,thread_3,thread_4,thread_5,thread_6,thread_7,thread_8,thread_9,thread_10,thread_11,thread_12,thread_13,thread_14,thread_15;
wire [(12*2)-1:0] thread_counter_0,thread_counter_1,thread_counter_2,thread_counter_3,thread_counter_4,thread_counter_5,thread_counter_6,thread_counter_7,thread_counter_8,thread_counter_9,thread_counter_10,thread_counter_11,thread_counter_12,thread_counter_13,thread_counter_14,thread_counter_15;

wire [(16*72*2)-1:0] accumolator;
wire [(16*12*2)-1:0]counters;
wire [23 + 1:0] red_sum_0 , green_sum_0  ,blue_sum_0 ;
wire [23 + 1:0] red_sum_1 , green_sum_1  ,blue_sum_1 ;
wire [23 + 1:0] red_sum_2 , green_sum_2  ,blue_sum_2 ;
wire [23 + 1:0] red_sum_3 , green_sum_3  ,blue_sum_3 ;
wire [23 + 1:0] red_sum_4 , green_sum_4  ,blue_sum_4 ;
wire [23 + 1:0] red_sum_5 , green_sum_5  ,blue_sum_5 ;
wire [23 + 1:0] red_sum_6 , green_sum_6  ,blue_sum_6 ;
wire [23 + 1:0] red_sum_7 , green_sum_7  ,blue_sum_7 ;
wire [23 + 1:0] red_sum_8 , green_sum_8  ,blue_sum_8 ;
wire [23 + 1:0] red_sum_9 , green_sum_9  ,blue_sum_9 ;
wire [23 + 1:0] red_sum_10, green_sum_10 ,blue_sum_10 ;
wire [23 + 1:0] red_sum_11, green_sum_11 ,blue_sum_11 ;
wire [23 + 1:0] red_sum_12, green_sum_12 ,blue_sum_12 ;
wire [23 + 1:0] red_sum_13, green_sum_13 ,blue_sum_13 ;
wire [23 + 1:0] red_sum_14, green_sum_14 ,blue_sum_14 ;
wire [23 + 1:0] red_sum_15, green_sum_15 ,blue_sum_15 ;


wire [11 + 1:0]co_sum_0 ;
wire [11 + 1:0]co_sum_1 ;
wire [11 + 1:0]co_sum_2 ;
wire [11 + 1:0]co_sum_3 ;
wire [11 + 1:0]co_sum_4 ;
wire [11 + 1:0]co_sum_5 ;
wire [11 + 1:0]co_sum_6 ;
wire [11 + 1:0]co_sum_7 ;
wire [11 + 1:0]co_sum_8 ;
wire [11 + 1:0]co_sum_9 ;
wire [11 + 1:0]co_sum_10;
wire [11 + 1:0]co_sum_11;
wire [11 + 1:0]co_sum_12;
wire [11 + 1:0]co_sum_13;
wire [11 + 1:0]co_sum_14;
wire [11 + 1:0]co_sum_15;

initial begin
        $display("Loading image.\n");
        $readmemh("C:\\Users\\oxygen\\Documents\\GitHub\\K-Means-Clustering-Verilog\\sample_1.hex", in_im);
    end
	 

	 
	 

bengine #(.T(16)) be(clk , reset,valid,endOfImage,Sin,meanIn,enabled,accumolator,counters);
genvar i;        
generate 
		for (i = 0; i < 2 ; i = i + 1) begin : name
           assign thread_0[i*72 +: 72]  =  accumolator[i*72*16 + 0*72 +: 72];
           assign thread_1[i*72 +: 72]  =  accumolator[i*72*16 + 1*72 +: 72];
           assign thread_2[i*72 +: 72]  =  accumolator[i*72*16 + 2*72 +: 72];
           assign thread_3[i*72 +: 72]  =  accumolator[i*72*16 + 3*72 +: 72];
           assign thread_4[i*72 +: 72]  =  accumolator[i*72*16 + 4*72 +: 72];
           assign thread_5[i*72 +: 72]  =  accumolator[i*72*16 + 5*72 +: 72];
           assign thread_6[i*72 +: 72]  =  accumolator[i*72*16 + 6*72 +: 72];
           assign thread_7[i*72 +: 72]  =  accumolator[i*72*16 + 7*72 +: 72];
           assign thread_8[i*72 +: 72]  =  accumolator[i*72*16 + 8*72 +: 72];
           assign thread_9[i*72 +: 72]  =  accumolator[i*72*16 + 9*72 +: 72];
           assign thread_10[i*72 +: 72] =  accumolator[i*72*16 + 10*72 +: 72];
           assign thread_11[i*72 +: 72] =  accumolator[i*72*16 + 11*72 +: 72];
           assign thread_12[i*72 +: 72] =  accumolator[i*72*16 + 12*72 +: 72];
           assign thread_13[i*72 +: 72] =  accumolator[i*72*16 + 13*72 +: 72];
           assign thread_14[i*72 +: 72] =  accumolator[i*72*16 + 14*72 +: 72];
           assign thread_15[i*72 +: 72] =  accumolator[i*72*16 + 15*72 +: 72];
		   
		   assign thread_counter_0[i*12 +: 12]  =  counters[i*12*16 + 0*12 +: 12];
 		   assign thread_counter_1[i*12 +: 12]  =  counters[i*12*16 + 1*12 +: 12];
 		   assign thread_counter_2[i*12 +: 12]  =  counters[i*12*16 + 2*12 +: 12];
 		   assign thread_counter_3[i*12 +: 12]  =  counters[i*12*16 + 3*12 +: 12];
 		   assign thread_counter_4[i*12 +: 12]  =  counters[i*12*16 + 4*12 +: 12];
 		   assign thread_counter_5[i*12 +: 12]  =  counters[i*12*16 + 5*12 +: 12];
 		   assign thread_counter_6[i*12 +: 12]  =  counters[i*12*16 + 6*12 +: 12];
 		   assign thread_counter_7[i*12 +: 12]  =  counters[i*12*16 + 7*12 +: 12];
 		   assign thread_counter_8[i*12 +: 12]  =  counters[i*12*16 + 8*12 +: 12];
 		   assign thread_counter_9[i*12 +: 12]  =  counters[i*12*16 + 9*12 +: 12];
 		   assign thread_counter_10[i*12 +: 12] =  counters[i*12*16 + 10*12 +: 12];
 		   assign thread_counter_11[i*12 +: 12] =  counters[i*12*16 + 11*12 +: 12];
 		   assign thread_counter_12[i*12 +: 12] =  counters[i*12*16 + 12*12 +: 12];
 		   assign thread_counter_13[i*12 +: 12] =  counters[i*12*16 + 13*12 +: 12];
 		   assign thread_counter_14[i*12 +: 12] =  counters[i*12*16 + 14*12 +: 12];
 		   assign thread_counter_15[i*12 +: 12] =  counters[i*12*16 + 15*12 +: 12];

      end

	endgenerate	






sum_unit #(.NumOfEngines(2)) su0 ( clk, reset,thread_0,  thread_counter_0  ,red_sum_0 , green_sum_0  ,blue_sum_0, co_sum_0);
sum_unit #(.NumOfEngines(2)) su1 ( clk, reset,thread_1,  thread_counter_1  ,red_sum_1 , green_sum_1  ,blue_sum_1, co_sum_1);
sum_unit #(.NumOfEngines(2)) su2 ( clk, reset,thread_2,  thread_counter_2  ,red_sum_2 , green_sum_2  ,blue_sum_2, co_sum_2);
sum_unit #(.NumOfEngines(2)) su3 ( clk, reset,thread_3,  thread_counter_3  ,red_sum_3 , green_sum_3  ,blue_sum_3, co_sum_3);
sum_unit #(.NumOfEngines(2)) su4 ( clk, reset,thread_4,  thread_counter_4  ,red_sum_4 , green_sum_4  ,blue_sum_4, co_sum_4);
sum_unit #(.NumOfEngines(2)) su5 ( clk, reset,thread_5,  thread_counter_5  ,red_sum_5 , green_sum_5  ,blue_sum_5, co_sum_5);
sum_unit #(.NumOfEngines(2)) su6 ( clk, reset,thread_6,  thread_counter_6  ,red_sum_6 , green_sum_6  ,blue_sum_6, co_sum_6);
sum_unit #(.NumOfEngines(2)) su7 ( clk, reset,thread_7,  thread_counter_7  ,red_sum_7 , green_sum_7  ,blue_sum_7, co_sum_7);
sum_unit #(.NumOfEngines(2)) su8 ( clk, reset,thread_8,  thread_counter_8  ,red_sum_8 , green_sum_8  ,blue_sum_8, co_sum_8);
sum_unit #(.NumOfEngines(2)) su9 ( clk, reset,thread_9,  thread_counter_9  ,red_sum_9 , green_sum_9  ,blue_sum_9, co_sum_9);
sum_unit #(.NumOfEngines(2)) su10( clk, reset,thread_10, thread_counter_10 ,red_sum_10, green_sum_10 ,blue_sum_10,co_sum_10);
sum_unit #(.NumOfEngines(2)) su11( clk, reset,thread_11, thread_counter_11 ,red_sum_11, green_sum_11 ,blue_sum_11,co_sum_11);
sum_unit #(.NumOfEngines(2)) su12( clk, reset,thread_12, thread_counter_12 ,red_sum_12, green_sum_12 ,blue_sum_12,co_sum_12);
sum_unit #(.NumOfEngines(2)) su13( clk, reset,thread_13, thread_counter_13 ,red_sum_13, green_sum_13 ,blue_sum_13,co_sum_13);
sum_unit #(.NumOfEngines(2)) su14( clk, reset,thread_14, thread_counter_14 ,red_sum_14, green_sum_14 ,blue_sum_14,co_sum_14);
sum_unit #(.NumOfEngines(2)) su15( clk, reset,thread_15, thread_counter_15 ,red_sum_15, green_sum_15 ,blue_sum_15,co_sum_15);

		
		
		
		
		
initial begin	//the reset sequence and clock
	clk = 0 ; endOfImage=0; valid=0;reset = 0 ; count=0;
	meanIn = {								
											{3{8'd255}},
											{3{8'd224}},
											{3{8'd208}},
											{3{8'd192}},
											{3{8'd176}},
											{3{8'd160}},
											{3{8'd144}},
											{3{8'd128}},
											{3{8'd112}},
											{3{8'd96}},
											{3{8'd80}},
											{3{8'd64}},
											{3{8'd48}},
											{3{8'd32}},
											{3{8'd16}},
											{3{8'd0}}
											
											
											
											}; 
	enabled = {16{1'b1}}; #5 reset = 1 ;clk=1; #5 reset = 0; clk=0;  #5 valid = 1;
	repeat(30000) #5 clk = ~clk ;
	  end

always @ (negedge clk)	begin 	// Read input pixels from in_im
	if(valid) begin
	Sin <= in_im [count] ;
	count <= count + 1 ;
	end
	
	if (count==(50*56)) begin
	endOfImage = 1 ;
	Sin <= 0;
	$display("EndOfImage is hgih\n");
	end
	
	
end


endmodule					