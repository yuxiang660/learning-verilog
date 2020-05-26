// Declare the timescale where time_unit is 10ns
// and time_precision is 1ns
`timescale 10ns/1ns

// NOTE: Testbench is the same as in previous example
module tb;
// To understand the effect of timescale, let us
// drive a signal with some values after some delay
reg val;

initial
  begin
    $display ("tb2: `timescale 10ns/1ns");

    // Initialize the signal to 0 at time 0 units
    val <= 0;

    // Advance by 1 time unit, display a message and toggle val
    #1     $display ("T=%0t At time #1", $realtime);
    val <= 1;

    // Advance by 0.49 time unit and toggle val
    #0.49   $display ("T=%0t At time #0.49", $realtime);
    val <= 0;

    // Advance by 0.50 time unit and toggle val
    #0.50   $display ("T=%0t At time #0.50", $realtime);
    val <= 1;

    // Advance by 0.51 time unit and toggle val
    #0.51   $display ("T=%0t At time #0.51", $realtime);
    val <= 0;

    // Let simulation run for another 5 time units and exit
    #5 $display ("T=%0t End of simulation", $realtime);
  end
endmodule
