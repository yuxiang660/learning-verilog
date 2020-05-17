`timescale 1ns/100ps

module led_demo_tb;

parameter SYSCLK_PERIOD = 10;

reg SYSCLK;
reg NSYSRESET;

initial
begin
    SYSCLK = 1'b0;
    NSYSRESET = 1'b0;
end

initial
begin
    $dumpfile("led_demo.vcd");
    $dumpvars(0, led_demo_tb);
end

initial
begin
    #(SYSCLK_PERIOD * 10)
        NSYSRESET = 1'b1;
    #1000
        $stop;
end

always @(SYSCLK)
    #(SYSCLK_PERIOD / 2.0) SYSCLK <= !SYSCLK;

led_demo led_demo_ut0 (
    .rst_n(NSYSRESET),
    .clk(SYSCLK),

    .led(led)
);

endmodule