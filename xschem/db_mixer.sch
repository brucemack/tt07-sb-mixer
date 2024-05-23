v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Local oscilator input on digital pin.
Buffer LO and produce dual-polarity 
clock needed for commutation stage.} -790 640 0 0 0.4 0.4 {}
T {Master bias circuit} -1350 200 0 0 0.4 0.4 {}
T {Load stage} -160 -130 0 0 0.4 0.4 {}
T {IF Output = IFOUT_P - IFOUT_N} -160 -60 0 0 0.4 0.4 {}
T {Switching Stage} -160 50 0 0 0.4 0.4 {}
T {Transconductance Stage} -160 320 0 0 0.4 0.4 {}
T {Bias Stage} -160 440 0 0 0.4 0.4 {}
N -1220 420 -1150 420 {
lab=BIAS0}
N -1260 390 -1200 390 {
lab=BIAS0}
N -1200 390 -1200 420 {
lab=BIAS0}
N -1310 420 -1260 420 {
lab=VSS}
N -1310 420 -1310 450 {
lab=VSS}
N -1310 450 -1260 450 {
lab=VSS}
N -1310 360 -1310 420 {
lab=VSS}
N -740 790 -700 790 {
lab=LOIN}
N -620 790 -570 790 {
lab=LO_N}
N -490 790 -460 790 {
lab=LO_P}
N -470 -90 -470 -10 {
lab=IFOUT_N}
N -740 -90 -740 -10 {
lab=IFOUT_P}
N -740 -190 -740 -150 {
lab=VDD}
N -740 -190 -470 -190 {
lab=VDD}
N -470 -190 -470 -150 {
lab=VDD}
N -600 -230 -600 -190 {
lab=VDD}
N -720 -120 -490 -120 {
lab=VSS}
N -900 -10 -740 -10 {
lab=IFOUT_P}
N -900 -10 -900 90 {
lab=IFOUT_P}
N -470 -10 -280 -10 {
lab=IFOUT_N}
N -280 -10 -280 90 {
lab=IFOUT_N}
N -510 40 -510 90 {
lab=IFOUT_P}
N -740 -10 -510 40 {
lab=IFOUT_P}
N -670 40 -670 90 {
lab=IFOUT_N}
N -670 40 -470 -10 {
lab=IFOUT_N}
N -630 120 -550 120 {
lab=LO_P}
N -900 150 -900 190 {
lab=#net1}
N -900 190 -670 190 {
lab=#net1}
N -670 150 -670 190 {
lab=#net1}
N -510 150 -510 190 {
lab=#net2}
N -510 190 -280 190 {
lab=#net2}
N -280 150 -280 190 {
lab=#net2}
N -1040 120 -940 120 {
lab=LO_N}
N -240 120 -110 120 {
lab=LO_N}
N -510 120 -280 120 {
lab=VSS}
N -900 120 -780 120 {
lab=VSS}
N -780 120 -670 120 {
lab=VSS}
N -780 190 -780 240 {
lab=#net1}
N -390 190 -390 240 {
lab=#net2}
N -780 270 -390 270 {
lab=VSS}
N -910 270 -820 270 {
lab=RF_P}
N -350 270 -210 270 {
lab=RF_N}
N -780 300 -780 340 {
lab=#net3}
N -780 340 -390 340 {
lab=#net3}
N -390 300 -390 340 {
lab=#net3}
N -570 340 -570 390 {
lab=#net3}
N -570 450 -570 510 {
lab=VSS}
N -570 420 -480 420 {
lab=VSS}
N -570 480 -480 480 {
lab=VSS}
N -480 420 -480 480 {
lab=VSS}
N -1150 420 -610 420 {
lab=BIAS0}
N -1260 450 -1260 510 {
lab=VSS}
N -1260 350 -1260 390 {}
N -1260 250 -1260 290 {}
N -1310 320 -1310 360 {}
N -1310 320 -1280 320 {}
C {sky130_fd_pr/nfet_01v8.sym} -1240 420 0 1 {name=M5
L=2
W=20
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -590 420 0 0 {name=M6
L=2
W=20
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/res_high_po_0p35.sym} -1260 320 0 0 {name=R3
L=20
model=res_high_po_0p35
spiceprefix=X
mult=1}
C {devices/lab_pin.sym} -1200 390 0 1 {name=p22 sig_type=std_logic lab=BIAS0
}
C {devices/lab_pin.sym} -1260 250 0 1 {name=p5 sig_type=std_logic lab=VDD
}
C {devices/lab_pin.sym} -1260 510 1 1 {name=p6 sig_type=std_logic lab=VSS
}
C {devices/iopin.sym} -320 690 0 0 {name=p1 lab=VDD}
C {devices/iopin.sym} -320 770 0 0 {name=p2 lab=VSS}
C {devices/ipin.sym} -740 790 0 0 {name=p3 lab=LOIN}
C {sky130_stdcells/inv_1.sym} -660 790 0 0 {name=x1 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} -590 790 1 0 {name=p7 sig_type=std_logic lab=LO_N}
C {devices/lab_pin.sym} -460 790 1 0 {name=p8 sig_type=std_logic lab=LO_P}
C {sky130_stdcells/inv_1.sym} -530 790 0 0 {name=x2 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_fd_pr/nfet_01v8.sym} -800 270 0 0 {name=M1
L=0.15
W=1
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -370 270 0 1 {name=M2
L=0.15
W=1
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -920 120 0 0 {name=M3
L=2
W=10
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -650 120 0 1 {name=M4
L=2
W=10
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -530 120 0 0 {name=M7
L=2
W=10
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -260 120 0 1 {name=M8
L=2
W=10
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/opin.sym} -740 -50 0 0 {name=p4 lab=IFOUT_P}
C {devices/opin.sym} -470 -50 0 1 {name=p9 lab=IFOUT_N}
C {sky130_fd_pr/res_high_po_0p69.sym} -740 -120 0 1 {name=R1
L=0.69
model=res_high_po_0p69
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_high_po_0p69.sym} -470 -120 0 0 {name=R2
L=0.69
model=res_high_po_0p69
spiceprefix=X
mult=1}
C {devices/lab_pin.sym} -600 -230 0 0 {name=p11 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -600 -120 1 0 {name=p13 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} -1040 120 0 0 {name=p12 sig_type=std_logic lab=LO_N}
C {devices/lab_pin.sym} -580 120 1 1 {name=p14 sig_type=std_logic lab=LO_P}
C {devices/lab_pin.sym} -110 120 2 0 {name=p10 sig_type=std_logic lab=LO_N}
C {devices/lab_pin.sym} -390 120 1 0 {name=p15 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} -780 120 1 0 {name=p16 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} -570 270 1 0 {name=p17 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} -910 270 0 0 {name=p18 sig_type=std_logic lab=RF_P}
C {devices/lab_pin.sym} -210 270 2 0 {name=p19 sig_type=std_logic lab=RF_N}
C {devices/lab_pin.sym} -570 510 3 0 {name=p20 sig_type=std_logic lab=VSS}
