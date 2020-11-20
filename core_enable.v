module core_enable(input [3:0] k , output [15:0] en);
    assign en[0] = 1'b1;
    assign en[1] = k >= 7;
    assign en[2] = k >= 13;
    assign en[3] = k >= 6;
    assign en[4] = k >= 9 | k == 5;
    assign en[5] = k >= 14 | k == 4;
    assign en[6] = k >= 6; 
    assign en[7] = k >= 10 | k == 5;
    assign en[8] = k == 3 | k >= 15;
    assign en[9] = k >= 6;
    assign en[10] = k >= 11 | k == 4;
    assign en[11] = k == 5 | k == 16
    assign en[12] = k >= 6;
    assign en[13] = k >= 12;
    assign en[14] = k >= 8;
    assign en[15] = 1'b1;



endmodule




/*
                            Truth Table 
0	0	1	2	3	4	5	6	7	8	9	10	11	12	13	14	15
0																
1	X															
2	X															X
3	X								X							X
4	X					X					X					X
5	X				X			X				X				X
6	X			X			X			X			X			X
7	X	X		X			X			X			X			X
8	X	X		X			X			X			X		X	X
9	X	X		X	X		X			X			X		X	X
10	X	X		X	X		X	X		X			X		X	X
11	X	X		X	X		X	X		X	X		X		X	X
12	X	X		X	X		X	X		X	X		X	X	X	X
13	X	X	X	X	X		X	X		X	X		X	X	X	X
14	X	X	X	X	X	X	X	X		X	X		X	X	X	X
15	X	X	X	X	X	X	X	X	X	X	X		X	X	X	X
16	X	X	X	X	X	X	X	X	X	X	X	X	X	X	X	X

*/

















