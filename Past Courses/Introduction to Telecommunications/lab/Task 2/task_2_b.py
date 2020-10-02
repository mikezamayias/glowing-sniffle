import matplotlib.pyplot as plt
import numpy as np
from numpy import linspace, pi, cos, sin, split
from scipy.fftpack import fft, fftshift
from fractions import gcd


#   Line colors in plots
colors = ['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728',
          '#9467bd', '#8c564b', '#e377c2', '#7f7f7f',
          '#bcbd22', '#17becf']


signal_a_amplitude = 2
signal_b_amplitude = 4
signal_c_amplitude = 8

signal_a_frequency = 100
signal_b_frequency = 500
signal_c_frequency = 1000

samples_per_second = 100

signal_a_nyquist_frequency = signal_a_frequency * 2
signal_a_time = linspace(0, signal_a_nyquist_frequency, signal_a_frequency*samples_per_second)

signal_b_nyquist_frequency = signal_b_frequency * 2
signal_b_time = linspace(0, signal_b_nyquist_frequency, signal_b_frequency*samples_per_second)

signal_c_nyquist_frequency = signal_c_frequency * 2
signal_c_time = linspace(0, signal_c_nyquist_frequency, signal_c_frequency*samples_per_second)

signal_times = [signal_a_time, signal_b_time, signal_c_time]
signal_times_len = [len(signal_time) for signal_time in signal_times]
for signal_time in signal_times:
    if len(signal_time) == min(signal_times_len):
        resulting_signal_time = signal_time

signal_a_time = resulting_signal_time
signal_b_time = resulting_signal_time
signal_c_time = resulting_signal_time

signal_a = signal_a_amplitude * cos(2 * pi * signal_a_frequency * signal_a_time)
signal_b = signal_b_amplitude * cos(2 * pi * signal_b_frequency * signal_b_time)
signal_c = signal_c_amplitude * sin(2 * pi * signal_c_frequency * signal_c_time)

resulting_signal = signal_a + signal_b + signal_c

max_signal_frequency = max(signal_a_frequency, signal_b_frequency, signal_c_frequency)

total_samples = len(resulting_signal_time)
if total_samples % 2 == 0:
    frequency_range = linspace(-2*max_signal_frequency,
                               max_signal_frequency*2 - 1, total_samples)
else:
    frequency_range = linspace(-(max_signal_frequency - 1) * 2,
                    (max_signal_frequency- 1) / 2, total_samples)

signal_fft = fft(resulting_signal)
normalised_signal_fft = abs(signal_fft) / total_samples
final_fft = fftshift(normalised_signal_fft)


esd = pow(final_fft, 2)


plt.figure(1, figsize=[7, 12], dpi=400)
plt.subplot(4, 1, 1)
plt.title('Signal 1')
plt.plot(signal_a_time, signal_a, colors[0])
plt.xlabel('$Time (sec)$')
plt.ylabel('$Frequency (Hz)$')
plt.yticks([amplitude for amplitude in range(-signal_a_amplitude,
                                             signal_a_amplitude + 1) if amplitude % 2 == 0])
plt.tight_layout()
plt.grid()
plt.subplot(4, 1, 2)
plt.title('Signal 2')
plt.plot(signal_b_time, signal_b, colors[1])
plt.xlabel('$Time (sec)$')
plt.ylabel('$Frequency (Hz)$')
plt.yticks(
    [amplitude for amplitude in range(-signal_b_amplitude,
                                      signal_b_amplitude + 1) if amplitude % 2 == 0]
)
plt.tight_layout()
plt.grid()
plt.subplot(4, 1, 3)
plt.title('Signal 3')
plt.plot(signal_c_time, signal_c, colors[2])
plt.xlabel('$Time (sec)$')
plt.ylabel('$Frequency (Hz)$')
plt.yticks(
    [amplitude for amplitude in range(-signal_c_amplitude,
                                      signal_c_amplitude + 1) if amplitude % 2 == 0]
)
plt.tight_layout()
plt.grid()
plt.subplot(4, 1, 4)
plt.title('Composite Signal')
plt.plot(resulting_signal_time, resulting_signal, colors[3], label='$Resulting Signal$')
plt.xlabel('$Time (sec)$')
plt.ylabel('$Frequency (Hz)$')
plt.yticks(
    [amplitude for amplitude in range(-int(max(resulting_signal)),
                                      int(max(resulting_signal)) + 1) if amplitude % 2 == 0]
)
plt.legend(loc=0)
plt.tight_layout()
plt.grid()
plt.savefig('222.png')

plt.figure(2, figsize=[6, 4], dpi=400)
plt.plot(frequency_range, final_fft, colors[0])
plt.ylabel('$Amplitude (V)$')
plt.yticks([i for i in range(0, 11)])
plt.xlabel('$Frequency (Hz)$')
plt.tight_layout()
plt.title('Two-sided spectrum')
plt.grid()
plt.savefig('223.png')

plt.figure(3, figsize=[6, 4], dpi=400)
plt.plot(split(frequency_range, 2)[-1], split(final_fft, 2)[-1], colors[0])
plt.ylabel('$Amplitude (V)$')
plt.yticks([i for i in range(0, 11)])
plt.xlabel('$Frequency (Hz)$')
plt.tight_layout()
plt.title('Single-sided spectrum')
plt.grid()
plt.savefig('224.png')

plt.figure(4, figsize=[6, 4], dpi=400)
plt.plot(frequency_range, esd, colors[0])
plt.ylabel('$Amplitude (V)$')
plt.ylim([0, 2*pow(max(signal_a_amplitude, signal_b_amplitude, signal_c_amplitude), 2)+6])
plt.xlabel('$Frequency (Hz)$')
plt.xlim([-2*max_signal_frequency, 2*max_signal_frequency])
plt.tight_layout()
plt.title('Energy Signal Density')
plt.grid()
plt.savefig('225.png')




plt.show()

