Overview
========

The project name notwithstanding, this is a simple double-balanced RF mixer for the 
HF frequency range (around 7 MHz). The design is a switching mixer, so the local 
oscillator (LO) is a digital signal.  

The RF input should be DC biased. Expected bias is around 0.6 volts.

A differential IF output is provided.  So the output should be the difference of
IFOUT_P and IFOUT_N.

The [detailed document here](https://github.com/brucemack/tt07-sb-mixer/blob/main/docs/math.md) gets 
into the mathematical basis for the circuit design used.

The tile also has a simple digital component called a quadrature divider. This takes 
a digital clock (uio_in[1]) and creates two output clocks with quadrature relationship 
of 90 degrees of phase. This would be useful for certain types of RF modulators
and demodulators.


