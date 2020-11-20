module system(
    input clk,reset,start,newImage,[23:0] serialIn;
    output [23:0] c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15;
);
reg [11:0] address;
reg [11:0] imageSize;
reg [3:0] kCores;
reg [11:0] mem [23:0];
reg [3:0] state;
wire [15:0] enable_c;
wire [15:0] isClosest;
wire [15:0] meanStable;
wire [15:0] busy;
wire [23:0] data_out; // connect this with the memory out
wire core_clk;
//wire sorce; IMPORTANT CHECK !!!

// NOTE dont forget to start the core on read pixel state !!!
/// and cores clock with state == readPixel
localparam  inital            = 3'b000,
            readImageSizeAndK = 3'b001,
            storeImage        = 3'b010,
            readPixel         = 3'b011,
            endOfImage        = 3'b110, /// NEW STATE NEED TO BE PUT IN THE ASM Chart , at endOfImage if all cores are stable go to write state otherwise return to read pixel
            write             = 3'b100,
            stop              = 3'b101;

core_enable en(kCores,enable_c);

assign core_clk = (state == (readPixel | endOfImage | write));
assign compareOnly = (state == write);
assign updateMean = (state == endOfImage);
assign allMeansStable = |meanStable;
assign waitForCore = |busy; 
assign imageEnd = (address == imageSize);

core c0  (core_clk, reset, data_out, 8'd0,   {enable_c[0],  compareOnly, isClosest[0],  updateMean, allMeansStable}, meanStable[0],  busy[0],  meanOut_0,   distance_0);
core c1  (core_clk, reset, data_out, 8'd16,  {enable_c[1],  compareOnly, isClosest[1],  updateMean, allMeansStable}, meanStable[1],  busy[1],  meanOut_1,   distance_1);
core c2  (core_clk, reset, data_out, 8'd32,  {enable_c[2],  compareOnly, isClosest[2],  updateMean, allMeansStable}, meanStable[2],  busy[2],  meanOut_2,   distance_2);
core c3  (core_clk, reset, data_out, 8'd48,  {enable_c[3],  compareOnly, isClosest[3],  updateMean, allMeansStable}, meanStable[3],  busy[3],  meanOut_3,   distance_3);
core c4  (core_clk, reset, data_out, 8'd64,  {enable_c[4],  compareOnly, isClosest[4],  updateMean, allMeansStable}, meanStable[4],  busy[4],  meanOut_4,   distance_4);
core c5  (core_clk, reset, data_out, 8'd80,  {enable_c[5],  compareOnly, isClosest[5],  updateMean, allMeansStable}, meanStable[5],  busy[5],  meanOut_5,   distance_5);
core c6  (core_clk, reset, data_out, 8'd96,  {enable_c[6],  compareOnly, isClosest[6],  updateMean, allMeansStable}, meanStable[6],  busy[6],  meanOut_6,   distance_6);
core c7  (core_clk, reset, data_out, 8'd112, {enable_c[7],  compareOnly, isClosest[7],  updateMean, allMeansStable}, meanStable[7],  busy[7],  meanOut_7,   distance_7);
core c8  (core_clk, reset, data_out, 8'd128, {enable_c[8],  compareOnly, isClosest[8],  updateMean, allMeansStable}, meanStable[8],  busy[8],  meanOut_8,   distance_8);
core c9  (core_clk, reset, data_out, 8'd144, {enable_c[9],  compareOnly, isClosest[9],  updateMean, allMeansStable}, meanStable[9],  busy[9],  meanOut_9,   distance_9);
core c10 (core_clk, reset, data_out, 8'd160, {enable_c[10], compareOnly, isClosest[10], updateMean, allMeansStable}, meanStable[10], busy[10], meanOut_10,  distance_10);
core c11 (core_clk, reset, data_out, 8'd176, {enable_c[11], compareOnly, isClosest[11], updateMean, allMeansStable}, meanStable[11], busy[11], meanOut_11,  distance_11);
core c12 (core_clk, reset, data_out, 8'd192, {enable_c[12], compareOnly, isClosest[12], updateMean, allMeansStable}, meanStable[12], busy[12], meanOut_12,  distance_12);
core c13 (core_clk, reset, data_out, 8'd208, {enable_c[13], compareOnly, isClosest[13], updateMean, allMeansStable}, meanStable[13], busy[13], meanOut_13,  distance_13);
core c14 (core_clk, reset, data_out, 8'd224, {enable_c[14], compareOnly, isClosest[14], updateMean, allMeansStable}, meanStable[14], busy[14], meanOut_14,  distance_14);
core c15 (core_clk, reset, data_out, 8'd255, {enable_c[15], compareOnly, isClosest[15], updateMean, allMeansStable}, meanStable[15], busy[15], meanOut_15,  distance_15);

always @(posedge clk, negedge reset) begin
    if(reset)
        state <= inital;
    else
        case(state)
            inital: begin
                address <= 11'b000_0000_0000; imageSize 11'b000_0000_0000;
                kCores <= 3'b0000;
                if (start)
                    state <= readImageSizeAndK;
           end

            readImageSizeAndK: begin
                imageSize <= serialIn [11:0];
                kCores <= serialIn [15:12];
                state <= storeImage;
            end

            storeImage: begin
                mem[address] <= serialIn;
                if(imageEnd) begin
                    address <= 0;
                    state <= readPixel;
                end
                else begin
                    address <= address + 1;
                    state <= storeImage;
                end
            end

            readPixel: begin
                data_out <= mem[address];
                if (!waitForCore && imageEnd) begin
                    address <= 0;
                    state <= endOfImage;
                end
                else if (!waitForCore && !imageEnd)
                    address <= address + 1;
            end

            endOfImage: 
                if (!waitForCore && allMeansStable)
                    state <= write;
                else if(!waitForCore && !allMeansStable) 
                    state <= readPixel;

            write: begin
                mem[address] <= dataIn; // What is dataIn
                if (imageEnd)
                    state <= stop;
                address <= address + 1;
            end     
            stop: 
            if(newImage) 
                state <= inital;
        endcase
    end
endmodule 