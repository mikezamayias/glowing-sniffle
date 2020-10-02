"""
TO-DO:
    4.  Describe the spectrum of the AM DSB-SC signal
DONE:
    1.  Calculate and print Fs and Ts
    2.  Plot the information signal, carrier signal and the AM DSB-SC signal in one plot
    3.  Plot the two sided and single sided spectrum of AM DSB-SC signal
    5.  Calculate and print the following:
        1.  Maximum AM DSB-SC amplitude
        2.  Minimum AM DSB-SC amplitude
        3.  Average normalized of power carrier signal
        4.  Average normalized of power informaion signal
        5.  Average normalized of power AM DSB-SC signal
        6.  Power output
        7.  Information signal bandwidth
        8.  AM DSB-SC signal bandwidth
"""


#   Import modules to use
import matplotlib as mpl
import matplotlib.pyplot as plt
from numpy import arange, cos, linspace, pi, sin, sinc, split
from scipy.fftpack import fft, fftshift


plot_colors = ['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728',
               '#9467bd', '#8c564b', '#e377c2', '#7f7f7f',
               '#bcbd22', '#17becf']


def make_single_side_spectrum(spectrum):
    return split(spectrum, 2)[-1]


def anp(signal):
    return pow(signal, 2)/2


def main(scenario_number, isa, isf, csa, csf):
    print(f'Scenario:\t{scenario_number}')
    isp = 1 / isf  # information period
    csp = 1 / csf  # carrier period

    max_frequency = max(csf, isf)
    min_frequency = min(csf, isf)
    max_period = max(csp, isp)
    nyquist_frequency = 2*max_frequency
    Tmax = 3*max_period

    #   1.  Calculate and print Fs and Ts
    Fs = float(min_frequency*nyquist_frequency)
    Ts = float(1/Fs)
    print(f'Fs:\t{Fs}')
    print(f'Ts:\t{Ts}')

    t = linspace(0, Tmax, round(Tmax/Ts))

    i_omega = 2 * pi * isf
    c_omega = 2 * pi * csf

    i_signal = isa * cos(i_omega * t)
    c_signal = csa * cos(c_omega * t)

    m = isa/csa
    am_dsb_sc = i_signal*c_signal

    u_band = i_signal * csa
    l_band = -u_band

    ts = len(t)
    s_fft = fft(am_dsb_sc)
    ns_fft = abs(s_fft) / ts
    fs_fft = fftshift(ns_fft)
    if ts % 2 == 0:
        f_range = linspace(-ts/2, ts/2-1, ts)
    else:
        f_range = linspace(-(ts - 1)/2, (ts - 1)/2, ts)
    Duration = ts*Ts
    f_range *= (1 / Duration)

    end_frequency_range_limit = csf + 3 * isf
    end_frequency_range_ticks = int(end_frequency_range_limit/1000)

    #   1.  Maximum AM DSB-SC amplitude
    sa_max = int(max(am_dsb_sc))
    print(f'Maximum AM DSB-SC amplitude:\t{sa_max}')

    #   2.  Minimum AM DSB-SC amplitude
    sa_min = int(min(am_dsb_sc))
    print(f'Minimum AM DSB-SC amplitude:\t{sa_min}')

    #   3.  Average normalized of power carrier signal
    c_anp = anp(csa)
    print(f'Average normalized power of carrier signal:\t{c_anp}')

    #   4.  Average normalized of power informaion signal
    i_anp = anp(isa)
    print(f'Average normalized power of information signal:\t{i_anp}')

    #   5.  Average normalized of power AM DSB-SC signal
    am_anp = anp(max(am_dsb_sc))
    print(f'Average normalized power of AM DSB-SC signal:\t{am_anp}')

    #   6.  Power output
    power_output = round(pow(m, 2) / (2 + pow(m, 2)), 1)
    print(f'Power output:\t{power_output}')

    #   7.  Information signal bandwidth
    i_bandwidth = isf
    print(f'Information signal bandwidth:\t{i_bandwidth}')

    #   8.  AM DSB-SC signal bandwidth
    s_bandwidth = 2*isf
    print(f'AM DSB-SC signal bandwidth:\t{s_bandwidth}')

    return am_anp


"""
    #   2.  Plot the information signal, carrier signal and the AM DSB-SC signal in one plot
    subplot_rows, subplot_columns = 3, 1
    plt.figure(1)

    plt.subplot(subplot_rows, subplot_columns, 1)
    plt.plot(t, i_signal, plot_colors[0])
    plt.grid()
    plt.tight_layout()
    plt.xlabel('Time (seconds)')
    plt.ylabel('Amplitude (volts)')
    plt.title('Information signal')

    plt.subplot(subplot_rows, subplot_columns, 2)
    plt.plot(t, c_signal, plot_colors[0])
    plt.grid()
    plt.tight_layout()
    plt.xlabel('Time (seconds)')
    plt.ylabel('Amplitude (volts)')
    plt.title('Carrier signal')

    plt.subplot(subplot_rows, subplot_columns, 3)
    plt.plot(t, am_dsb_sc, plot_colors[0])
    plt.plot(t, u_band, plot_colors[1])
    plt.plot(t, l_band, plot_colors[2])
    plt.grid()
    plt.tight_layout()
    plt.xlabel('Time (seconds)')
    plt.ylabel('Amplitude (volts)')
    plt.title('AM DSB-SC w/ side bands')

    #   3.  Plot the two sided and single sided spectrum of AM DSB-SC signal
    subplot_rows, subplot_columns = 2, 1
    plt.figure(2)

    plt.subplot(subplot_rows, subplot_columns, 1)
    plt.plot(f_range, fs_fft, plot_colors[0])
    plt.grid()
    plt.tight_layout()
    plt.title('Two sided spectrum')
    plt.xlabel('Frequency (Hz)')
    plt.ylabel('Amplitude (Volts)')
    plt.xlim([0, end_frequency_range_limit])
    plt.xticks([i*1000 for i in range(-end_frequency_range_ticks,
                                      end_frequency_range_ticks)], rotation=45)

    fs_fft = make_single_side_spectrum(fs_fft)
    f_range = make_single_side_spectrum(f_range)

    plt.subplot(subplot_rows, subplot_columns, 2)
    plt.plot(f_range, fs_fft, plot_colors[0])
    plt.grid()
    plt.tight_layout()
    plt.title('Single sided spectrum')
    plt.xlabel('Frequency (Hz)')
    plt.ylabel('Amplitude (Volts)')
    plt.xlim([0, end_frequency_range_limit])
    plt.xticks([i*1000 for i in range(0, end_frequency_range_ticks)], rotation=45)
"""

# with plt.xkcd():
#main(1, 1, 1000, 3, 10000)
cas = [5, 10]
cfs = [16000, 20000, 24000]
ias = [2, 4, 6, 8]
ifs = [i*1000 for i in [4, 8, 10, 12]]
counter = 0
for ca in cas:
    for cf in cfs:
        for ia in ias:
            for if_ in ifs:
                if main(counter, ia, if_, ca, cf) == 12.5:
                    break
                counter += 1


#   plt.show()
