import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec
import matplotlib.colors as mcolors
import numpy as np
from numpy import linspace, pi, cos, arange, split
from scipy.fftpack import fft, fftshift


#   Line colors in plots
colors = list(mcolors.TABLEAU_COLORS)


#   Data
samples_per_signal_period = 1000
number_of_signal_periods = 5

signal_amplitude = 4
signal_frequency = 10
signal_period = 1 / signal_frequency

signal_duration = number_of_signal_periods*signal_period
total_signal_period_samples = samples_per_signal_period * number_of_signal_periods
total_signal_frequency_samples = 1/total_signal_period_samples
number_of_samples = total_signal_period_samples+1

time = linspace(0, signal_duration, number_of_samples)
total_samples = len(time)
signal_period_sampling = signal_period / samples_per_signal_period
duration = total_samples*signal_period_sampling
cosinusoidal_signal = signal_amplitude * cos(2 * pi * signal_frequency * time)



"""
Plot signal
"""
plt.figure(1)
plt.plot(time, cosinusoidal_signal, label='Signal function',
         color=colors[0])
plt.xlabel('Time (sec)')
plt.ylabel('Amplitude (V)')
plt.yticks(
    [
        amplitude
        for amplitude in range(-signal_amplitude,
                               signal_amplitude + 1)
        if amplitude % 2 == 0
    ]
)
plt.title('Cosinusoidal signal')
plt.legend()
plt.grid()


#   212
frequency_range = linspace(-50, 50, len(cosinusoidal_signal))
signal_fft = fft(cosinusoidal_signal)
normalised_signal_fft = abs(signal_fft)/total_samples
final_fft = fftshift(normalised_signal_fft)

plt.figure(2)
plt.subplot(2, 1, 1)
plt.plot(frequency_range, final_fft, colors[0])
plt.xlabel('$Frequency (Hz)$')
plt.xticks(arange(min(frequency_range), max(frequency_range)+1, 10))
plt.ylabel('$Amplitude (V)$')
plt.ylim([0, 2 * signal_amplitude])
plt.title('Two-sided spectrum')
plt.grid()
plt.tight_layout()

plt.subplot(2, 1, 2)
plt.plot(split(frequency_range[0:-1], 2)[-1],
         split(final_fft[0:-1], 2)[-1], colors[0])
plt.xlabel('$Frequency (Hz)$')
plt.xticks(
    arange(min(split(frequency_range[0:-1], 2)[-1]), max(split(frequency_range[0:-1], 2)[-1]) + 1, 10))
plt.ylabel('$Amplitude (V)$')
plt.ylim([0, 2 * signal_amplitude])
plt.title('Single-sided spectrum')
plt.grid()
plt.tight_layout()


#   213
signal_energy_density = pow(signal_fft, 2)
plt.figure()
#   plt.figure(3)
plt.plot(split(frequency_range[0:-1], 2)[-1],
         split(signal_energy_density[0:-1], 2)[-1], colors[0])
plt.xlabel('$Frequency (Hz)$')
plt.ylim([0, pow(signal_amplitude, 2)+4])
plt.ylabel('$Amplitude (V)$')
plt.title('Energy Signal Density')
plt.grid()
plt.tight_layout()


plt.show()
