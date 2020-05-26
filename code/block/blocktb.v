module design0;
reg [31:0] data;

// "initial" block starts at time 0
initial
  begin

    // After 10 time units, data becomes 0xfe
    #10   data = 8'hfe;
    $display ("[Time=%0t] data=0x%0h", $time, data);

    fork
      begin
      // After 20 time units, data becomes 0x11
      #10 data = 8'h11;
      $display ("[Time=%0t] data=0x%0h", $time, data);
      end
      begin
        // After 30 time units, data becomes 0x11
        #20 data = 8'h00;
        $display ("[Time=%0t] data=0x%0h", $time, data);
        // After 60 time units, data becomes 0x11
        #30 data = 8'haa;
        $display ("[Time=%0t] data=0x%0h", $time, data);
      end
    join
  end
endmodule
