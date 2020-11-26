// WRONG MOVE IT OUTSIDE.


module sum(input clk,start,input [2*16*72-1:0] accumolators , input [2*16*12-1:0] counters,output [16*73-1+1:0] finalAcc,output [16*12-1:0]finalCo);
    //localparam sizeColorAcc = /*clog2(4000);*/
    //localparam sizeOfCountersSum = /*clog2(4000/E);*/

assign [71:0] {Red0_0 ,  Green0_0 ,  Blue0_0 } = accumolators[72*1 -1 : 72*0 ];
assign [71:0] {Red1_0 ,  Green1_0 ,  Blue1_0 } = accumolators[72*2 -1 : 72*1 ];
assign [71:0] {Red2_0 ,  Green2_0 ,  Blue2_0 } = accumolators[72*3 -1 : 72*2 ];
assign [71:0] {Red3_0 ,  Green3_0 ,  Blue3_0 } = accumolators[72*4 -1 : 72*3 ];
assign [71:0] {Red4_0 ,  Green4_0 ,  Blue4_0 } = accumolators[72*5 -1 : 72*4 ];
assign [71:0] {Red5_0 ,  Green5_0 ,  Blue5_0 } = accumolators[72*6 -1 : 72*5 ];
assign [71:0] {Red6_0 ,  Green6_0 ,  Blue6_0 } = accumolators[72*7 -1 : 72*6 ];
assign [71:0] {Red7_0 ,  Green7_0 ,  Blue7_0 } = accumolators[72*8 -1 : 72*7 ];
assign [71:0] {Red8_0 ,  Green8_0 ,  Blue8_0 } = accumolators[72*9 -1 : 72*8 ];
assign [71:0] {Red9_0 ,  Green9_0 ,  Blue9_0 } = accumolators[72*10-1 : 72*9 ];
assign [71:0] {Red10_0,  Green10_0,  Blue10_0} = accumolators[72*11-1: 72*10] ;
assign [71:0] {Red11_0,  Green11_0,  Blue11_0} = accumolators[72*12-1: 72*11] ;
assign [71:0] {Red12_0,  Green12_0,  Blue12_0} = accumolators[72*13-1: 72*12] ;
assign [71:0] {Red13_0,  Green13_0,  Blue13_0} = accumolators[72*14-1: 72*13] ;
assign [71:0] {Red14_0,  Green14_0,  Blue14_0} = accumolators[72*15-1: 72*14] ;
assign [71:0] {Red15_0,  Green15_0,  Blue15_0} = accumolators[72*16-1: 72*15] ;

assign [16*12-1:0]{c0_0,c1_0,c2_0,c3_0,c4_0,c5_0,c6_0,c7_0,c8_0,c9_0,c10_0,c11_0,c12_0,c13_0,c14_0,c15_0} = counters[16*12-1:0];
assign [16*12-1:0]{c0_1,c1_1,c2_1,c3_1,c4_1,c5_1,c6_1,c7_1,c8_1,c9_1,c10_1,c11_1,c12_1,c13_1,c14_1,c15_1} = counters[16*12-1 + 16*12:0 +16*12];

