Overview
========

The project name notwithstanding, this is a simple double-balanced RF mixer for the 
HF frequency range (around 7 MHz). The design is a switching mixer, so the local 
oscillator (LO) clock is a digital signal.  

The RF input should be DC biased. Expected bias is around 0.6 volts.

A differential IF output is provided.  The IF output should be the difference of
IFOUT_P and IFOUT_N.

The [detailed document here](https://github.com/brucemack/tt07-sb-mixer/blob/main/docs/math.md) gets 
into the mathematical basis for the circuit design used.

The tile also has a simple digital component called a quadrature divider. This takes 
a digital clock and creates two output clocks with quadrature relationship 
(90 degrees of phase difference). This would be useful for certain types of RF modulators
and demodulators.

The mixer and the quadrature divider are entirely independent circuits at this time.

Pinouts
=======

* ua[0] - Analog RF input with DC bias.
* ua[1] - Analog IF output (positive phase)
* ua[2] - Analog IF output (negative phase)
* uio_in[0] - Digital local oscillator (LO) input.
* uio_in[1] - Digital clock input for quadrature divider.
* uo_out[0] - Digital quadrature divider output, I phase.
* uo_out[1] - Digital quadrature divider output, Q phase.


