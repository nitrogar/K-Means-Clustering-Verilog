/// can be pipleined to improve propagation
module cluster_thread(input clk,reset,group,input [23:0] pixelIn, input [23:0] dmean ,output  [71:0] accumolator ,output reg [11:0] counter);
    reg [23:0] redAcc, greenAcc, blueAcc;
    //reg [11:0] counter;
    assign  accumolator = {redAcc, greenAcc, blueAcc};

    always @(posedge clk,posedge reset) begin
        if(reset) begin
            redAcc <=   0;
            greenAcc <= 0;
            blueAcc <=  0;
            counter <=  0;
        end
        else if(group) begin
            redAcc <= redAcc + pixelIn[23:16];
            greenAcc <= greenAcc + pixelIn[15:8]; 
            blueAcc <= blueAcc + pixelIn[7:0];
            counter <= counter + 1'b1; 
				$display("the closeset to %x%x%x is %x%x%x #",pixelIn[23:16],pixelIn[15:8],pixelIn[7:0],dmean[23:16],dmean[15:8],dmean[7:0]);
        end
    end
endmodule 