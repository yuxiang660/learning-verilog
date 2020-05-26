// Design for a half-adder
module ha ( input   a, b,
            output  sum, cout);

assign sum  = a ^ b;
assign cout = a & b;
endmodule

  // A top level design that contains N instances of half adder
  module my_design
  #(parameter N=4)
  (input [N-1:0] a, b,
   output [N-1:0] sum, cout);

// Declare a temporary loop variable to be used during
// generation and won't be available during simulation
genvar i;

// Generate for loop to instantiate N times
generate
  for (i = 0; i < N; i = i + 1)
    begin
      ha u0 (a[i], b[i], sum[i], cout[i]);
    end
endgenerate
endmodule
