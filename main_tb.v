module main_tb;

reg Reset, clk, valid,endOfImage; 
reg [23:0] in_im [(4096*3)-1:0] ;
reg [23:0] Sin ;
reg [12:0] count ;
reg [24 * 16 - 1 : 0] meanIn;
reg [15:0] enabled;



$readmemh("C:\\Users\\user\\Documents\\kmean\\K-Means-Clustering-Verilo\\sample_1.rgb", in_im) ;		// read the input image and 

bengine #(T=16) be(clk , reset,valid,endOfImage,pixelIn,meanIn,enabled,accumolator,counters);


initial begin	//the reset sequence and clock
	clk = 0 ; endOfImage=0; valid=1;reset = 0 ; 
	meanIn = {{3{8'd0}},
											{3{8'd16}},
											{3{8'd32}},
											{3{8'd48}},
											{3{8'd64}},
											{3{8'd80}},
											{3{8'd96}},
											{3{8'd112}},
											{3{8'd128}},
											{3{8'd144}},
											{3{8'd160}},
											{3{8'd176}},
											{3{8'd192}},
											{3{8'd208}},
											{3{8'd224}},
											{3{8'd255}}}; 
	enabled = {16{1'b1}} # 5 reset = 1 ; # 5 reset = 0 ;
	forever #10 clk = ~clk ;
	  end

always @ (negedge clk)	begin 	// Read input pixels from in_im
	Sin <= in_im [count] ;
	count <= count + 1 ;
	if (count==(50*56)) $stop ;
	
end

initial @(posedge Strb) 	//at end of computations â€¦
$fdisplay (32'b1, "Calculated Average %d \n Expected Average %d \n Passed",accumolator,counters) ; 

endmodule					