assign [71:0] {Red0_1 ,  Green0_1  ,  Blue0_1 } = accumolators[72*0-1  + 72*16: 72*0 + 72*16];
assign [71:0] {Red1_1 ,  Green1_1  ,  Blue1_1 } = accumolators[72*1-1  + 72*16: 72*1 + 72*16];
assign [71:0] {Red2_1 ,  Green2_1  ,  Blue2_1 } = accumolators[72*2-1  + 72*16: 72*2 + 72*16];
assign [71:0] {Red3_1 ,  Green3_1  ,  Blue3_1 } = accumolators[72*3-1  + 72*16: 72*3 + 72*16];
assign [71:0] {Red4_1 ,  Green4_1  ,  Blue4_1 } = accumolators[72*4-1  + 72*16: 72*4 + 72*16];
assign [71:0] {Red5_1 ,  Green5_1  ,  Blue5_1 } = accumolators[72*5-1  + 72*16: 72*5 + 72*16];
assign [71:0] {Red6_1 ,  Green6_1  ,  Blue6_1 } = accumolators[72*6-1  + 72*16: 72*6 + 72*16];
assign [71:0] {Red7_1 ,  Green7_1  ,  Blue7_1 } = accumolators[72*7-1  + 72*16: 72*7 + 72*16];
assign [71:0] {Red8_1 ,  Green8_1  ,  Blue8_1 } = accumolators[72*8-1  + 72*16: 72*8 + 72*16];
assign [71:0] {Red9_1 ,  Green9_1  ,  Blue9_1 } = accumolators[72*9-1  + 72*16: 72*9 + 72*16];
assign [71:0] {Red10_1,  Green10_1 ,  Blue10_1} = accumolators[72*10-1 + 72*16: 72*10+ 72*16];
assign [71:0] {Red11_1,  Green11_1 ,  Blue11_1} = accumolators[72*11-1 + 72*16: 72*11+ 72*16];
assign [71:0] {Red12_1,  Green12_1 ,  Blue12_1} = accumolators[72*12-1 + 72*16: 72*12+ 72*16];
assign [71:0] {Red13_1,  Green13_1 ,  Blue13_1} = accumolators[72*13-1 + 72*16: 72*13+ 72*16];
assign [71:0] {Red14_1,  Green14_1 ,  Blue14_1} = accumolators[72*14-1 + 72*16: 72*14+ 72*16];
assign [71:0] {Red15_1,  Green15_1 ,  Blue15_1} = accumolators[72*15-1 + 72*16: 72*15+ 72*16];






reg [73-1:0]  finalRed0,  finalGreen0,  finalBlue0 ;
reg [73-1:0]  finalRed1,  finalGreen1,  finalBlue1 ;
reg [73-1:0]  finalRed2,  finalGreen2,  finalBlue2 ;
reg [73-1:0]  finalRed3,  finalGreen3,  finalBlue3 ;
reg [73-1:0]  finalRed4,  finalGreen4,  finalBlue4 ;
reg [73-1:0]  finalRed5,  finalGreen5,  finalBlue5 ;
reg [73-1:0]  finalRed6,  finalGreen6,  finalBlue6 ;
reg [73-1:0]  finalRed7,  finalGreen7,  finalBlue7 ;
reg [73-1:0]  finalRed8,  finalGreen8,  finalBlue8 ;
reg [73-1:0]  finalRed9,  finalGreen9,  finalBlue9 ;
reg [73-1:0]  finalRed10, finalGreen10, finalBlue10 ;
reg [73-1:0]  finalRed11, finalGreen11, finalBlue11 ;
reg [73-1:0]  finalRed12, finalGreen12, finalBlue12 ;
reg [73-1:0]  finalRed13, finalGreen13, finalBlue13 ;
reg [73-1:0]  finalRed14, finalGreen14, finalBlue14 ;
reg [73-1:0]  finalRed15, finalGreen15, finalBlue15 ;

