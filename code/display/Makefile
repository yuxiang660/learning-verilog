COMPILE=iverilog
EMULATE=vvp

TARGET1=strobe.out
SRC1=strobe.v
TARGET2=format.out
SRC2=format.v

all : strobe format

strobe : $(TARGET1)
	@$(EMULATE) -n $^ -lxt2

format : $(TARGET2)
	@$(EMULATE) -n $^ -lxt2

$(TARGET1) : $(SRC1)
	@$(COMPILE) -o $@ $^

$(TARGET2) : $(SRC2)
	@$(COMPILE) -o $@ $^

.PHONY: clean

clean:
	@rm -f *.out