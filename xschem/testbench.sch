v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Standard TTO Analog Pin Model} 950 280 0 0 0.3 0.3 {}
T {External Termination} 940 710 0 0 0.3 0.3 {}
N 340 440 340 470 {
lab=GND}
N 260 160 260 180 {
lab=#net1}
N 260 160 340 160 {
lab=#net1}
N 340 160 340 320 {
lab=#net1}
N 190 370 250 370 {
lab=loin}
N 130 350 250 350 {
lab=rfin}
N 550 370 620 370 {
lab=ifout_p}
N 550 390 710 390 {
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
N 970 790 1150 790 {
lab=ifout_p_2}
N 1150 790 1150 810 {
lab=ifout_p_2}
N 970 930 1150 930 {
lab=ifout_n_2}
N 1150 930 1150 950 {
lab=ifout_n_2}
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
C {sb_mixer.sym} 400 380 0 0 {name=x1}
C {devices/vsource.sym} 260 210 0 0 {name=V1 value=3 savecurrent=false}
C {devices/gnd.sym} 340 470 0 0 {name=l1 lab=GND}
C {devices/ipin.sym} 190 370 0 0 {name=p4 lab=loin}
C {devices/ipin.sym} 130 350 0 0 {name=p5 lab=rfin}
C {devices/opin.sym} 620 370 0 0 {name=p6 lab=ifout_p}
C {devices/opin.sym} 710 390 0 0 {name=p7 lab=ifout_n}
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
C {devices/res.sym} 1150 840 2 0 {name=R3
value=50
footprint=1206
device=resistor
m=1}
C {devices/opin.sym} 980 790 2 0 {name=p12 lab=ifout_p_2}
C {devices/gnd.sym} 1150 870 0 0 {name=l4 lab=GND}
C {devices/res.sym} 1150 980 2 0 {name=R4
value=50
footprint=1206
device=resistor
m=1}
C {devices/opin.sym} 980 930 2 0 {name=p13 lab=ifout_n_2}
C {devices/gnd.sym} 1150 1010 0 0 {name=l5 lab=GND}
C {devices/simulator_commands_shown.sym} -270 630 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* Temporary inputs
Vrf rfin 0 0.8
Vlo loin 0 1.8
.options savecurrents
.control
save all
tran 100p 2000n 1n
write testbench.raw
.endc
"}
C {devices/gnd.sym} 260 240 0 0 {name=l6 lab=GND}
