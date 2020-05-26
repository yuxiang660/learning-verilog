/*
|__ Spawn Block1 at #0ns: initial
|      |___ Time #0ns : a <= 8'DA, is non-blocking so note value of RHS (8'hDA) and execute next step
|      |___ Time #0ns : $display() is blocking, so execute this statement: But a hasn't received new values so a=8'hx
|      |___ End of time-step : Assign captured value to variable a, and a is now 8'hDA
|      |___ Wait until time advances by 10 time-units to #10ns
|
|      |___ Time #10ns : b <= 8'F1, is non-blocking so note value of RHS (8'hF1) and execute next step
|      |___ Time #10ns : $display() is blocking, so execute this statement. But b hasn't received new values so b=8'hx
|      |___ Time #10ns : c <= 8'30, is non-blocking so note value of RHS (8'h30) and execute next step
|      |___ Time #10ns : $display() is blocking, so execute this statement. But c hasn't received new values so c=8'hx
|      |___ End of time-step and initial block, assign captured values into variables b, c
|
|      |___ Time #15ns : $display() is blocking, so execute this statement. Ass varialbes were assigned
|
|__ Spawn Block2 at #0ns: initial
|      |___ Wait until time advances by 5 time-units to #5ns
|
|      |___ Time #5ns : d <= 8'AA, is non-blocking so note value of RHS (8'hAA) and execute next step
|      |___ Time #5ns : $display() is blocking, so execute this statement: But d hasn't received new values so d=8'hx
|      |___ End of time-step : Assign captured value to variable d, and d is now 8'hAA
|      |___ Wait until time advances by 5 time-units to #5ns
|
|      |___ Time #10ns : e <= 8'55, is non-blocking so note value of RHS (8'h55) and execute next step
|      |___ Time #10ns : $display() is blocking, so execute this statement. But e hasn't received new values so e=8'hx
|      |___ End of time-step and initial block, assign captured values to variable e, and e is now 8'h55
|
|__ End of simulation at #15ns
*/

module tb;
reg [7:0] a, b, c, d, e;

initial
  begin
    a <= 8'hDA;
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h d=0x%0h e=0x%0h", $time, a, b, c, d, e);
    #10 b <= 8'hF1;
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h d=0x%0h e=0x%0h", $time, a, b, c, d, e);
    c <= 8'h30;
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h d=0x%0h e=0x%0h", $time, a, b, c, d, e);
    #5 $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h d=0x%0h e=0x%0h", $time, a, b, c, d, e);
  end

initial
  begin
    #5 d <= 8'hAA;
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h d=0x%0h e=0x%0h", $time, a, b, c, d, e);
    #5 e <= 8'h55;
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h d=0x%0h e=0x%0h", $time, a, b, c, d, e);
  end
endmodule
