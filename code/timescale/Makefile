COMPILE=iverilog
EMULATE=vvp

TARGET1=tb1.out
SRC1=tb1.v
TARGET2=tb2.out
SRC2=tb2.v
TARGET3=tb3.out
SRC3=tb3.v

all : tb1 tb2 tb3

tb1 : $(TARGET1)
	@$(EMULATE) -n $^ -lxt2

tb2 : $(TARGET2)
	@$(EMULATE) -n $^ -lxt2

tb3 : $(TARGET3)
	@$(EMULATE) -n $^ -lxt2

$(TARGET1) : $(SRC1)
	@$(COMPILE) -o $@ $^

$(TARGET2) : $(SRC2)
	@$(COMPILE) -o $@ $^

$(TARGET3) : $(SRC3)
	@$(COMPILE) -o $@ $^

.PHONY: clean

clean:
	@rm -f *.out