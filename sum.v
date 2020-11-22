module sum(#parameter E=16,T=16)(input [E*T*72-1:0] accumolators , [E*T*12-1:0] counters, );
    localparam sizeColorAcc = clog2(255*4000*E*T); /// size of each color accumolator register, for example if we have E=10 engines then each engine will have T=16 thread
                                            /// who has T one color accumolatro (red or green or blue . in each thread) ; so the size of all single color registers = 255*T*E
    localparam sizeOfCountersSum = clog2(4000*E*T);
wire [sizeColorAcc-1:0]  finalAccumolator ;
wire [sizeOfCountersSum-1:0] finalCounter;

wire red  = {}

/*
CHECK sizes again ....
*/
// Sum RED 
integer i;
reg [E*T+72:0] temp_data ,temp_data2;
always @* begin
     temp_data = 0;
     for (i = 0; i < E; i = i + 1) begin
         temp_data = temp_data + accumolators[(i+1)*72 - 1: (2)*24 + i*(72)];
         temp_data2 = temp_data2 + counters[(i+1)*12 - 1: (2)*24 + i*(12)];
     end
       
     finalAccumolator[3*sizeColorAcc-1:2*sizeColorAcc] = temp_data;
    end


// Sum Green 
integer i;
reg [E*T+72:0] temp_data;
always @* begin
     temp_data = 0;
     for (i = 0; i < E; i = i + 1) begin
        temp_data = temp_data + accumolators[(i)*72 + (2)*24 - 1: (1)*24 + i*(72)];         
        temp_data2 = temp_data2 + counters[(i)*12 - 1: (1)*24 + i*(12)];
     end
     finalAccumolator[2*sizeColorAcc-1:1*sizeColorAcc] = temp_data;
    end



// Sum Blue 
integer i;
reg [E*T+72:0] temp_data;
always @* begin
     temp_data = 0;
     for (i = 0; i < E; i = i + 1) 
       temp_data = temp_data + accumolators[(i)*72 + (1)*24 - 1: (0)*24 + i*(72)];
     finalAccumolator[1*sizeColorAcc-1:0] = temp_data;
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