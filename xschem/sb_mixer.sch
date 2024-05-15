v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Local oscilator input on digital pin.
Buffer LO and produce dual-polarity 
clock needed for commutation stage.} 230 380 0 0 0.4 0.4 {}
T {Load stage} 720 -40 0 0 0.4 0.4 {}
T {Commutation stage, LO input} 720 100 0 0 0.4 0.4 {}
T {Transconductance stage, RF input
(RF input includes DC bias)} 720 220 0 0 0.4 0.4 {}
T {IF Output = IFOUT_P - IFOUT_N} 720 30 0 0 0.4 0.4 {}
T {Single-Balanced Mixer
   (Target: 7 MHz)} 230 -290 0 0 0.6 0.6 {}
N 280 530 320 530 {
lab=LOIN}
N 400 530 450 530 {
lab=LO_N}
N 530 530 560 530 {
lab=LO_P}
N 290 230 380 230 {
lab=RFIN}
N 420 260 420 320 {
lab=VSS}
N 420 230 510 230 {
lab=VSS}
N 280 140 280 170 {
lab=V1}
N 310 170 520 170 {
lab=V1}
N 550 140 550 170 {
lab=V1}
N 420 170 420 200 {
lab=V1}
N 200 110 240 110 {
lab=LO_N}
N 550 0 550 80 {
lab=IFOUT_N}
N 280 170 310 170 {
lab=V1}
N 520 170 550 170 {
lab=V1}
N 280 -0 280 80 {
lab=IFOUT_P}
N 280 -100 280 -60 {
lab=VDD}
N 280 -100 550 -100 {
lab=VDD}
N 550 -100 550 -60 {
lab=VDD}
N 420 -140 420 -100 {
lab=VDD}
N 300 -30 530 -30 {
lab=VSS}
N 280 110 550 110 {
lab=VSS}
N 420 -30 420 110 {
lab=VSS}
N 590 110 630 110 {
lab=LO_P}
C {devices/iopin.sym} 700 430 0 0 {name=p1 lab=VDD}
C {devices/iopin.sym} 700 510 0 0 {name=p2 lab=VSS}
C {devices/ipin.sym} 280 530 0 0 {name=p3 lab=LOIN}
C {devices/ipin.sym} 290 230 0 0 {name=p4 lab=RFIN}
C {devices/opin.sym} 280 40 0 0 {name=p5 lab=IFOUT_P}
C {devices/opin.sym} 550 40 0 1 {name=p6 lab=IFOUT_N}
C {sky130_stdcells/inv_1.sym} 360 530 0 0 {name=x1 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 430 530 1 0 {name=p7 sig_type=std_logic lab=LO_N}
C {devices/lab_pin.sym} 560 530 1 0 {name=p8 sig_type=std_logic lab=LO_P}
C {sky130_stdcells/inv_1.sym} 490 530 0 0 {name=x2 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_fd_pr/nfet_01v8_lvt.sym} 400 230 0 0 {name=M1
L=2
W=20
nf=4
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
nf=2 
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
nf=2
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
C {devices/lab_pin.sym} 420 -140 0 0 {name=p11 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 420 10 0 0 {name=p13 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 200 110 0 0 {name=p12 sig_type=std_logic lab=LO_N}
C {devices/lab_pin.sym} 630 110 0 1 {name=p14 sig_type=std_logic lab=LO_P}
C {devices/lab_pin.sym} 450 170 1 0 {name=p15 sig_type=std_logic lab=V1}
