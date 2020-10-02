import argparse
import sys
import matplotlib.pyplot as plt
import numpy as np
from numpy import linspace, pi, cos, split
from scipy import signal
from scipy.fftpack import fft, fftshift


#   Line colors in plots
colors = ['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728',
          '#9467bd', '#8c564b', '#e377c2', '#7f7f7f',
          '#bcbd22', '#17becf']


#   Parse arguments
parser = argparse.ArgumentParser()
parser.add_argument('--pd', type=int, default=50,
                    help='Enter the pulse duration in milliseconds.')
args = parser.parse_args()

constant = args.pd


#   Data
signal_start = -0.05
signal_end = 0.05
signal_amplitude = 1
samples_per_period = 1000

#   Calcualtions
pulse_duration = pow(10, -3) * constant
singal_samples = ((abs(signal_start)+signal_end)/0.01)*samples_per_period
signal_period = 2 * pulse_duration
signal_frequency = 1 / signal_period

time = linspace(signal_start, signal_end, singal_samples)
rectangle_wave = signal_amplitude * \
    signal.square(2*pi*signal_frequency*(time+(pulse_duration/2)))

fourier_transform = fft(rectangle_wave)
normalized_fourier_transform = abs(fourier_transform) / len(time)

if len(time) % 2 == 0:
    frequency_range = linspace(-len(time)/20, len(time)/20-1, len(time))
else:
    frequency_range = linspace(-(len(time)-1)/20, (len(time)-1)/20, len(time))

duration = len(time)*(signal_period/samples_per_period)
frequency_range = frequency_range*(1/duration)

if constant == 10:
    bra = -2500
    ket = 2500
    step = 500
elif constant == 50:
    bra = -500
    ket = 500
    step = 100


#   Plots
plt.figure(1, figsize=[6, 4], dpi=400)
plt.plot(time, rectangle_wave, colors[0])
plt.xlabel('$Time (sec)$')
plt.xticks([i/100 for i in range(-5, 6)])
plt.ylim(bottom=-2, top=2)
plt.ylabel('$Frequency (Hz)$')
plt.grid()
plt.title('Rectangle wave')
plt.tight_layout()
plt.savefig(f'241_{str(constant)}.png')

plt.figure(2, figsize=[6, 7], dpi=400)
plt.subplot(2, 1, 1)
plt.plot(frequency_range, normalized_fourier_transform, colors[0])
plt.xlabel('$Frequency (Hz)$')
plt.xticks([i for i in range(bra, ket+1, step)])
plt.ylabel('$Amplitude (V)$')
plt.yticks([i/100 for i in range(0, 21,5)])
plt.ylim(bottom=0, top=0.2)
plt.title('Two-sided spectrum')
plt.grid()
plt.tight_layout()
plt.savefig(f'242_{str(constant)}.png')
plt.subplot(2, 1, 2)
plt.plot(split(frequency_range, 2)[-1],
         split(normalized_fourier_transform, 2)[-1], colors[0])
plt.xlabel('$Frequency (Hz)$')
plt.ylabel('$Amplitude (V)$')
plt.yticks([i/100 for i in range(0, 21,5)])
plt.ylim(bottom=0, top=0.21)
plt.title('Single-sided spectrum')
plt.grid()
plt.tight_layout()
plt.savefig(f'242_{str(constant)}.png')
