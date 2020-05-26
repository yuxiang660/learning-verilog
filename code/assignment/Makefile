COMPILE=iverilog
EMULATE=vvp

# Change the basename to verilog filename
BASENAME=non_block

TARGET=$(BASENAME).out
SRCS_V=$(BASENAME).v

all : $(TARGET)

$(TARGET) : $(SRCS_V)
	@$(COMPILE) -o $@ $^

.PHONY: run clean

run : $(TARGET)
	@$(EMULATE) -n $^ -lxt2

clean:
	@rm -f $(TARGET)