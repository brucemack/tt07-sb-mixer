import math
import numpy as np
import matplotlib.pyplot as plt

# Sample frequency is 100pS
N = 4096
fs = 1 / 1e-9

# Spectral analysis 
sn = []
infn = "../xschem/simulation/out.txt"

print("Sample freq", fs)
print("Bin size", fs / N)

with open(infn) as inf:
    lines = inf.readlines()
    print("Lines", len(lines))
    i = 0
    for line in lines:
        tokens = line.strip().split()
        sn.append(float(tokens[1]))
        i = i + 1
        if i == N:
            break

Sw = np.fft.fft(sn)
freq = []
mag = []

for i in range(0, int(N / 2)):
    f = i * (fs / N)
    #print("{:4d}".format(int(f)), "{:d}".format(int(abs(Sw[i]))))
    freq.append(f)
    # Supress DC
    if i == 0:
        mag.append(0)
    else:
        mag.append(abs(Sw[i]))

max = max(mag)
print("Max", max)

for i in range(0, len(mag)):
    if i == 0 or mag[i] <= 0:
        mag[i] = 0
    else:
        mag[i] = 20 * math.log10(mag[i] / max)

plt.plot(freq[1:63], mag[1:63])

#plt.plot(ta_n)
#plt.plot(tb_n)
#plt.ylabel('some numbers')
plt.show()
