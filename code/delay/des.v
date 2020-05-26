module des (	input 	a, b,
             output out1, out2);

and #(2, 3) o1 (out1, a, b);
bufif0 #(5, 6, 7) b1 (out2, a, b);

endmodule
