# Change the basename to verilog filename
BASENAME=adder

TARGET=$(BASENAME).out
WAVEFORM=$(BASENAME).vcd

COMPILE=iverilog
EMULATE=vvp
DISPLAY=gtkwave

SRCS_V=$(wildcard ./*.v)

all : $(WAVEFORM)

$(WAVEFORM) : $(TARGET)
	$(EMULATE) -n $^ -lxt2

$(TARGET) : $(SRCS_V)
	$(COMPILE) -o $@ $^

.PHONY: run clean

run : $(WAVEFORM)
	$(DISPLAY) $^

clean:
	rm $(WAVEFORM) $(TARGET)