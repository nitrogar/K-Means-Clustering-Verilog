module memory_control(input clk,reset,);
    reg [11:0]  address;
    wire [23:0] data_out;


always @(posedge clk,posedge reset) begin
    if (reset) address <= 0;
    else
        address <= address + 1;

end
endmodule