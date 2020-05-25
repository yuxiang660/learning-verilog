# 概述
本文是[Verilog Tutorial](https://www.chipverify.com/verilog/verilog-tutorial)的学习笔记。

# Verilog数据类型
[例子 types](./code/type/types.v)
## Nets类型
* Nets类型不存储数据，只负责连接
* 常见的Nets类型是`wire`
* 如下图所示，`net_11`连接了AND门电路的输出和触发器的某个输入引脚
![netsType](./code/netsType.png)

## Variables类型
* Variables类型用于存储数据，如触发器可用于存储数据
* 常见的Variables类型是`reg`
* 如下图所示，左侧的触发器可存储1-bit数据，而右侧的触发器可存储4-bits数据
![variablesType](./code/variablesType.png)

## 其他基本数据类型
* integer
    - 32-bits
    - 整形
* time
    - 64-bits
    - unsigned
    - 用于存储仿真时间，以便调试
    - 整型，表示时间单位的个数
* realtime
    - 浮点型
* real
    - 存储浮点型小数

## 组合数据类型
* 字符串类型
    - Verilog的字符串有`reg`类型构成
    - `reg [8*11:1] str = "Hello World"; // Variable can store 11 bytes, str = "Hello World"`

* Vector
    - 多个net类型或reg类型的组合
    - `wire [3:0] n0;`
    - `reg [3:0] d0;`
    - [例子](./code/vector/register.v)
    ![register](./code/vector/register.png)

* Array
    - Array和Vector不同，Vector综合后是一个电路单元，Array综合后是多个电路单元
    - Array可以是多个`reg`,`wire`,`integer`,`real`数据类型
    - `reg        y1 [11:0];        // y is an scalar reg array of depth=12, each 1-bit wide`
    - `wire [0:7] y2 [3:0]          // y is an 8-bit vector net with a depth of 4`
    - `reg  [7:0] y3 [0:1][0:3];    // y is a 2D array rows=2,cols=4 each 8-bit wide`
    - [例子](./code/array/registers.v)
    ![registers](./code/array/registers.png)

# Verilog模块

