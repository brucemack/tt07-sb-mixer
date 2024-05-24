# Mixer Math

(Bruce MacKinnon, 22-May-2024)

I've always known that double-balanced mixers are supposed to be better than single-balanced mixers at suppressing
unwanted mixer products, but I've never known why. This is an attempt to show the math in the 
context of some simple MOSFET realizations of mixer circuits created for my [Tiny Tapeout](https://tinytapeout.com/) 
project.

Mr. Gilbert figured all of this out in 1969 so there is no new ground being broken here.

## Why Does the LO "Leak" Through a Single-Balanced MOSFET Mixer?

An ideal mixer takes RF and local oscillator (LO) signals and produces an intermediate frequency (IF) 
signal at the sum ($\ \omega_R + \omega_L$) and difference ($\ \omega_R - \omega_L$) frequencies. This 
is the frequency shifting property that makes mixers so important in radio circuits. A single-balanced 
mixer is a simple circuit 
that exhibits some non-ideal behavior by allowing either the RF or LO 
signal (depending on configuration) to 
appear at the output _in addition to_ the desired ($\ \omega_R + \omega_L$) and ($\ \omega_R - \omega_L$) IF signals. Often 
times this undesired mixer output is referred to as "leakage."

In the common situation where the mixer is being used in the final down-conversion stage of a receiver (i.e. 
RF and LO are close together and the IF is the base band signal), the difference product from the mixer is 
low-pass filtered so the presence of energy at the RF, LO, and RF+LO frequencies is not a problem - it's all being 
filtered away anyhow.  But in intermediate conversions stages the extra mixer outputs may create a problem.

In the case of the single-balanced mixer, I don't think it's accurate to call this undesired output 
"leakage" because _the circuit was never designed to suppress the extra output in the first place._ But we'll stick with this
term for now. Whatever we call it, it is important to understand the mathematical reason for this undesired,
but fully expected mixer output.

For this analysis we will use the following diagram of a simple single-balanced MOSFET mixer:

![Gilbert Cell](IMG_0956.jpg)

Some high-level assumptions that we are making for this analysis:

* Assume that the **LO input is balanced and the RF input is single-ended.** This is the most common situation
in simple MOSFET mixers. If the hookup was reversed then the RF signal 
would leak by exactly the same argument.
* Assume that we are talking about a switching mixer (sometimes called a commuting mixer) driven by an LO signal 
that is a square wave.  This is a common situation that comes up in radio circuits that use digitally-controlled 
tuning.  The LO is often created by a digital clock/PLL that outputs a logic-level square wave.
* Assume that the RF input has a DC bias included to keep the bottom FET (the transconductance stage) biased in 
saturation.

Getting formal, assume that:

* The LO signal is represented by a square wave $\ w(t)$ that alternates between 1 and 0 at an angular
frequency of $\ \omega_L$ radians/second and has a 50% duty cycle.
* The RF signal $\ x(t)$ is a voltage that is applied to the transconductance stage of the mixer to produce an RF current of $\ g_mx(t)$.
* The LO square wave switches the RF-modulated current $\ g_mx(t)$ between two tails of the mixer circuit.
* There is a load resistance of $\ R$ at the top of each tail.  
* The voltage at the top of each tail is $\ V_{DD}$. This is the "off" level of the tail.
* The bias current brings the left tail's "on" voltage down by $\ RB_{LT}$ volts or the right tail's "on" voltage by $\ RB_{RT}$.  So 
with no RF input the "DC on" level of the left tail is $\ V_{DD} - RB_{LT}$ and the right tail is left tail is $\ V_{DD} - RB_{RT}$.  Normally 
we would expect $\ B_{LT}$ = $\ B_{RT}$ since the circuit is symmetric.
* When on, the output voltage on the left tail $\ l(t) = V_{DD} - R \cdot ( B_{LT} + g_mx(t))$.
* When on, the output voltage on the right tail $\ r(t) = V_{DD} - R \cdot ( B_{RT} + g_mx(t))$.

The on/off switching action of the mixer can be thought of as a multiplication of the RF signal by the LO square wave 
that alternates between 1 and 0.  When the LO 
has the value of 1 the tail is switched on and the RF signal current is allowed to pass.  When the LO has the value of 0 the tail 
is switched off and the RF signal is suppressed. You can also think of the binary on/off LO as a sampling mechanism, allowing a small
window of the incoming RF to be seen on each tail of the circuit in alternating fashion.

A full representation of the differential IF output of the single-balanced MOSFET mixer is constructed as follows:

$$\ y(t) = l(t) - r(t)$$

The mixing action applies the LO to each tail in alternating opposite phase, so a time shift of $\ (2 \pi / \omega_L) / 2$ seconds needs to 
be applied to the LO input on one tail of the mixer.

$$\ l(t) = V_{DD} - R \cdot w(t) ( B_{LT} + g_mx(t) )$$

$$\ r(t) = V_{DD} - R \cdot w(t + \pi/\omega_L) (B_{RT} + g_mx(t))$$

At this point we make two important assumptions that help with the mathematical analysis:

* We can represent the RF signal $\ x(t)$ as a sinusoid, knowing that any arbitrary RF signal could be represented by a more complex series of harmonic sinusoids.

$$\ x(t) = A cos(\omega_Rt)$$

* We can represent the square wave of frequency $\ \omega_L$ as an infinite sum of the *odd* sinusoidal harmonics of $\ \omega_L$:

$$\ w(t) = {4 \over \pi} \sum_{n=1,3,5,...}^\infty {1 \over n} sin(n\omega_Lt) $$

Because the LO square wave is a sum of sinusoids, we can take advantage of the fact that applying the phase shift of $\ \pi/\omega_L$ to 
this sinusoidal series results in a change of sign. So:

$$\ w(t) = -w(t + \pi/\omega_L) $$

Back to the mixer output components:

$$\ l(t) = V_{DD} - R \cdot w(t) (B_{LT} + g_mAcos(\omega_Rt)) $$

$$\ r(t) = V_{DD} - R \cdot w(t + \pi/\omega_L) (B_{RT} + g_mAcos(\omega_Rt)) $$

Keeping in mind the above property of a phase-shifted sinusoidal series:

$$\ l(t) = V_{DD} - R \cdot w(t) (B_{LT} + g_mAcos(\omega_Rt)) $$

$$\ r(t) = V_{DD} + R \cdot w(t) (B_{RT} + g_mAcos(\omega_Rt)) $$

So combining to form the IF output of the mixer:

$$\ y(t) = l(t) - r(t)$$

$$\ y(t) = R \cdot \left( w(t) (B_{LT} + g_mAcos(\omega_Rt)) + w(t) (B_{RT} + g_mAcos(\omega_Rt)) \right) $$

$$\ y(t) = R \cdot \left( w(t) (B_{LT} + B_{RT}) + 2 w(t) g_mAcos(\omega_Rt) \right) $$

This is the most important part of the analysis. Notice that for any $\ B_{LT}$ and $\ B_{RT}$ where $\ B_{LT} \neq -B_{RT}$ **we end up with a 
scaled copy of $\ w(t)$ in the output of the mixer** because of the $\ w(t) (B_{LT} + B_{RT})$ term.  The $\ V_{DD}$ offset goes away, but unless $\ B_{LT}$ and $\ B_{RT}$ are offsetting
in some sense, the
LO will be present in $\ y(t)$.  That's not a leak, that's just how the circuit is designed to work.

Since the normal case is $\ B_{LT} = B_{RT}$, we should expect a giant LO influence in the output.

This can be seen by examining a simulated output of the simple mixer circuit.  This was produced using 
a circuit created using Sky130 technology models and NGSPICE:

![Demo1](img1.jpg)

In this picture the LO switching action is quite pronounced, so it's not surprising that LO energy appears in the 
output IF.  $\ B_{LT} + B_{RT}$ is on the order of 300mV (with some other scaling factors ignored).

Jumping ahead, the fundamental concept in the design of a double-balanced mixer is to arrange the circuit in such away that 
the $\ B$ terms cancel each other, at least conceptually. 

## Where Does the Frequency Shifting Come Into the Picture?

The previous section focused on the $\ w(t) (B_{LT} + B_{RT})$ term of the mixer output:

$$\ y(t) = R \cdot \left( w(t) (B_{LT} + B_{RT}) + 2 w(t) g_mAcos(\omega_Rt) \right) $$

But the more important part of the mixer is the $\ 2 w(t) g_mAcos(\omega_Rt)$ term because that's where the 
action is. Clearly we have a multiplication going on between the LO $\ w(t)$ and the RF $\ g_mAcos(\omega_Rt)$,
but where is the frequency shift?

Let's just focus on the last part of the mixer output expression:

$$\ y_p(t) = R \cdot 2 w(t) g_mAcos(\omega_Rt) $$

Remember that we can represent the square LO signal as an infinite sum of odd harmonics:

$$\ w(t) = {4 \over \pi} \sum_{n=1,3,5,...}^\infty {1 \over n} sin(n\omega_Lt) $$

Pulling out the first part of the sum we get:

$$\ w(t) = {4 \over \pi} sin(\omega_Lt) + {4 \over \pi} \sum_{n=3,5,...}^\infty {1 \over n} sin(n\omega_Lt) $$

Or simply:

$$\ w(t) = {4 \over \pi} sin(\omega_Lt) + w_{harmonics}(t) $$

So $\ y_p(t)$ can look like this (now ignoring all of the constants):

$$\ y_p(t) = \left( sin(\omega_Lt) + w_{harmonics}(t) \right) cos(\omega_Rt) $$

Or:

$$\ y_p(t) =  sin(\omega_Lt) cos(\omega_Rt) + w_{harmonics}(t) cos(\omega_Rt)  $$

The shift comes from this property of trigonometry that is much loved by radio engineers:

$$\ sin(\omega_Lt)cos(\omega_Rt) = {1 \over 2} ( sin(\omega_Lt + \omega_Rt) + sin(\omega_Lt - \omega_Rt)) $$

So:

$$\ y_p(t) =  {1 \over 2} ( sin(\omega_Lt + \omega_Rt) + sin(\omega_Lt - \omega_Rt)) + w_{harmonics}(t) cos(\omega_Rt)  $$

Which is exactly the two shifted frequency components that we expected.

It is very important to note that the shifting is also happening on the right-hand side of the expression **using all 
of the harmonics** of $\ \omega_L$. So, for example, there is energy in the mixer output at $\ 3\omega_L + \omega_R$. Those
higher-order mixing products may be useful or spurious, depending on the application.  Any that are spurious would 
need to be filtered to avoid a visit from the FCC.

## How is the LO Suppressed in a Double-Balanced MOSFET Mixer?

This diagram of the standard Gilbert cell double-balanced mixer will be used as the basis
of the analysis.

![Gilbert Cell](IMG_0955.jpg)

The RF input and the LO input are both differential.  The IF output is also differential 
and is taken as the difference of the two tail voltages: $\ l(t) - r(t)$.

Because of the clever cross-connects in this circuit, each tail experiences current contribution 
from the positive $\ x(t)/2$ and negative ends of the RF signal $\ -x(t)/2$ at the same time. Similarly, each 
tail experiences part of the bias currents $\ B_{RT}$ and $\ B_{LT}$.

As before, let the RF signal be represented by a cosine function:

$$\ x(t) = Acos(\omega_Rt) $$

We write the expression for the output voltage in the left and right tails of the circuit.  Again, we leverage the 
un-delayed phase $\ w(t)$ and the half-cycle delayed phase $\ w(t + \pi/\omega_L)$ of the square wave to achieve the desired
switching between the left and right tails of the circuit:

$$\ l(t) = V_{DD} - R \cdot \left( w(t){g_mAcos(\omega_Rt) \over 2} + w(t)B_{LT} + w(t+\pi/\omega_L){-g_mAcos(\omega_Rt) \over 2} + w(t+\pi/\omega_L)B_{RT} \right) $$

$$\ r(t) = V_{DD} - R \cdot \left( w(t+\pi/\omega_L){g_mAcos(\omega_Rt) \over 2} + w(t+\pi/\omega_L)B_{LT} + w(t){-g_mAcos(\omega_Rt) \over 2} + w(t)B_{RT} \right) $$

Taking advantage of this relationship again:

$$\ w(t) = -w(t + \pi/\omega_L) $$

And taking the difference of the two tail output voltages we end up with:

$$\ y(t) = R \cdot \left( 4w(t){g_mAcos(\omega_Rt) \over 2} + 2w(t)(B_{LT} - B_{RT}) \right) $$

And this leads to the important result.  Unlike the the single-balanced case where $\ B_{LT}$ and $\ B_{RT}$ are added, 
in the double-balanced case they are subtracted.  So when $\ B_{LT} = B_{RT}$ the right-hand term that involves the 
raw LO signal $\ w(t)$ drops out entirely.  That is the mathematical definition of LO suppression.

Actually, looking at this more closely we can see that the LO cancellation happens **in each tail independently** - you don't 
need to combine the differential phases of the output to see this. When $\ B_{LT} = B_{RT}$ we can cancel terms in the 
tail voltage expressions:

$$\ l(t) = V_{DD} - R \cdot \left( w(t){g_mAcos(\omega_Rt) \over 2} + w(t+\pi/\omega_L){-g_mAcos(\omega_Rt) \over 2} \right) $$

$$\ r(t) = V_{DD} - R \cdot \left( w(t+\pi/\omega_L){g_mAcos(\omega_Rt) \over 2} + w(t){-g_mAcos(\omega_Rt) \over 2} \right) $$

All of this highlights the criticality of symmetry in this circuit. Any mismatch between $\ B_{LT}$ and $\ B_{RT}$ will allow 
some component of the LO signal to leak into the mixer output. In this situation it's legit to use the term "leak."

The benefit of this circuit can be seen by examining a simulated output of the simple mixer circuit.  These traces were produced using 
a circuit created using Sky130 technology models and NGSPICE.

Here we plot the tail output voltages.  The left tail is red and the right tail is blue. The green marks along the top indicate 
the LO clock frequency.  As you can see in this picture: unlike the single balanced picture above, there is no LO-driven square 
wave visible in either tail.

![Gilbert Cell](db1.jpg)

The vertical "glitches" in the picture above highlight an important non-ideal behavior of this circuit that needs to be 
managed.  The two sides of the switching stage of the circuit are driven by the opposite phases of the LO.  Any tiny 
difference between the devices, capacitance, or general topology in the circuit can result in a small window of time
when a large imbalance may exist.  This will certainly be visible as LO energy (and harmonics thereof) in the IF output.

The differential output is even cleaner.  All we see is the phase shift at each LO cycle tick (as indicated by the green marks).

![Gilbert Cell](db2.jpg)

## Can a Double-Balanced Mixer Be Driven By a Single-Ended RF Signal?

The one advantage of the single-balanced circuit is that the RF input is single-ended.  Or at least, that is 
one big advantage in a world where analog IO pins cost $40 each! This raises a question about whether the 
double-balanced design can be driven using a singled-ended RF signal.  Will this disrupt the balance?

A common technique used to apply 
a single-ended signal to a differential amplifier is to tie one of the two inputs of the diff-amp to a fixed DC bias. This
section attempts to validate whether the double-balanced mixer will still work under this arrangement.  

The diagram below illustrates the proposed arrangement:

![Gilbert Cell](IMG_0957.jpg)

In the previous section we used differential inputs of $\ x(t) / 2$ and $\ -x(t) / 2$ on the RF input of the mixer.  It is important 
to note that the $\ x(t)$ signal should be interpreted as an AC component of the RF input that is independent of the DC bias
represented by the $\ B_{LT}$ and $\ B_{RT}$ terms introduced previously.

If we tie the right-hand RF input to a fixed DC voltage $\ C_1$ and write the tail output expressions:

$$\ l(t) = V_{DD} - R \cdot \left( w(t){g_mAcos(\omega_Rt) \over 2} + w(t)B_{LT} + w(t+\pi/\omega_L)C_1 + w(t+\pi/\omega_L)B_{RT} \right) $$

$$\ r(t) = V_{DD} - R \cdot \left( w(t+\pi/\omega_L){g_mAcos(\omega_Rt) \over 2} + w(t+\pi/\omega_L)B_{LT} + w(t)C_1 + w(t)B_{RT} \right) $$

Taking the difference of the two tail output voltages we end up with:

$$\ y(t) = R \cdot \left( 2w(t){g_mAcos(\omega_Rt) \over 2} + 2w(t)(B_{LT} - B_{RT} - C_1) \right) $$

There are two important take-aways here:

* By setting $\ B_{LT} = B_{RT}$ and $\ C_1$ = 0 we will eliminate the LO component on the output, as desired.  **IMPORTANT NOTE:** 
Setting $\ C_1$ = 0 doesn't mean that we tie that input to ground. It does means that we must ensure that the AC component of the right side
of the RF input is at *AC ground* potential, considering the existing biasing requirements.
* The factor of 4 in the original $\ 4w(t){g_mAcos(\omega_Rt) \over 2}$ term is reduced to 2, so the output amplitude of the IF 
signal is cut in half (with no corresponding reduction in noise power), as expected.




