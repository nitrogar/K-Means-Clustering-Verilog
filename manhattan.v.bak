module manhattan(input enable, [23:0] pixel, mean, output [9:0] d);
    wire [7:0] red,green,blue;
    wire [7:0] m_red, m_green, m_blue;
    wire [7:0] delta_r, delta_g, delta_b
    wire [7:0] abs_delta_r, abs_delta_g, abs_delta_b;

    assign {red, green, blue} = pixel & {24{enable}};
    assign {m_red, m_green, m_blue} = mean & {24{enable}};

    assign delta_r = red - m_red;
    assign delta_g = green - m_green;
    assign delta_b = blue - m_blue;

    assign abs_delta_r = delta_r ^ {8{delta_r[7]}} + delta_r[7];
    assign abs_delta_g = delta_g ^ {8{delta_g[7]}} + delta_g[7];
    assign abs_delta_b = delta_b ^ {8{delta_b[7]}} + delta_b[7];

    assign d = abs_delta_r + abs_delta_g + abs_delta_b;
endmodule