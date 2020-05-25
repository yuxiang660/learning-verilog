# Change the basename to verilog filename
BASENAME=types

TARGET=$(BASENAME).out

COMPILE=iverilog
EMULATE=vvp

SRCS_V=$(wildcard ./*.v)

all : $(TARGET)

$(TARGET) : $(SRCS_V)
	@$(COMPILE) -o $@ $^

.PHONY: run clean

run : $(TARGET)
	@$(EMULATE) -n $^ -lxt2

clean:
	@rm -f $(TARGET)