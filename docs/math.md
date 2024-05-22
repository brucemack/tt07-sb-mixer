# Mixer Math

## Why Does the LO Leak in a Single-Balanced MOSFET Mixer?

An ideal mixer takes RF and LO signals and produces an IF output signal at the sum (RF+LO) and difference (RF-LO) frequencies
of the two inputs. A single-balanced mixer exhibits a non-ideal behavior by allowing either the RF or LO signal (depending 
on configuration) to 
appear at the output, in addition to the desired RF+LO and RF-LO signals. Often times this undesired mixer output 
is referred to as "leakage."

In the case of the single-balanced mixer, I don't think it's really accurate to call this undesired output 
"leakage" because _the circuit was never designed to suppress it in the first place._ But we'll stick with this
term for now. Whatever we call it, it is important to understand the mathematical reason for this undesired behavior.

Some high-level assumptions that we are making for this analysis:

* Assume that the **LO input is balanced and the RF input is unbalanced.** This is the most common situation
in simple MOSFET mixers and it results in a leakage of the LO signal. If the situation was reversed then the RF signal 
would leak by exactly the same argument.
* Assume that we are talking about a switching mixer (sometimes called a commuting mixer) driven by an LO signal 
that is a square wave.  This is a common situation that comes up in radio circuits that use digitally-controlled 
tuning.  The LO is often created by a digital PLL that outputs a logic-level square wave.

Getting formal, assume that:

* The LO signal is represented by a square wave $\ w(t)$ that alternates between 1 and 0 at an angular
frequency of $\ \omega_L $. 
* The RF signal $\ x(t)$ is a sinusoid of amplitude $\ A_R$ and angular frequency $\ \omega_R$. This voltage 
is passed to the transconductance stage of the mixer to produce a current of $\ g_mx(t)$.
* The LO square wave switches the RF-modulated current $\ x(t)$ between two tails of the mixer circuit.
* There is a load resistance of $\ R$ in each tail.  
* The voltage at the top of each tail is $\ V_{DD}$. This is the "off" level of the tail.
* The bias brings the left tail's "on" voltage down by $\ B_{l}$ volts and the right tail's "on" voltage by $\ B_{r}$.  So the "DC on" level of the left tail is $\ V_{DD} - B_l$ and the right tail is left tail is $\ V_{DD} - B_r$.  Normally we would expect $\ B_l = B_r $ since the circuit is symmetric.
* When on, the output voltage on the left tail $\ l(t) = V_{DD} - B_l + g_mx(t)R$.
* When on, the output voltage on the right tail $\ r(t) = V_{DD} - B_r + g_mx(t)R$.

The on/off switching action of the mixer can be thought of as a multiplication of the RF signal by the LO square wave.  When the LO 
has the value of 1 the RF signal is allowed to pass.  When the LO has the value of 0 the RF signal is suppressed. 

A full representation of the differential IF output of the MOSFET SB mixer is constructed as follows:

$\ y(t) = l(t) - r(t)$

The mixing action applies the LO to each tail in alternating opposite phase, so a time shift of $\ (2\pi/\omega_L)/2 $ seconds needs to 
be applied to one tail of the mixer.

$\ l(t) = V_{DD} - w(t) ( B_l + g_mx(t)R$ )

$\ r(t) = V_{DD} - w(t + \pi/\omega_L) (B_r + g_mx(t)R$ )

At this point we will take advantage of the fact that the Fourier series representation of a repeating 
square wave is an infinite sum of the *odd harmonics* of the fundamental frequency.

$\ w(t) = 








