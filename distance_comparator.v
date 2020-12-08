module distance_comparator(input [16*11-1:0]d,input[15:0]en ,output reg [15:0] closestCore);
    
    wire  A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,C0,C1,D0;
    wire [16:0] DA01,DA23,DA45,DA67,DA89,DA1011,DA1213,DA1415,DB0,DB1,DB2,DB3,DC0,DC1;
	 
    assign A0 = {~en[0], d[11 *0 +:11]   }  <=  {~en[1]  ,d[11 *1 +:11]};
    assign A1 = {~en[2], d[11 *2 +:11] }  <=  {~en[3]    ,d[11 *3 +:11]};
    assign A2 = {~en[4], d[11 *4 +:11] }  <=  {~en[5]    ,d[11 *5 +:11]};
    assign A3 = {~en[6], d[11 *6 +:11] }  <=  {~en[7]    ,d[11 *7 +:11]};
    assign A4 = {~en[8], d[11 *8 +:11] }  <=  {~en[9]    ,d[11 *9 +:11]};
    assign A5 = {~en[10],d[11 *10 +:11]} <=  {~en[11]    ,d[11 *11 +:11]};
    assign A6 = {~en[12],d[11 *12 +:11]} <=  {~en[13]    ,d[11 *13 +:11]};
    assign A7 = {~en[14],d[11 *14 +:11]} <=  {~en[15]    ,d[11 *15 +:11]};






    assign DA01   = A0 ? d[11 *0 +:11]  :d[11 *1 +:11];
    assign DA23   = A1 ? d[11 *2 +:11]  :d[11 *3 +:11];
    assign DA45   = A2 ? d[11 *4 +:11]  :d[11 *5 +:11];
    assign DA67   = A3 ? d[11 *6 +:11]  :d[11 *7 +:11];
    assign DA89   = A4 ? d[11 *8 +:11]  :d[11 *9 +:11];
    assign DA1011 = A5 ? d[11 *10 +:11] :d[11 *11 +:11];
    assign DA1213 = A6 ? d[11 *12 +:11] :d[11 *13 +:11];
    assign DA1415 = A7 ? d[11 *14 +:11] :d[11 *15 +:11];
    
    
    assign B0 = DA01   <= DA23;
    assign B1 = DA45   <= DA67;
    assign B2 = DA89   <= DA1011;
    assign B3 = DA1213 <= DA1415;
    
    assign DB0 = B0 ? DA01  : DA23;
    assign DB1 = B1 ? DA45  : DA67;
    assign DB2 = B2 ? DA89  : DA1011;
    assign DB3 = B3 ? DA1213  : DA1415;
    

    assign C0 = DB0 <= DB1;
    assign C1 = DB2 <= DB3;

    assign DC0 = C0 ? DB0 : DB1;
    assign DC1 = C1 ? DB2 : DB3;

    assign D0 = DC0 <= DC1;


    always @* begin
	 closestCore = 0;
        case(D0)
        1'b1 :
            case(C0)
            1'b1:
                case(B0)
                1'b1:
                    case(A0)
                    1'b1: closestCore = 16'b0000_0000_0000_0001;
                    1'b0: closestCore = 16'b0000_0000_0000_0010;
                    endcase
                1'b0: /* Not B0*/
                    case(A1)
                    1'b1: closestCore = 16'b0000_0000_0000_0100;
                    1'b0: closestCore = 16'b0000_0000_0000_1000;
                    endcase
                endcase
            1'b0: /* Not C0*/
                case(B1)
                1'b1:
                    case(A2)
                    1'b1: closestCore = 16'b0000_0000_0001_0000;
                    1'b0: closestCore = 16'b0000_0000_0010_0000;
                    endcase
                1'b0: /* Not B1*/
                    case(A3)
                    1'b1: closestCore =16'b0000_0000_0100_0000;
                    1'b0: closestCore = 16'b0000_0000_1000_0000;
                    endcase
                endcase
        endcase  
                 
        1'b0 :
            case(C1)
            1'b1:
                case(B2)
                1'b1:
                    case(A4)
                    1'b1: closestCore = 16'b0000_0001_0000_0000;
                    1'b0: closestCore = 16'b0000_0010_0000_0000;
					endcase
                1'b0: /* Not B0*/
                    case(A5)
                    1'b1: closestCore = 16'b0000_0100_0000_0000;
                    1'b0: closestCore = 16'b0000_1000_0000_0000;
					endcase
                endcase
            1'b0: /* Not C0*/
                case(B3)
                1'b1:
                    case(A6)
                    1'b1: closestCore = 16'b0001_0000_0000_0000;
                    1'b0: closestCore = 16'b0010_0000_0000_0000;
					endcase
                1'b0: /* Not B1*/
                    case(A7)
                    1'b1: closestCore = 16'b0100_0000_0000_0000;
                    1'b0: closestCore = 16'b1000_0000_0000_0000;  
					endcase
			   endcase
		    endcase
						
    endcase
	end

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