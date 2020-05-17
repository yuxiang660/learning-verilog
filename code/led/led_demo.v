module led_demo(
    input clk,
    input rst_n,

    output reg led
);

reg [7:0] cnt;

always @ (posedge clk)
begin
    if(!rst_n)
        cnt <= 0;
    else if(cnt >= 10)
        cnt <= 0;
    else
        cnt <= cnt + 1;
end

always @ (posedge clk)
begin
    if(!rst_n)
        led <= 0;
    else if(cnt == 10)
        led <= !led;
end

endmodule