reg [13-1:0] counter0;
reg [13-1:0] counter1;
reg [13-1:0] counter2;
reg [13-1:0] counter3;
reg [13-1:0] counter4;
reg [13-1:0] counter5;
reg [13-1:0] counter6;
reg [13-1:0] counter7;
reg [13-1:0] counter8;
reg [13-1:0] counter9;
reg [13-1:0] counter10;
reg [13-1:0] counter11;
reg [13-1:0] counter12;
reg [13-1:0] counter13;
reg [13-1:0] counter14;
reg [13-1:0] counter15;
assign T0 = {Red0_0 ,  Green0_0 ,  Blue0_0 };
//assign finalAcc = {}
always @(clk) begin
    if(start) begin
        finalRed0  <= Red0_0  + Red0_1  ;  finalGreen0 <=  Green0_0  + Green0_1 ;   finalBlue0  <=   Blue0_0  + Blue0_1 ;
        finalRed1  <= Red1_0  + Red1_1  ;  finalGreen1 <=  Green1_0  + Green1_1 ;   finalBlue1  <=   Blue1_0  + Blue1_1 ;
        finalRed2  <= Red2_0  + Red2_1  ;  finalGreen2 <=  Green2_0  + Green2_1 ;   finalBlue2  <=   Blue2_0  + Blue2_1 ;
        finalRed3  <= Red3_0  + Red3_1  ;  finalGreen3 <=  Green3_0  + Green3_1 ;   finalBlue3  <=   Blue3_0  + Blue3_1 ;
        finalRed4  <= Red4_0  + Red4_1  ;  finalGreen4 <=  Green4_0  + Green4_1 ;   finalBlue4  <=   Blue4_0  + Blue4_1 ;
        finalRed5  <= Red5_0  + Red5_1  ;  finalGreen5 <=  Green5_0  + Green5_1 ;   finalBlue5  <=   Blue5_0  + Blue5_1 ;
        finalRed6  <= Red6_0  + Red6_1  ;  finalGreen6 <=  Green6_0  + Green6_1 ;   finalBlue6  <=   Blue6_0  + Blue6_1 ;
        finalRed7  <= Red7_0  + Red7_1  ;  finalGreen7 <=  Green7_0  + Green7_1 ;   finalBlue7  <=   Blue7_0  + Blue7_1 ;
        finalRed8  <= Red8_0  + Red8_1  ;  finalGreen8 <=  Green8_0  + Green8_1 ;   finalBlue8  <=   Blue8_0  + Blue8_1 ;
        finalRed9  <= Red9_0  + Red9_1  ;  finalGreen9 <=  Green9_0  + Green9_1 ;   finalBlue9  <=   Blue9_0  + Blue9_1 ;
        finalRed10 <= Red10_0 + Red10_1 ; finalGreen10 <=  Green10_0 + Green10_1;   finalBlue10 <=   Blue10_0 + Blue10_1;
        finalRed11 <= Red11_0 + Red11_1 ; finalGreen11 <=  Green11_0 + Green11_1;   finalBlue11 <=   Blue11_0 + Blue11_1;
        finalRed12 <= Red12_0 + Red12_1 ; finalGreen12 <=  Green12_0 + Green12_1;   finalBlue12 <=   Blue12_0 + Blue12_1;
        finalRed13 <= Red13_0 + Red13_1 ; finalGreen13 <=  Green13_0 + Green13_1;   finalBlue13 <=   Blue13_0 + Blue13_1;
        finalRed14 <= Red14_0 + Red14_1 ; finalGreen14 <=  Green14_0 + Green14_1;   finalBlue14 <=   Blue14_0 + Blue14_1;
        finalRed15 <= Red15_0 + Red15_1 ; finalGreen15 <=  Green15_0 + Green15_1;   finalBlue15 <=   Blue15_0 + Blue15_1;

         counter0 <= c0_0 +  c0_1;
         counter1 <= c1_0 +  c1_1;
         counter2 <= c2_0 +  c2_1;
         counter3 <= c3_0 +  c3_1;
         counter4 <= c4_0 +  c4_1;
         counter5 <= c5_0 +  c5_1;
         counter6 <= c6_0 +  c6_1;
         counter7 <= c7_0 +  c7_1;
         counter8 <= c8_0 +  c8_1;
         counter9 <= c9_0 +  c9_1;
         counter10 <= c10_0 + c10_1;
         counter11 <= c11_0 + c11_1;
         counter12 <= c12_0 + c12_1;
         counter13 <= c13_0 + c13_1;
         counter14 <= c14_0 + c14_1;
         counter15 <= c15_0 + c15_1;

    end


end



/*
// Sum Counters 
integer i;
reg [E+72:0] temp_data;
always @* begin
     temp_data = 0;
     for (i = 0; i < E; i = i + 1) 
       temp_data = temp_data + counters[(i+1)*12 - 1:  i*(12)];
     finalCounter = temp_data;
    end
     



function integer clog2;
input integer value;
begin
value = value-1;
for (clog2=0; value>0; clog2=clog2+1)
value = value>>1;
end
endfunction
endmodule 

*/