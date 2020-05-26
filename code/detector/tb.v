module tb;
reg clk, in, rstn;
wire out;
integer l_dly;
always #10 clk = ~clk;

det_110101 u0 ( .clk(clk), .rstn(rstn), .in(in), .out(out) );

always @ (posedge clk)
  begin
    $monitor ("T = %0t, in=%0d, out=%0d", $time, in, out);
  end

initial
  begin
    clk <= 0;
    rstn <= 0;
    in <= 0;

    repeat (5) @ (posedge clk); // 用5个周期初始化电路
    rstn <= 1;

    @(posedge clk) in <= 1;
    @(posedge clk) in <= 1;
    @(posedge clk) in <= 0;
    @(posedge clk) in <= 1;
    @(posedge clk) in <= 0;
    @(posedge clk) in <= 1;
    @(posedge clk) in <= 1;
    @(posedge clk) in <= 1;
    @(posedge clk) in <= 0;
    @(posedge clk) in <= 1;
    @(posedge clk) in <= 0;
    @(posedge clk) in <= 1;

    #100 $finish; // 上述测试完成后，延时100个时间单位，再停止仿真
  end
endmodule
