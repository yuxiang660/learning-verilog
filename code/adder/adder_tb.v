`timescale 1ns/1ns    //timescale <time unit>/<time precision>
module adder_tb;        //testbench name
reg [3:0]addend1,addend2;   //input reg
wire [3:0]sum;
wire C;                     //output wire

parameter DELAY = 100;
integer i,j;

adder U1( .A(addend1),
          .B(addend2),
          .Cout(C),
          .Sum(sum)
        );

initial       //stimulus
  begin
    addend1 = 0;
    addend2 = 0;
    for(i = 0;i < 10;i = i + 1)
      for(j = 0;j < 10;j = j + 1)
        begin
          #DELAY addend1 = i;
          addend2 = j;
        end
  end

initial
  $monitor($time,,,"%d + %d = %d , carry = %d ",addend1,addend2,sum,C);

initial
  begin
    $dumpfile("adder.vcd");
    //数0表示转储“adder_tb”模块下面各个层的所有信号。如果是数字1，则表示只转储此模块中的变量，不转储此模块调用模块中的变量
    $dumpvars(0, adder_tb);
  end

endmodule


