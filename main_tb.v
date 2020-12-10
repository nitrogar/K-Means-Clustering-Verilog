`timescale 1ns/1ns

module main_tb;

reg reset, clk, valid,endOfImage; 
reg [23:0] in_im [(4096*3)-1:0] ;
reg [23:0] Sin;
reg [12:0] count;
reg [15:0] enabled;

reg [15:0] clk_counter;

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

wire [7:0] r_mean0, r_mean1, r_mean2, r_mean3,
r_mean4, r_mean5, r_mean6, r_mean7,
r_mean8, r_mean9, r_mean10, r_mean11,
r_mean12, r_mean13, r_mean14, r_mean15,

g_mean0, g_mean1, g_mean2, g_mean3,
g_mean4, g_mean5, g_mean6, g_mean7,
g_mean8, g_mean9, g_mean10, g_mean11,
g_mean12, g_mean13, g_mean14, g_mean15,

b_mean0, b_mean1, b_mean2, b_mean3,
b_mean4, b_mean5, b_mean6, b_mean7,
b_mean8, b_mean9, b_mean10, b_mean11,
b_mean12, b_mean13, b_mean14, b_mean15;

wire rgb_ready0, rgb_ready1, rgb_ready2, rgb_ready3, rgb_ready4, rgb_ready5, rgb_ready6, rgb_ready7, rgb_ready8, rgb_ready9, rgb_ready10, rgb_ready11, rgb_ready12, rgb_ready13, rgb_ready14, rgb_ready15;
wire final_ready;
wire allStable;
wire [24*16-1:0] meanIn;
wire [11 + 1:0]co_sum_0;
wire [11 + 1:0]co_sum_1;
wire [11 + 1:0]co_sum_2;
wire [11 + 1:0]co_sum_3;
wire [11 + 1:0]co_sum_4;
wire [11 + 1:0]co_sum_5;
wire [11 + 1:0]co_sum_6;
wire [11 + 1:0]co_sum_7;
wire [11 + 1:0]co_sum_8;
wire [11 + 1:0]co_sum_9;
wire [11 + 1:0]co_sum_10;
wire [11 + 1:0]co_sum_11;
wire [11 + 1:0]co_sum_12;
wire [11 + 1:0]co_sum_13;
wire [11 + 1:0]co_sum_14;
wire [11 + 1:0]co_sum_15;

initial begin
        $display("Loading image.\n");
        $readmemh("C:\\Users\\Hamza\\Documents\\KFUPM\\COE 405\\KMeans_System405\\sample_1.hex", in_im);
    end
	 

	 
	 

bengine #(.T(16)) be(clk , reset,valid,endOfImage,Sin,meanIn,enabled,accumolator, engine_done, counters);
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






sum_unit #(.NumOfEngines(2)) su0 ( clk, reset, engine_done, thread_0,  thread_counter_0  ,red_sum_0 , green_sum_0  ,blue_sum_0, co_sum_0, done0);
sum_unit #(.NumOfEngines(2)) su1 ( clk, reset, engine_done, thread_1,  thread_counter_1  ,red_sum_1 , green_sum_1  ,blue_sum_1, co_sum_1, done1);
sum_unit #(.NumOfEngines(2)) su2 ( clk, reset, engine_done, thread_2,  thread_counter_2  ,red_sum_2 , green_sum_2  ,blue_sum_2, co_sum_2, done2);
sum_unit #(.NumOfEngines(2)) su3 ( clk, reset, engine_done, thread_3,  thread_counter_3  ,red_sum_3 , green_sum_3  ,blue_sum_3, co_sum_3, done3);
sum_unit #(.NumOfEngines(2)) su4 ( clk, reset, engine_done, thread_4,  thread_counter_4  ,red_sum_4 , green_sum_4  ,blue_sum_4, co_sum_4, done4);
sum_unit #(.NumOfEngines(2)) su5 ( clk, reset, engine_done, thread_5,  thread_counter_5  ,red_sum_5 , green_sum_5  ,blue_sum_5, co_sum_5, done5);
sum_unit #(.NumOfEngines(2)) su6 ( clk, reset, engine_done, thread_6,  thread_counter_6  ,red_sum_6 , green_sum_6  ,blue_sum_6, co_sum_6, done6);
sum_unit #(.NumOfEngines(2)) su7 ( clk, reset, engine_done, thread_7,  thread_counter_7  ,red_sum_7 , green_sum_7  ,blue_sum_7, co_sum_7, done7);
sum_unit #(.NumOfEngines(2)) su8 ( clk, reset, engine_done, thread_8,  thread_counter_8  ,red_sum_8 , green_sum_8  ,blue_sum_8, co_sum_8, done8);
sum_unit #(.NumOfEngines(2)) su9 ( clk, reset, engine_done, thread_9,  thread_counter_9  ,red_sum_9 , green_sum_9  ,blue_sum_9, co_sum_9, done9);
sum_unit #(.NumOfEngines(2)) su10( clk, reset, engine_done, thread_10, thread_counter_10 ,red_sum_10, green_sum_10 ,blue_sum_10,co_sum_10, done10);
sum_unit #(.NumOfEngines(2)) su11( clk, reset, engine_done, thread_11, thread_counter_11 ,red_sum_11, green_sum_11 ,blue_sum_11,co_sum_11, done11);
sum_unit #(.NumOfEngines(2)) su12( clk, reset, engine_done, thread_12, thread_counter_12 ,red_sum_12, green_sum_12 ,blue_sum_12,co_sum_12, done12);
sum_unit #(.NumOfEngines(2)) su13( clk, reset, engine_done, thread_13, thread_counter_13 ,red_sum_13, green_sum_13 ,blue_sum_13,co_sum_13, done13);
sum_unit #(.NumOfEngines(2)) su14( clk, reset, engine_done, thread_14, thread_counter_14 ,red_sum_14, green_sum_14 ,blue_sum_14,co_sum_14, done14);
sum_unit #(.NumOfEngines(2)) su15( clk, reset, engine_done, thread_15, thread_counter_15 ,red_sum_15, green_sum_15 ,blue_sum_15,co_sum_15, done15);

assign done_all = done0 & done1 & done2 & done3 & done4 & done5 & done6 & done7 & done8 & done9 & done10 & done11 & done12 & done13 & done14 & done15 & ~final_ready;

mean_divider m_d0 (clk, done0, reset, enabled[0], red_sum_0, green_sum_0, blue_sum_0, co_sum_0, rgb_ready0, r_mean0, g_mean0, b_mean0);
mean_divider m_d1 (clk, done1, reset, enabled[1], red_sum_1, green_sum_1, blue_sum_1, co_sum_1, rgb_ready1, r_mean1, g_mean1, b_mean1);
mean_divider m_d2 (clk, done2, reset, enabled[2], red_sum_2, green_sum_2, blue_sum_2, co_sum_2, rgb_ready2, r_mean2, g_mean2, b_mean2);
mean_divider m_d3 (clk, done3, reset, enabled[3], red_sum_3, green_sum_3, blue_sum_3, co_sum_3, rgb_ready3, r_mean3, g_mean3, b_mean3);
mean_divider m_d4 (clk, done4, reset, enabled[4], red_sum_4, green_sum_4, blue_sum_4, co_sum_4, rgb_ready4, r_mean4, g_mean4, b_mean4);
mean_divider m_d5 (clk, done5, reset, enabled[5], red_sum_5, green_sum_5, blue_sum_5, co_sum_5, rgb_ready5, r_mean5, g_mean5, b_mean5);
mean_divider m_d6 (clk, done6, reset, enabled[6], red_sum_6, green_sum_6, blue_sum_6, co_sum_6, rgb_ready6, r_mean6, g_mean6, b_mean6);
mean_divider m_d7 (clk, done7, reset, enabled[7], red_sum_7, green_sum_7, blue_sum_7, co_sum_7, rgb_ready7, r_mean7, g_mean7, b_mean7);
mean_divider m_d8 (clk, done8, reset, enabled[8], red_sum_8, green_sum_8, blue_sum_8, co_sum_8, rgb_ready8, r_mean8, g_mean8, b_mean8);
mean_divider m_d9 (clk, done9, reset, enabled[9], red_sum_9, green_sum_9, blue_sum_9, co_sum_9, rgb_ready9, r_mean9, g_mean9, b_mean9);
mean_divider m_d10 (clk, done10, reset, enabled[10], red_sum_10, green_sum_10, blue_sum_10, co_sum_10, rgb_ready10, r_mean10, g_mean10, b_mean10);
mean_divider m_d11 (clk, done11, reset, enabled[11], red_sum_11, green_sum_11, blue_sum_11, co_sum_11, rgb_ready11, r_mean11, g_mean11, b_mean11);
mean_divider m_d12 (clk, done12, reset, enabled[12], red_sum_12, green_sum_12, blue_sum_12, co_sum_12, rgb_ready12, r_mean12, g_mean12, b_mean12);
mean_divider m_d13 (clk, done13, reset, enabled[13], red_sum_13, green_sum_13, blue_sum_13, co_sum_13, rgb_ready13, r_mean13, g_mean13, b_mean13);
mean_divider m_d14 (clk, done14, reset, enabled[14], red_sum_14, green_sum_14, blue_sum_14, co_sum_14, rgb_ready14, r_mean14, g_mean14, b_mean14);
mean_divider m_d15 (clk, done15, reset, enabled[15], red_sum_15, green_sum_15, blue_sum_15, co_sum_15, rgb_ready15, r_mean15, g_mean15, b_mean15);

assign rgb_ready = rgb_ready0 & rgb_ready1 & rgb_ready2 & rgb_ready3 & rgb_ready4 & rgb_ready5 & rgb_ready6 & rgb_ready7 & rgb_ready8 & rgb_ready9 & rgb_ready10 & rgb_ready11 & rgb_ready12 & rgb_ready13 & rgb_ready14 & rgb_ready15;

mean_file m_f(clk , reset, rgb_ready,{r_mean0, g_mean0, b_mean0, r_mean1, g_mean1, b_mean1, r_mean2, g_mean2, b_mean2, r_mean3, g_mean3, b_mean3,
r_mean4, g_mean4, b_mean4, r_mean5, g_mean5, b_mean5, r_mean6, g_mean6, b_mean6, r_mean7, g_mean7, b_mean7, 
r_mean8, g_mean8, b_mean8, r_mean9, g_mean9, b_mean9, r_mean10, g_mean10, b_mean10, r_mean11, g_mean11, b_mean11,
r_mean12, g_mean12, b_mean12, r_mean13, g_mean13, b_mean13, r_mean14, g_mean14, b_mean14, r_mean15, g_mean15, b_mean15}, meanIn, allStable);

/*pixel_divider p_d (clk, done_all, reset, enabled, red_sum_0, red_sum_1, red_sum_2,
	red_sum_3, red_sum_4, red_sum_5, red_sum_6, red_sum_7,
	red_sum_8, red_sum_9, red_sum_10, red_sum_11, red_sum_12,
	red_sum_13, red_sum_14, red_sum_15,
	green_sum_0, green_sum_1, green_sum_2,
	green_sum_3, green_sum_4, green_sum_5, green_sum_6, green_sum_7,
	green_sum_8, green_sum_9, green_sum_10, green_sum_11, green_sum_12,
	green_sum_13, green_sum_14, green_sum_15,
	blue_sum_0, blue_sum_1, blue_sum_2,
	blue_sum_3, blue_sum_4, blue_sum_5, blue_sum_6, blue_sum_7,
	blue_sum_8, blue_sum_9, blue_sum_10, blue_sum_11, blue_sum_12,
	blue_sum_13, blue_sum_14, blue_sum_15, co_sum_0, co_sum_1, co_sum_2, co_sum_3, co_sum_4, co_sum_5,
	co_sum_6, co_sum_7, co_sum_8, co_sum_9, co_sum_10, co_sum_11,
	co_sum_12, co_sum_13, co_sum_14, co_sum_15, final_ready, r_mean0, r_mean1, r_mean2, r_mean3, r_mean4, r_mean5,
	r_mean6, r_mean7, r_mean8, r_mean9, r_mean10, r_mean11,
	r_mean12, r_mean13, r_mean14, r_mean15, g_mean0, g_mean1, g_mean2, g_mean3, g_mean4, g_mean5,
	g_mean6, g_mean7, g_mean8, g_mean9, g_mean10, g_mean11,
	g_mean12, g_mean13, g_mean14, g_mean15, b_mean0, b_mean1, b_mean2, b_mean3, b_mean4, b_mean5,
	b_mean6, b_mean7, b_mean8, b_mean9, b_mean10, b_mean11,
	b_mean12, b_mean13, b_mean14, b_mean15); */

		
initial begin	//the reset sequence and clock
	clk = 0 ; endOfImage=0; valid=0;reset = 0 ; count=0; clk_counter = 0;
	enabled = {16{1'b1}}; #5 reset = 1 ;clk=1; #5 reset = 0; clk=0;  #5 valid = 1;
	repeat(30000) #5 clk = ~clk ;
	  end

always @ (negedge clk)	begin 	// Read input pixels from in_im
	clk_counter <= clk_counter + 1;
	$display("Clk cycle: %d, count: %d, End of Image: %x, Engine done: %x, done0: %x, rgb_ready0: %x, allMeansStable: %x", clk_counter, count, endOfImage, engine_done, done0, rgb_ready, allStable);
	if(valid) begin
	Sin <= in_im [count] ;
	count <= count + 1 ;
	end
	
	if (count==(50*56)) begin
	endOfImage = 1 ;
	Sin <= 0;
	valid <= 0;
	$display("EndOfImage is hgih\n");
	end
end

endmodule
