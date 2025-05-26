
all: build run

build: clean
	iverilog -Wall -Wimplicit -Wportbind -Wtimescale -o .\bin\NTT1.vvp -DVSCODE -DVCD_OUT=\"./Simulation-Waveforms/NTT1.vcd\" .\NTT1.v
	iverilog -Wall -Wimplicit -Wportbind -Wtimescale -o .\bin\NTT2.vvp -DVSCODE -DVCD_OUT=\"./Simulation-Waveforms/NTT2.vcd\" .\NTT2.v
	iverilog -Wall -Wimplicit -Wportbind -Wtimescale -o .\bin\NTT3.vvp -DVSCODE -DVCD_OUT=\"./Simulation-Waveforms/NTT3.vcd\" .\NTT3.v
	iverilog -Wall -Wimplicit -Wportbind -Wtimescale -o .\bin\NTT4.vvp -DVSCODE -DVCD_OUT=\"./Simulation-Waveforms/NTT4.vcd\" .\NTT4.v
	iverilog -Wall -Wimplicit -Wportbind -Wtimescale -o .\bin\NTT5.vvp -DVSCODE -DVCD_OUT=\"./Simulation-Waveforms/NTT5.vcd\" .\NTT5.v

run:
	vvp .\bin\NTT1.vvp
	vvp .\bin\NTT2.vvp
	vvp .\bin\NTT3.vvp
	vvp .\bin\NTT4.vvp
	vvp .\bin\NTT5.vvp

clean:
	-if exist .\bin rmdir /S /Q .\bin
	-if exist .\Simulation-Waveforms rmdir /S /Q .\Simulation-Waveforms
	mkdir .\bin
	mkdir .\Simulation-Waveforms
