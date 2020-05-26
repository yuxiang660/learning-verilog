module tb;
time       cur_time;
real       float_pt;
reg [7:0]  a;
reg [39:0] str = "Hello";

initial
  begin
    a = 8'h0E;
    float_pt = 3.142;

    $display ("a = %h", a);
    $display ("a = %d", a);
    $display ("a = %b", a);

    $display ("str = %s", str);
    #200 cur_time = $time;
    $display ("time = %t", cur_time);
    $display ("float_pt = %f", float_pt);
    $display ("float_pt = %e", float_pt);
  end
endmodule
