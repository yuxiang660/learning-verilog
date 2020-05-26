// Design #1: Multiplexer design uses an "assign" statement to assign
// out signal
module mux_assign ( input a, b, sel,
                    output out);
assign out = sel ? a : b;

// The initial display statement is used so that
// we know which design got instantiated from simulation
// logs
initial
  $display ("mux_assign is instantiated");
endmodule

  // Design #2: Multiplexer design uses a "case" statement to drive
  // out signal
  module mux_case (input a, b, sel,
                   output reg out);
always @ (a or b or sel)
  begin
    case (sel)
      0 :
        out = a;
      1 :
        out = b;
    endcase
  end

// The initial display statement is used so that
// we know which design got instantiated from simulation
// logs
initial
  $display ("mux_case is instantiated");
endmodule

  // Top Level Design: Use a parameter to choose either one
  module my_design (  input a, b, sel,
                      output out);
parameter USE_CASE = 0;

// Use a "generate" block to instantiate either mux_case
// or mux_assign using an if else construct with generate
generate
  if (USE_CASE)
    mux_case mc (.a(a), .b(b), .sel(sel), .out(out));
  else
    mux_assign ma (.a(a), .b(b), .sel(sel), .out(out));
endgenerate

endmodule
