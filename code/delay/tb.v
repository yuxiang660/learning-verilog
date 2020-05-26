module tb;
  reg a, b;
  wire out1, out2;
  
  des d0 (.out1(out1), .out2(out2), .a(a), .b(b));
  
  initial begin
    {a, b} <= 0;
    
    $monitor ("T=%0t a=%0b b=%0b and=%0b bufif0=%0b", $time, a, b, out1, out2);
    
    #10 a <= 1;
    #10 b <= 1;
    #10 a <= 0;
    #10 b <= 0;
  end
  
  initial begin
    $dumpvars;
    $dumpfile("dump.vcd");
  end
endmodule