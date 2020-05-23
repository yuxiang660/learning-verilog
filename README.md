# 配置Verilog虚拟环境

## [Icarus Verilog](https://zhuanlan.zhihu.com/p/95081329)

Icarus Verilog是Verilog编译器，类似gcc编译器，通过testbench文件可以生成对应的仿真波形数据文件，可通过GTKWave查看仿真波形，支持将Verilog转换为VHDL文件。

## [Ubuntu下安装iverilog和gtkwave](https://cloud.tencent.com/developer/article/1199034)

> sudo apt-get install iverilog <br>
> sudo apt-get install gtkwave

### 常用命令
* iverilog<br>
用于编译verilog和vhdl文件，进行语法检查，生成可执行文件

* vvp<br>
根据可执行文件，生成仿真波形文件

* gtkwave<br>
用于打开仿真波形文件，图形化显示波形

# Verilog简介
## Verilog和VHDL
* Verilog的优点
    * 语法较简单
    * 建模能力强于VHDL，抽象全层次，包括：系统级、算法级、寄存器传输级、逻辑门级、开关电路级

## IP重用
由于Verilog设计与工艺无关，相对原理图输入，大大提高了模型的可重用性。
* 软核<br>
电路结构总门数在5000门以上的Verilog HDL模型称为“软核”，软核需要经过EDA仿真软件的功能验证。
* 虚拟器件<br>
由软核构成的器件称为虚拟器件
* 固核<br>
FPGA器件上实现的总门数在5000门以上的电路解构编码文件，固核是经过EDA软件综合后的网表文件。
* 硬核<br>
ASIC器件上实现的总门数在5000门以上的电路结构版图掩膜，硬核是EDA软件最终生成的文件，是送到光罩厂进行光罩的光罩原型。

## Verilog设计流程
* 自顶向下设计<br>
从系统级开始设计，细分基本单元，直到可以用EDA元件库中的基本元件来实现为止

# Verilog语法
* Verilog的不同抽象级别
    * 行为描述
        * system-level: 实现设计模块的外部性能的模型
        * algorithm-level: 实现算法运行的模型
        * RTL(register transfer level): 描述数据在寄存器之间的流动和处理数据流动的模型
    * 结构描述
        * gate-level: 描述逻辑门以及逻辑门之间连接的模型
        * switch-level: 描述器件中三极管和存储节点及他们之间连接的模型
* Verilog的综合(synthesis)过程
    * 将逻辑代码转换成电路代码：逻辑语法(if/else，行为模块) -> 布尔表达式语法(~, &, |, 逻辑网表) -> 门电路语法(not, and, or, 门级结构模块)
    * 并不是所有的逻辑代码都可以转换成电路代码的，因此并不是所有代码都可以综合的
* Verilog的几个重要概念：
    * 并行性
    * 层次结构性
    * 可综合性
    * 测试平台testbench
* Verilog用于模块的测试
    * 仿真测试分类：
        * 前(RTL)仿真
        * 逻辑网表仿真
        * 门级仿真

# 模块的结构、数据类型、变量和基本运算符号
* 模块组成
    1. 端口定义
    2. 模块内容    
        - I/O说明
            - input (输入)
            - output (输出)
            - inout (输入/输出)
        - 内部信号声明
            - wire (物理连线，直通，即输入有变化，输出马上无条件反应)
            - reg (存储单元，一定要有触发，输出才会反映输入的状态)
        - 功能定义<br>
        有3种方法可在模块中产生逻辑：
            - 用`assign`声明语句["code"](./code/multiplexer/boolean_assign.v)：`assign a = b & c;`
            - 用实例元件["code"](./code/multiplexer/gate_and.v)：`and #2 u1(q, a, b);`
            - 用`always`块(既可以描述组合逻辑，也可描述时序逻辑)["code"](./code/multiplexer/behavior_always.v)：<br>
            ```verilog
            always @(posedge clk or posedge clr);
            begin
                if(clr) q <= 0;
                else if(en) q <= d;
            end
            ```
* 模块要点总结
    * verilog模块中所有过程块(如：initial块，always块)、连续赋值语句`assign`、实例引用都是并行的
    * 只有连续赋值语句`assign`和实例引用语句可以独立于过程块而存在与模块的功能定义部分
    * `always`过程块内部是顺序执行的
* 常量
    * 数字
        - `x`表示不定值
        - `z`或者`?`表示高阻值
        - 当常量不说明位数时，默认值是32位
    * 参数(parameter)型
        - 符号常量
        - 可提高程序的可读性和可维护性
* 变量
    * `wire`类型
        - 表示门之间的物理连线
        - 以`assign`指定的组合逻辑信号
        - Verilog模块的输入输出信号默认类型
        - `wire a;` //定义了一个1位的wire型数据
    * `reg`类型
        - 是数据存储单元的抽象
        - 默认初始值为不定值x
        - `always`模块内被赋值的每个信号都必须定义成reg型
        - 赋值语句的作用如同改变一组触发器的存储单元的值
    * `memory`类型
        - `reg[n-1:0] 存储器民[m-1:0];`

## 例子<br>
指出下面模块中Cin,Cout,C3,C5的类型。 
```verilog
module FADD(A,B,Cin,Sum,Cout);
    input A,B,Cin; 
    output Sum,Cout;
    ...     
endmodule

module Test;
    ...
    FADD M(C1,C2,C3,C4,C5);
    ...
endmodule 
```
* 解答<br>
    `Cin(wire), Cout(wire/reg), C3(wire/reg), C5(wire)`
