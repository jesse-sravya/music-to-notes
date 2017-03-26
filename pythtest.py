from __future__ import division
from pylab import *
from scipy.io import wavfile
import numpy as np
import matplotlib.pyplot as plt

sampFreq, snd = wavfile.read('Piano notes/a5_piano_chop.wav')
#print snd.dtype
# gives int16

snd = snd / (2.**15)

#print snd.shape
# gives (689221, 2)

#print sampFreq
# gives 44100

#print snd.shape[0] / sampFreq
# 15 secs

s1 = snd[:, 0]

# PLOTTING THE TONE

timeArray = arange(0, snd.shape[0], 1)
timeArray = timeArray / sampFreq
timeArray = timeArray * 1000 # scale to millisecs


# PLOTTING FREQUENCY

n = len(s1) 
p = fft(s1) # take the fourier transform 

nUniquePts = int(ceil((n+1)/2.0))
p = p[0:nUniquePts]
p = abs(p)

p = p / float(n) # scale by the number of points so that
                 # the magnitude does not depend on the length 
                 # of the signal or on its sampling frequency  
p = p**2  # square it to get the power 

# multiply by two (see technical document for details)
# odd nfft excludes Nyquist point
if n % 2 > 0: # we've got odd number of points fft
    p[1:len(p)] = p[1:len(p)] * 2
else:
    p[1:len(p) -1] = p[1:len(p) - 1] * 2 # we've got even number of points fft

freqArray = arange(0, nUniquePts, 1.0) * (sampFreq / n);
plot(freqArray/1000, 10*log10(p), color='k')
xlabel('Frequency (kHz)')
ylabel('Power (dB)')

show()

# FFT FREQUENCY COMPONENTS

data = np.random.rand(301) - 0.5
ps = np.abs(np.fft.fft(data))**2

time_step = 1 / 30
freqs = np.fft.fftfreq(data.size, time_step)
idx = np.argsort(freqs)

plt.plot(freqs[idx], ps[idx])

show()

# USING SPECTOGRAM FUNCTION
specgram(s1)
show()