module distance_comparator(input [9:0] d0,d1,d2,d3,d4,d5,d6,d7,d8,d10,d11,d12,d13,d14,d15, output [3:0] closestCore);
    wire d0_1, d2_3, d4_5, d6_7, d8_9 , d10_11 , d12_13, d14_15;
    assign d0_1 = d0 <= d1 ;
    assign d2_3 = d2 <= d3 ;
    assign d4_5 = d4 <= d5 ;
    assign d6_7 = d6 <= d7 ;
    assign d8_9 = d8 <= d9 ;
    assign d10_11 = d10 <= d11 ;
    assign d12_13 = d12 <= d13 ;
    assign d14_15 = d14 <= d15 ;
    
    
    
    assign d0_1 = d0 <= d1 ;
    assign d0_1 = d0 <= d1 ;
    assign d0_1 = d0 <= d1 ;
    assign d0_1 = d0 <= d1 ;
    assign d0_1 = d0 <= d1 ;
    assign d0_1 = d0 <= d1 ;






endmodule 


/*

        [0  ,1]  \ 
        [2  ,3]  /
        [4  ,5]  \
        [6  ,9]  /
        [10,11]  \
        [12,13]  /
        [14,15] ==





*/