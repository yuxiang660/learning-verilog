module tb;
// Declare testbench variables
reg a, b, sel;
wire out;
integer i;

// Instantiate top level design and set USE_CASE parameter to 1 so that
// the design using case statement is instantiated
my_design #(.USE_CASE(1)) u0 ( .a(a), .b(b), .sel(sel), .out(out));

initial
  begin
    // Initialize testbench variables
    a <= 0;
    b <= 0;
    sel <= 0;

    // Assign random values to DUT inputs with some delay
    for (i = 0; i < 5; i = i + 1)
      begin
        #10 a <= $random;
        b <= $random;
        sel <= $random;
        $display ("i=%0d a=0x%0h b=0x%0h sel=0x%0h out=0x%0h", i, a, b, sel, out);
      end
  end
endmodule
