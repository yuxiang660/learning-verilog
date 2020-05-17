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
电路结构总门数在5000门以上的Verilog HDL模型称为“软核”
* 虚拟器件<br>
由软核构成的器件称为虚拟器件
* 固核<br>
FPGA器件上实现的总门数在5000门以上的电路解构编码文件
* 硬核<br>
ASIC器件上实现的总门数在5000门以上的电路结构版图掩膜

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

