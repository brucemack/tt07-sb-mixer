v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Local oscilator input on digital pin.
Buffer LO and produce dual-polarity 
clock for switching stage.} 230 500 0 0 0.4 0.4 {}
T {Load stage} 720 -40 0 0 0.4 0.4 {}
T {Commutation stage, LO input} 720 100 0 0 0.4 0.4 {}
T {Transconductance stage, RF input
(RF input inlcudes DC bias)} 720 220 0 0 0.4 0.4 {}
T {IF Output = IFOUT_P - IFOUT_N} 720 30 0 0 0.4 0.4 {}
N 290 440 330 440 {
lab=LOIN}
N 410 440 460 440 {
lab=LO_N}
N 540 440 570 440 {
lab=LO_P}
N 290 230 380 230 {
lab=RFIN}
N 420 260 420 320 {
lab=VSS}
N 420 230 510 230 {
lab=VSS}
N 280 140 280 170 {
lab=#net1}
N 310 170 520 170 {
lab=#net1}
N 550 140 550 170 {
lab=#net1}
N 420 170 420 200 {
lab=#net1}
N 200 110 240 110 {
lab=LO_P}
N 550 0 550 80 {
lab=IFOUT_N}
N 280 170 310 170 {
lab=#net1}
N 520 170 550 170 {
lab=#net1}
N 280 -0 280 80 {
lab=IFOUT_P}
N 280 -100 280 -60 {
lab=#net2}
N 280 -100 550 -100 {
lab=#net2}
N 550 -100 550 -60 {
lab=#net2}
N 420 -140 420 -100 {
lab=#net2}
N 300 -30 530 -30 {
lab=VSS}
N 280 110 550 110 {
lab=VSS}
N 420 -30 420 110 {
lab=VSS}
N 590 110 630 110 {
lab=LON}
C {devices/iopin.sym} 60 -200 0 0 {name=p1 lab=VDD}
C {devices/iopin.sym} 60 -170 0 0 {name=p2 lab=VSS}
C {devices/ipin.sym} 290 440 0 0 {name=p3 lab=LOIN}
C {devices/ipin.sym} 290 230 0 0 {name=p4 lab=RFIN}
C {devices/opin.sym} 280 40 0 0 {name=p5 lab=IFOUT_P}
C {devices/opin.sym} 550 40 0 1 {name=p6 lab=IFOUT_N}
C {sky130_stdcells/inv_1.sym} 370 440 0 0 {name=x1 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 440 440 1 0 {name=p7 sig_type=std_logic lab=LO_N}
C {devices/lab_pin.sym} 570 440 1 0 {name=p8 sig_type=std_logic lab=LO_P}
C {sky130_stdcells/inv_1.sym} 500 440 0 0 {name=x2 VGND=VGND VNB=VNB VPB=VPB VPWR=VPWR prefix=sky130_fd_sc_hd__ }
C {sky130_fd_pr/nfet_01v8_lvt.sym} 400 230 0 0 {name=M1
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
model=nfet_01v8_lvt
spiceprefix=X
}
C {devices/lab_pin.sym} 420 310 2 0 {name=p9 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 510 230 2 0 {name=p10 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/nfet_01v8.sym} 260 110 0 0 {name=M2
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
C {sky130_fd_pr/nfet_01v8.sym} 570 110 0 1 {name=M3
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
C {sky130_fd_pr/res_high_po_0p69.sym} 280 -30 0 1 {name=R1
L=0.69
model=res_high_po_0p69
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_high_po_0p69.sym} 550 -30 0 0 {name=R2
L=0.69
model=res_high_po_0p69
spiceprefix=X
mult=1}
C {devices/lab_pin.sym} 410 -140 0 0 {name=p11 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 420 10 0 0 {name=p13 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 200 110 0 0 {name=p12 sig_type=std_logic lab=LO_P}
C {devices/lab_pin.sym} 630 110 0 1 {name=p14 sig_type=std_logic lab=LO_N}
