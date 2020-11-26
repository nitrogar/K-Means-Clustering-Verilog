/// can be pipleined to improve propagation
module cluster_thread(input clk,reset,group, [23:0] pixelIn, output reg [71:0] accumolator ,[11:0] counter);
    reg [23:0] redAcc, greenAcc, blueAcc;
    reg [11:0] counter;

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
            counter <= counter + 1; 
        end
        else begin
            redAcc <= redAcc + 0;
            greenAcc <= greenAcc + 0; 
            blueAcc <= blueAcc + 0;
            counter <= counter + 0; 
        end
    end
endmodule 