![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg)

# Analog/Digital ASIC Project for Tiny Tapeout

This is a mixed analog/digital ASIC design created for Tiny Tapeout 7. This is my first time through 
a MOSFET ASIC design process and things are very experimental. My design contains a double balanced mixer (Gilbert Cell) and a quadrature 
clock generation, all implemented using MOSFET devices provided by 
the [SkyWater 130nm Open PDK](https://skywater-pdk.readthedocs.io/en/main/).

The more detailed documentation of the project [is located here](docs/info.md).

My analysis of some of the math behind balanced mixer operation can be found [here](docs/math.md).

My plan is to construct a complete receiver in future iterations of the design.
From what I have learned about the Sky130 technology so far this 
seems feasible.

My contact is bruce at mackinnon dot com. For any amateur radio operators looking 
at this project, I am KC1FSZ.

## The Mixer Schematic

![Mixer](docs/cap2.jpg)

## What the VLSI Layout Looks Like

![Layout](docs/cap3.jpg)

This is a rendering that was created from the actual GDS2 files that will be sent 
to the chip fab.  

The mixer is in the foreground on the bottom of the tile and the quadrature divider is 
in the background towards the top. The mixer is oriented roughly 90 degrees counter-clockwise
from the schematic diagram above. The long dark blue metal traces on the left side 
are the power/ground rails.

Electronics design at this level is a bit different from what you might be used 
to when placing discrete components on a PCB. Circuit parameters are controlled 
by adjusting the geometries of the various features in the layout.  Some of the 
most common things to manipulate are:
* The aspect ratio of the various diffusion areas used to create NFET/PFET transistors.
To a first approximation, the transconductance of a MOSFET is a function 
of the ratio of the width/length of the gate.
* The relative length/width of polysilicon layers to create resistors. Longer/thinner = more resistive.
* The areas/gaps used to create capacitors. Bigger = more capacitive.

"Wiring" between devices is achieved by defining metal interconnect structures 
at different (higher) layers in the manufacturing process. Metal layers can 
cross each other as long as they are at different levels.  Via layers can 
be used to make connections up and down through the metal stack. This part is very 
similar to PCB routing.

In general, this technology doesn't support inductors (with some exceptions) 
discourages the use of capacitors (they are huge), and uses resistors 
very sparingly (they take up a lot of space). **But MOSFETs are cheap an plentiful!**
You'd be surprised how many creative ways people have come up with to 
employ MOSFETs as a work-around for the lack of LRCs. If you don't believe it, 
please check out [this amazing presentation by Dr. Harald Pretl](https://www.mos-ak.org/spring_2022/presentations/Pretl_Spring_MOS-AK_2022.pdf) who shows 
all of the creative things that can be done with _only two_ MOSFETs.

And two other unavoidable things that make this different from discrete electronics:
* Like it or not, everything is resistive and capacitive in a way
that probably matters. Design simulation is 
used *AFTER* the 
layout is created to determine how the circuit's behavior is impacted by the 
inherent "parasitic features" of the devices/wires.
* Tolerances are extremely loose given the inevitable variations of the manufacturing 
process, temperature, etc. You can't count on absolute accuracy of any components, so almost all 
designs rely on differential techniques of one kind of another.

The entire area shown in the picture above roughly 170 microns wide and 230 micros tall.

Yes, there is plenty of space available for a more complicated design!

## Most Important Tools Used

This is what I used during this project.  

### Software Tools (All Open Source)

* [Magic VLSI Layout Tool](http://opencircuitdesign.com/magic/) - The famous 1980's VLSI CAD tool from 
Berkeley, updated and open sourced.
* [Xschem Schematic Editor](http://repo.hu/projects/xschem/xschem_man/xschem_man.html) - Tuned for VLSI design.
* [NGSPICE](https://ngspice.sourceforge.io/) - A flavor of SPICE tuned for VLSI and mixed signal design.
* [OpenLane Toolchain for Digital Synthesis/Layout](https://efabless.com/openlane) - A very large 
collection of tools for logic synthesis, place/route, timing analysis, etc.  Verilog goes in and a GDS file comes out.
* [Icarus Verilog](https://steveicarus.github.io/iverilog/) - A nice Verilog compiler and simulator.

### Books

None of these text books are particularly new. I am working from early 
editions of all of them - easily found at the various used book sellers.

* Microelectronic Circuits (Adel Sedra and Kenneth Smith)
* CMOS Circuit Design, Layout, and Simulation (R. Jacob Baker)
* Fundamentals of Microelectronics (Behzad Razavi)
* Design of Analog CMOS (Behzad Razavi)

### E-Books/Free Books

* [Modern Semiconductor Devices for Integrated Circuits (Chenming Hu)](https://www.chu.berkeley.edu/modern-semiconductor-devices-for-integrated-circuits-chenming-calvin-hu-2010/)
* [Analysis and Design of Elementary MOS Amplifier Stages (Boris Murmann)](https://github.com/bmurmann/Book-on-MOS-stages/blob/main/book/Analysis%20and%20Design%20of%20Elementary%20MOS%20Amplifier%20Stages.pdf)

### Important References

* [Sky130 PDK Details](https://isn.ucsd.edu/courses/beng207/lectures/Tim_Edwards_2021_slides.pdf)
* [Fifty Nifty Variations of Two-Transistor Circuits by the famous Dr. Harald Pretl](https://www.mos-ak.org/spring_2022/presentations/Pretl_Spring_MOS-AK_2022.pdf)

## What is Tiny Tapeout?

Tiny Tapeout is an educational project that aims to make it easier and cheaper than ever to get your digital designs manufactured on a real chip.

To learn more and get started, visit https://tinytapeout.com.

Analog design is fairly new in the Tiny Tapeout ecosystem. For specifications and 
instructions, see the [analog specs page](https://tinytapeout.com/specs/analog/).
