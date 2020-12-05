module main_tb;

reg Reset, clk, Start; 
reg [7:0] in_im [(4096*3)-1:0] ;
reg [7:0] Sin, [18:0] count ;




$readmemh ("C:\\Users\\atom\\Documents\\COE405\\Project\\sample_1.rgb", in_im) ;		// read the input image and 

initial begin	//the reset sequence and clock
	clk = 0 ; reset = 0 ; # 5 reset = 1 ; # 5 reset = 0 ;
	forever #10 clk = ~clk ;
	  end

always @ (negedge clk)	begin 	// Read input pixels from in_im
	Sin <= in_im [count] ;
	count <= count + 1 ;
	if (count==(297_600*3+1)) $stop ;
				end

initial @(posedge Strb) 	//at end of computations …
$fdisplay (32’b1, “Calculated Average %d \n Expected Average %d \n Passed”, Ave,Expected) ; 

endmodule					












endmodule 