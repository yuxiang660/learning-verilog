module tb;
parameter N = 2;
reg  [N-1:0] a, b;
wire [N-1:0] sum, cout;

// Instantiate top level design with N=2 so that it will have 2
// separate instances of half adders and both are given two separate
// inputs
my_design #(.N(N)) md( .a(a), .b(b), .sum(sum), .cout(cout));

initial
  begin
    a <= 0;
    b <= 0;

    $monitor ("a=0x%0h b=0x%0h sum=0x%0h cout=0x%0h", a, b, sum, cout);

    #10 a <= 'h2;
    b <= 'h3;
    #20 b <= 'h4;
    #10 a <= 'h5;
  end
endmodule
