module testbench;
integer    int_a;         // Integer variable
real     real_b;       // Real variable
time     time_c;       // Time variable

reg [8*11:1] str1;
reg [8*5:1]  str2;
reg [8*20:1] str3;

initial
  begin
    str1 = "Hello World"; // Variable can store 11 bytes, str = "Hello World"
    str2 = "Hello World"; // Variable stores only 5 bytes (rest is truncated), str = "World"
    str3 = "Hello World"; // Variable can store 20 bytes (rest is padded with zeros), str = "         Hello World"

    int_a   = 32'hcafe_1234;   // Assign an integer value
    real_b   = 0.1234567;     // Assign a floating point value

    #20;             // Advance simulation time by 20 units
    time_c   = $time;       // Assign current simulation time

    $display ("str1 = %s", str1);
    $display ("str2 = %s", str2);
    $display ("str3 = %s", str3);

    // Now print all variables using $display system task
    $display ("int_a   = 0x%0h", int_a);
    $display ("real_b   = %0.5f", real_b);
    $display ("time_c   = %0t", time_c);
  end
endmodule