* [规则](https://blog.csdn.net/qq_36396104/article/details/79796677)
    - 端口信号
        - 输入端口信号只能是wire型，如`Cin`
        - 输出端口信号可以是wire型也可以是register类型。若输出廥在过程块中赋值，则为register类型；若输出端口在过程块外赋值，则为wire类型。如`Cout`
    - 输入端口可以由wire/reg驱动，如`C3`
    - 输出端口只能驱动wire类型，如`C5`
* `wire`和`reg`的区别<br>
    - 寄存器型数据保持最后一次的赋值，而线型数据需要持续的驱动。wire使用在连续赋值语句中，而reg使用在过程赋值语句（initial ，always）中。wire若无驱动器连接，其值为z，reg默认初始值为不定值x。
    - 在连续赋值语句中，表达式右侧的计算结果可以立即更新表达式的左侧。在理解上，相当于一个逻辑之后直接连了一条线，这个逻辑对应于表达式的右侧，而这条线就对应于wire。
    - 在过程赋值语句中，表达式右侧的计算结果在某种条件的触发下放到一个变量当中，而这个变量可以声明成reg类型的。根据触发条件的不同，过程赋值语句可以建模不同的硬件结构：
        - 如果这个条件是时钟的上升沿或下降沿，那么这个硬件模型就是一个触发器；
        - 如果这个条件是某一信号的高电平或低电平，那么这个硬件模型就是一个锁存器；
        - 如果这个条件是赋值语句右侧任意操作数的变化，那么这个硬件模型就是一个组合逻辑。
    - 默认信号是wire类型，reg类型要申明。这里所说的默认是指输出信号申明成output时为wire。如果是模块内部信号，必须申明成wire或者reg。对于always语句而言，赋值要申明成reg，连续赋值assign的时候要用wire。

# 运算符
* 等式运算符
    * 逻辑等式，结果可能为不定值
        - `==`
        - `!=`
    * case等式运算符，结果非0即1，常用于`case`表达式判别
        - `===`
        - `!==`
    * 区别
    ```verilog
    if(A==1`bx) $display("A"); //当A等于x时，这个语句不执行
    if(A===1`bx) $display("A"); //当A等于x时，这个语句执行
    ```
* 赋值语句
    * 非阻塞(Non_Blocking)赋值方式(如: `b <= a;`)
        - 常用于时序逻辑模块中
        - 块结束后才能完成这次赋值操作
    * 阻塞(Blocking)赋值方式(如: `b = a;`)
        - b的值在赋值语句执行完后立刻改变
        - 在时序逻辑中使用会产生意想不到的结果

* 块语句
    * 顺序块：`begin_end`
    * 并行块：`fork_join`

# 条件语句(if_else)语句
* 条件语句必须在过程块语句中使用。所谓过程块语句是指由`initial`和`always`语句引导的执行语句集合。除这两块语句引导的`begin end`块中可以编写条件语句外，模块中的其他地方都不能编写条件语句。

# case语句
* 声明
`case(表达式) <case分支项> endcase`
* case语句可处理在不定值x和高阻值z

# 循环语句
* forever语句
`forever begin多条语句;end`
* repeat语句
`repeat(表达式) begin多条语句;end`
* while语句
`while(表达式) begin多条语句;end`
* for语句
`for(表达式1;表达式2;表达式3) begin多条语句;end`

# 结构说明语句
Verilog语言中的任何过程模块都从属于以下4种结构的说明语句：
* `initial`
* `always`
* `task`
* `function`

## `initial`语句
一个模块中可以有多个`initial`块，他们都是并行运行的。
* 常见`initial`使用场景：
    * 对各变量进行初始化
    * 生成激励波形

## `always`语句
* 声明格式：<br>
`always <时序控制> <语句>`
* `always`语句在仿真过程中是不断活动着的，但后面跟着的过程块是否执行，则要看它的触发条件
* `always areg = ~areg;`，这个语句会生成一个0延迟的无限循环跳变过程，会使仿真器产生死锁
* `always #half_period areg = ~areg;`，这个语句生成了一个周期为period的无限延续的信号波形
* `always @(a or b or c)`, 只要a，b，c中任何一个发生变化，就会执行一次过程块
* 边沿触发的`always`块常常描述时序行为，如有限状态机
* 电平触发的`always`块常常用来描述组合逻辑的行为

## `task`和`function`语句
* 任务和函数的不同点：
    - 函数只能与主模块共用一个仿真时间单位，而任务可以定义自己的仿真时间单位
    - 函数不能启动任务，而任务可以启动其他任务和函数
    - 函数至少要有一个输入变量，而任务可以没有输入
    - 函数返回一个值，任务不返回值
* 函数的目的是通过返回一个值来响应输入信号的值
* 例子：16位字字节互换任务
    - 任务：`switch_bytes(old_word, new_word);`
    - 函数：`new_word = switch_bytes(old_word);`
* 函数的规则
    - 函数内不能有时间控制语句，即无`#、@或wait`语句
    - 函数不能启动任务
    - 函数至少有一个输入参数
    - 函数定义中必须有一条赋值语句，被赋值的内部变量具有和函数名相同的名字
* 函数声明
    - Verilog风格
    ```verilog
    function calc_parity;
    input [31:0] address;
    begin
        calc_parity = ^address; //返回所有地址位的异或值
    end
    endfunction
    ```
    - C风格
    ```verilog
    function calc_parity(input [31:0] address);
    begin
        calc_parity = ^address;
    end
    endfunction
    ```

* 值变转储文件(VCD)
    - 值变转储文件(VCD)包含仿真运行过程中的信号信息
    - `$dumpfile`：选择VCD文件的名称
    - `$dumpvars`：选择要转储的模块实例或者模块实例信号
    - 例子：[adder_tb.v](./code/adder/adder_tb.v)


