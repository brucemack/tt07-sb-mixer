v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Standard TTO Analog Pin Model} 950 280 0 0 0.3 0.3 {}
N 340 440 340 470 {
lab=GND}
N 260 160 340 160 {
lab=#net1}
N 340 160 340 320 {
lab=#net1}
N 530 370 600 370 {
lab=ifout_p}
N 530 390 690 390 {
lab=ifout_n}
N 1010 350 1010 380 {
lab=ifout_p}
N 1010 350 1050 350 {
lab=ifout_p}
N 1110 350 1190 350 {
lab=ifout_p_2}
N 1010 530 1010 560 {
lab=ifout_n}
N 1010 530 1050 530 {
lab=ifout_n}
N 1110 530 1190 530 {
lab=ifout_n_2}
N 950 350 1010 350 {
lab=ifout_p}
N 950 530 1010 530 {
lab=ifout_n}
N 200 160 200 180 {
lab=#net1}
N 200 160 260 160 {
lab=#net1}
N 160 350 230 350 {
lab=loin}
N 100 380 230 380 {
lab=rfin_p}
C {devices/code.sym} -150 -60 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
.include $::SKYWATER_STDCELLS/sky130_fd_sc_hd.spice

"
spice_ignore=false}
C {devices/launcher.sym} -110 80 0 0 {name=h17 
descr="Load waves" 
tclcommand="
xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]].raw tran

"
}
C {devices/gnd.sym} 340 470 0 0 {name=l1 lab=GND}
C {devices/ipin.sym} 170 350 0 0 {name=p4 lab=loin}
C {devices/ipin.sym} 100 380 0 0 {name=p5 lab=rfin_p}
C {devices/opin.sym} 600 370 0 0 {name=p6 lab=ifout_p}
C {devices/opin.sym} 690 390 0 0 {name=p7 lab=ifout_n}
C {devices/capa.sym} 1010 410 0 0 {name=C1
m=1
value=5p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 1010 440 0 0 {name=l3 lab=GND}
C {devices/res.sym} 1080 350 1 0 {name=R1
value=500
footprint=1206
device=resistor
m=1}
C {devices/opin.sym} 1190 350 0 0 {name=p8 lab=ifout_p_2}
C {devices/capa.sym} 1010 590 0 0 {name=C2
m=1
value=5p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 1010 620 0 0 {name=l2 lab=GND}
C {devices/res.sym} 1080 530 1 0 {name=R2
value=500
footprint=1206
device=resistor
m=1}
C {devices/opin.sym} 1190 530 0 0 {name=p9 lab=ifout_n_2}
C {devices/lab_pin.sym} 950 350 0 0 {name=p10 sig_type=std_logic lab=ifout_p}
C {devices/lab_pin.sym} 950 530 0 0 {name=p11 sig_type=std_logic lab=ifout_n}
C {devices/simulator_commands_shown.sym} -270 630 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ----- RF input
*Vrf rfin 0 0.8
* 7 MHz CW
*                 VOFF VAMP FREQ TDEL DAMP DEG
Vrfp rfin_p 0 SIN(0.9  10m  7Meg 0    0    0)
Vrfn rfin_n 0 SIN(0.9  10m  7Meg 0    0    180)
* Temp
*Vrfn rfin_n 0 DC 0.8
* ----- Local Oscillator
* Fixed
* Vlo loin 0 1.8
* Square Wave (2 MHz, period = 500ns)
*          PULSE(V1  V2  TD TRise TFall PulseWidth Period NP)
Vlo loin 0 PULSE(1.8 0.0 0  5n    5n    250ns      500ns  0)
.options savecurrents
.control
save all
tran 1n 8000n
write testbench.raw
*plot v(x1.lo_n) v(x1.lo_p) 
*plot i(Vsupp)
* Bias voltage
plot v(x1.v1)
* Transconductance voltages
plot v(x1.v2l) v(x1.v2r)
* Individual outputs
plot v(ifout_p_2) v(ifout_n_2)
* Difference (actual output)
plot v(ifout_p_2)-v(ifout_n_2)
wrdata out.txt v(ifout_p_2)-v(ifout_n_2)
.endc
"}
C {devices/vsource.sym} 200 210 0 0 {name=Vsupp value=1.8 savecurrent=false}
C {devices/gnd.sym} 200 240 0 0 {name=l6 lab=GND}
C {db_mixer.sym} 380 380 0 0 {name=x1}
