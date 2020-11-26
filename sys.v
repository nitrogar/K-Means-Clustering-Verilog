module sys #(parameter E=4,T=16)( input clk,reset,start,newImage,input [23:0] serialIn, output [23:0] c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15);

  reg [2:0] state;

  //wire meanUpdate,allMeanStable;
  //wire [T*24-1:0] means;
  wire [E*T*(72)-1:0] accumolator;
  wire [E*T*(12)-1:0] counters;
  wire [E*72-1:0] m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15;
  wire [E*12-1:0] mc0,mc1,mc2,mc3,mc4,mc5,mc6,mc7,mc8,mc9,mc10,mc11,mc12,mc13,mc14,mc15;

  mean_file mf0(clk,reset,meanUpdate,newMean,means,allMeanStable);  
  // main memory controller to fill each block//
	reg [15:0]en ;
  genvar i;
  generate
    for (i=0; i< E; i=i+1) begin :name
    // Memory Controller for each engine//
     cluster_engine e0(clk, reset , serialIn,means,en, accumolator[16*i*72 +:72*16] , counters[i*12*16 +:12*16]);

     assign m0 [i*72 +: 72] = accumolator [0*72 +72*16*i +:72];
     assign m1 [i*72 +: 72] = accumolator [1*72 +72*16*i +:72];
     assign m2 [i*72 +: 72] = accumolator [2*72 +72*16*i +:72];
     assign m3 [i*72 +: 72] = accumolator [3*72 +72*16*i +:72];
     assign m4 [i*72 +: 72] = accumolator [4*72 +72*16*i +:72];
     assign m5 [i*72 +: 72] = accumolator [5*72 +72*16*i +:72];
     assign m6 [i*72 +: 72] = accumolator [6*72 +72*16*i +:72];
     assign m7 [i*72 +: 72] = accumolator [7*72 +72*16*i +:72];
     assign m8 [i*72 +: 72] = accumolator [8*72 +72*16*i +:72];
     assign m9 [i*72 +: 72] = accumolator [9*72 +72*16*i +:72];
     assign m10[i*72 +: 72] = accumolator [10*72 +72*16*i +:72];
     assign m11[i*72 +: 72] = accumolator [11*72 +72*16*i +:72];
     assign m12[i*72 +: 72] = accumolator [12*72 +72*16*i +:72];
     assign m13[i*72 +: 72] = accumolator [13*72 +72*16*i +:72];
     assign m14[i*72 +: 72] = accumolator [14*72 +72*16*i +:72];
     assign m15[i*72 +: 72] = accumolator [15*72 +72*16*i +:72];
     assign mc0 [i*12 +: 12] = counters   [0*12 +12*16*i +:12];
     assign mc1 [i*12 +: 12] = counters   [1*12 +12*16*i +:12];
     assign mc2 [i*12 +: 12] = counters   [2*12 +12*16*i +:12];
     assign mc3 [i*12 +: 12] = counters   [3*12 +12*16*i +:12];
     assign mc4 [i*12 +: 12] = counters   [4*12 +12*16*i +:12];
     assign mc5 [i*12 +: 12] = counters   [5*12 +12*16*i +:12];
     assign mc6 [i*12 +: 12] = counters   [6*12 +12*16*i +:12];
     assign mc7 [i*12 +: 12] = counters   [7*12 +12*16*i +:12];
     assign mc8 [i*12 +: 12] = counters   [8*12 +12*16*i +:12];
     assign mc9 [i*12 +: 12] = counters   [9*12 +12*16*i +:12];
     assign mc10[i*12 +: 12] = counters   [10*12 +12*16*i +:12];
     assign mc11[i*12 +: 12] = counters   [11*12 +12*16*i +:12];
     assign mc12[i*12 +: 12] = counters   [12*12 +12*16*i +:12];
     assign mc13[i*12 +: 12] = counters   [13*12 +12*16*i +:12];
     assign mc14[i*12 +: 12] = counters   [14*12 +12*16*i +:12];
     assign mc15[i*12 +: 12] = counters   [15*12 +12*16*i +:12];
    end
    endgenerate

sum_unit #(.NumOfEngines(E))su0 (clk,reset,m0, mc0, red_sum0, green_sum0, blue_sum0, co_sum0);
sum_unit #(.NumOfEngines(E))su1 (clk,reset,m1, mc1, red_sum1, green_sum1, blue_sum1, co_sum1);
sum_unit #(.NumOfEngines(E))su2 (clk,reset,m2, mc2, red_sum2, green_sum2, blue_sum2, co_sum2);
sum_unit #(.NumOfEngines(E))su3 (clk,reset,m3, mc3, red_sum3, green_sum3, blue_sum3, co_sum3);
sum_unit #(.NumOfEngines(E))su4 (clk,reset,m4, mc4, red_sum4, green_sum4, blue_sum4, co_sum4);
sum_unit #(.NumOfEngines(E))su5 (clk,reset,m5, mc5, red_sum5, green_sum5, blue_sum5, co_sum5);
sum_unit #(.NumOfEngines(E))su6 (clk,reset,m6, mc6, red_sum6, green_sum6, blue_sum6, co_sum6);
sum_unit #(.NumOfEngines(E))su7 (clk,reset,m7, mc7, red_sum7, green_sum7, blue_sum7, co_sum7);
sum_unit #(.NumOfEngines(E))su8 (clk,reset,m8, mc8, red_sum8, green_sum8, blue_sum8, co_sum8);
sum_unit #(.NumOfEngines(E))su9 (clk,reset,m9, mc9, red_sum9, green_sum9, blue_sum9, co_sum9);
sum_unit #(.NumOfEngines(E))su10(clk,reset,m10,mc10,red_sum10,green_sum10,blue_sum10,co_sum10);
sum_unit #(.NumOfEngines(E))su11(clk,reset,m11,mc11,red_sum11,green_sum11,blue_sum11,co_sum11);
sum_unit #(.NumOfEngines(E))su12(clk,reset,m12,mc12,red_sum12,green_sum12,blue_sum12,co_sum12);
sum_unit #(.NumOfEngines(E))su13(clk,reset,m13,mc13,red_sum13,green_sum13,blue_sum13,co_sum13);
sum_unit #(.NumOfEngines(E))su14(clk,reset,m14,mc14,red_sum14,green_sum14,blue_sum14,co_sum14);
sum_unit #(.NumOfEngines(E))su15(clk,reset,m15,mc15,red_sum15,green_sum15,blue_sum15,co_sum15);

 
    localparam  inital        = 3'b000,
            readImageSizeAndK = 3'b001,
            storeImage        = 3'b010,
            readPixel         = 3'b011,
            accumolate        = 3'b110,
            divide            = 3'b100,
            stop              = 3'b101;

    

endmodule

