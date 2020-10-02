import matplotlib.pyplot as plt
import numpy as np
from numpy import linspace, pi, cos, sin, split
from scipy import signal
from scipy.fftpack import fft, fftshift


#   Line colors in plots
colors = ['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728',
          '#9467bd', '#8c564b', '#e377c2', '#7f7f7f',
          '#bcbd22', '#17becf']


signal_start = -0.05
signal_end = 0.05
function_start = -0.01
function_end = 0.01

signal_amplitude = 1
signal_frequency = 1
signal_period = 1 / signal_frequency
number_of_signal_periods = int(
    (abs(signal_start) + signal_end) / (abs(function_start) + function_end))
signal_duration = number_of_signal_periods * signal_period
samples_per_period = 200
period_sampling = signal_period / samples_per_period
frequency_sampling = 1 / period_sampling
time_resolution = signal_duration / period_sampling


time = linspace(signal_start, signal_end, time_resolution)
square_wave = signal_amplitude * \
    signal.square(2 * pi * signal_frequency * time)


total_samples = len(time)
duration = total_samples*period_sampling

if total_samples % 2 == 0:
    temp = linspace(-total_samples / 20, total_samples / 20 - 1, total_samples)
else:
    temp = linspace(-(total_samples - 1) / 20,
                    (total_samples - 1) / 20, total_samples)
frequency_range = temp*(1/duration)

signal_fft = fft(square_wave)
normalised_signal_fft = abs(signal_fft) / total_samples
final_fft = fftshift(normalised_signal_fft)



plt.figure(1, figsize=[6, 4], dpi=400)
plt.plot(time, square_wave, colors[0])
plt.xlabel('$Time (sec)$')
plt.xticks([i/100 for i in range(-5, 6,)])
plt.ylim([-2, 2])
plt.ylabel('$Amplitude (V)$')
plt.tight_layout()
plt.title('Square wave')
plt.grid()
plt.savefig('231.png')

plt.figure(2, figsize=[7, 6], dpi=400)
plt.subplot(1, 2, 1)
plt.plot(frequency_range, final_fft, colors[0])
plt.ylabel('$Amplitude (V)$')
plt.yticks([i/10 for i in range(0, 16)])
plt.xlabel('$Frequency (Hz)$')
plt.tight_layout()
plt.title('Two-sided spectrum')
plt.grid()

plt.subplot(1, 2, 2)
plt.plot(split(frequency_range, 2)[-1], split(final_fft, 2)[-1], colors[0])
plt.ylabel('$Amplitude (V)$')
plt.yticks([i/10 for i in range(0, 16)])
plt.xlabel('$Frequency (Hz)$')
plt.tight_layout()
plt.title('Single-sided spectrum')
plt.grid()

plt.savefig('232.png')
