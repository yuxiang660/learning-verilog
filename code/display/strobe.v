module tb;
reg [7:0] a;
reg [7:0] b;

initial
  begin
    a = 8'h2D;
    b = 8'h2D;

    #10;                  // Wait till simulation reaches 10ns
    b <= a + 1;           // Assign a+1 value to b

    $display ("[$display] time=%0t a=0x%0h b=0x%0h", $time, a, b);
    $strobe  ("[$strobe]  time=%0t a=0x%0h b=0x%0h", $time, a, b);

    #1;
    $display ("[$display] time=%0t a=0x%0h b=0x%0h", $time, a, b);
    $strobe  ("[$strobe]  time=%0t a=0x%0h b=0x%0h", $time, a, b);

  end
endmodule
