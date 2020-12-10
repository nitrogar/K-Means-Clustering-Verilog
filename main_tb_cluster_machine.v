`timescale 1ns/1ns

module main_tb_cluster_machine;

reg reset, clk;
reg [23:0] in_im [(4096*3)-1:0] ;
reg [23:0] Sin;
reg [12:0] count;
reg start;
reg [15:0] clk_counter;
wire strb;
wire[23:0] m15, m14, m13, m12, m11, m10, m9, m8, m7, m6, m5, m4, m3, m2, m1, m0;
wire [2:0] state;
reg [2:0] tb_state;
localparam configuration = 3'b000, loading_image = 3'b001, compute = 3'b010, done = 3'b011, idle = 3'b100; 
Cluster_Machine c_m(clk, reset, start, Sin, strb, m15, m14, m13, m12, m11, m10, m9, m8, m7, m6, m5, m4, m3, m2, m1, m0, state);
	
initial begin
        $display("Loading image.\n");
        $readmemh("C:\\Users\\Hamza\\Documents\\KFUPM\\COE 405\\KMeans_System405\\sample_1.hex", in_im);
    end

initial begin	//the reset sequence and clock
	clk = 0;reset = 0 ; count=0; clk_counter = 0; tb_state = idle;
	#5 reset = 1 ;clk=1; #5 reset = 0; clk=0;
	repeat(30000) #5 clk = ~clk ;
	  end

always @ (negedge clk)	begin 	// Read input pixels from in_im
	case (tb_state)
		idle: begin
			start <= 1;
			tb_state <= configuration;
		end
		configuration: begin
			tb_state <= loading_image;
		end
		loading_image: begin
			if (count == 200)
				tb_state <= compute;
			else begin
				Sin <= in_im [count] ;
				count <= count + 1 ;
			end
		end
		compute:
			if (strb)
				tb_state <= done;
		done: begin
			$display("Done, M0: %x, M1: %x, M2: %x, M3: %x, M4: %x, M5: %x, M6: %x, M7: %x, M8: %x, M9: %x, M10: %x, M11: %x, M12: %x, M13: %x, M14: %x, M15: %x",
			m0, m1, m2, m3, m4, m5, m6, m7, m8, m9, 10, m11, m12, m13, m14, m15);
			$finish;
			end
		endcase
	clk_counter <= clk_counter + 1;
	// $display("Clk cycle: %d, count: %d, End of Image: %x, Engine done: %x, done0: %x, rgb_ready0: %x, allMeansStable: %x", clk_counter, count, endOfImage, engine_done, done0, rgb_ready, allStable);
	$display("Clk cycle: %d, count: %d, state: %d, tb_state: %d", clk_counter, count, state, tb_state);
end

endmodule
