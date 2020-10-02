"""
TO-DO:
DONE:
    1.  Calculate and print Fs and Ts
    2.  Plot the information 1 signal, information 2 signal, information signal and carrier signal
    3.  Plot the AM DSB-SC signal without and with its sidebands
    4.  Plot the two sided and single sided spectrum of AM DSB-SC signal
    5.  Describe the spectrum of the AM DSB-SC signal
    6.  Calculate and print the following:
            1.  Maximum AM DSB-SC amplitude
            2.  Minimum AM DSB-SC amplitude
            3.  Average normalized of power carrier signal
            4.  Average normalized of power informaion 1 signal
            5.  Average normalized of power informaion 2 signal
            6.  Average normalized of power informaion signal
            7.  Average normalized of power AM DSB-SC signal
            8.  Power output
            9.  Information signal bandwidth
            10. AM DSB-SC signal bandwidth
    7.  What would change in the spectrum plot if the information 1 and information 2 signals were
         sine instead of cosine
    8.  Describe the changes to the spectrum plot and power output of AM DSB-SC if the carrier signal amplitude
         would double
"""


#   Import modules to use
import matplotlib as mpl
import matplotlib.pyplot as plt
from numpy import where, cos, linspace, pi, sin, sinc, split
from scipy.fftpack import fft, fftshift


plot_colors = ['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728',
               '#9467bd', '#8c564b', '#e377c2', '#7f7f7f',
               '#bcbd22', '#17becf']


def make_single_side_spectrum(spectrum):
    return split(spectrum, 2)[-1]


def anp(signal):
    return pow(signal, 2)/2


def main(isa1, isf1, isa2, isf2, csa, csf):
    isp1 = 1 / isf1  # information 1 period
    isp2 = 1 / isf2  # information 2 period
    csp = 1 / csf  # carrier period

    max_frequency = max(csf, isf1, isf2)
    min_frequency = min(csf, isf1, isf2)
    max_period = max(csp, isp1, isp2)
    nyquist_frequency = 2*max_frequency
    Tmax = 3*max_period

    #   1.  Calculate and print Fs and Ts
    Fs = float(min_frequency*nyquist_frequency)
    Ts = float(1/Fs)
    print(f'Fs:\t{Fs}')
    print(f'Ts:\t{Ts}')

    t = linspace(0, Tmax, Tmax/Ts)

    i1_omega = 2 * pi * isf1
    i2_omega = 2 * pi * isf2
    c_omega = 2 * pi * csf

    i1_signal = isa1 * cos(i1_omega * t)
    i2_signal = isa2 * cos(i2_omega * t)

    i_signal = i1_signal + i2_signal
    c_signal = csa * cos(c_omega * t)

    isa = int(max(i_signal))
    isf = min_frequency

    m = isa/csa
    am_dsb_sc = i_signal * c_signal

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
    print(f'Maximum AM DSB-LC amplitude:\t{sa_max}')

    #   2.  Minimum AM DSB-SC amplitude
    sa_min = int(min(am_dsb_sc))
    print(f'Minimum AM DSB-LC amplitude:\t{sa_min}')

    #   3.  Average normalized of power carrier signal
    c_anp = anp(csa)
    print(f'Average normalized power of carrier signal:\t{c_anp}')

    #   4.  Average normalized of power informaion 1 signal
    i1_anp = anp(isa1)
    print(f'Average normalized power of information 1 signal:\t{i1_anp}')

    #   5.  Average normalized of power informaion 2 signal
    i2_anp = anp(isa2)
    print(f'Average normalized power of information 2 signal:\t{i2_anp}')

    #   6.  Average normalized of power informaion signal
    i_anp = anp(isa)
    print(f'Average normalized power of information signal:\t{i_anp}')

    #   7.  Average normalized of power AM DSB-SC signal
    am_anp = anp(max(am_dsb_sc))
    print(f'Average normalized power of AM DSB-SC signal:\t{am_anp}')

    #   8.  Power output
    power_output = round(pow(m, 2) / (2 + pow(m, 2)), 1)
    print(f'Power output:\t{power_output}')

    #   9.  Information signal bandwidth
    i_bandwidth = isf
    print(f'Information signal bandwidth:\t{i_bandwidth}')

    #   10. AM DSB-SC signal bandwidth
    s_bandwidth = 2*isf
    print(f'AM DSB-SC signal bandwidth:\t{s_bandwidth}')

    #   2.  Plot the information 1 signal, information 2 signal, information signal and carrier signal
    subplot_rows, subplot_columns = 2, 2
    plt.figure(1)

    plt.subplot(subplot_rows, subplot_columns, 1)
    plt.plot(t, i1_signal, plot_colors[0])
    plt.grid()
    plt.tight_layout()
    plt.xlabel('Time (seconds)')
    plt.ylabel('Amplitude (volts)')
    plt.title('Information 1 signal')

    plt.subplot(subplot_rows, subplot_columns, 2)
    plt.plot(t, i2_signal, plot_colors[0])
    plt.grid()
    plt.tight_layout()
    plt.xlabel('Time (seconds)')
    plt.ylabel('Amplitude (volts)')
    plt.title('Information 2 signal')

    plt.subplot(subplot_rows, subplot_columns, 3)
    plt.plot(t, i_signal, plot_colors[1])
    plt.grid()
    plt.tight_layout()
    plt.xlabel('Time (seconds)')
    plt.ylabel('Amplitude (volts)')
    plt.title('Information signal')

    plt.subplot(subplot_rows, subplot_columns, 4)
    plt.plot(t, c_signal, plot_colors[2])
    plt.grid()
    plt.tight_layout()
    plt.xlabel('Time (seconds)')
    plt.ylabel('Amplitude (volts)')
    plt.title('Carrier')

    #   3.  Plot the AM DSB-SC signal without and with its sidebands
    subplot_rows, subplot_columns = 2, 1
    plt.figure(2)

    plt.subplot(subplot_rows, subplot_columns, 1)
    plt.plot(t, am_dsb_sc, plot_colors[0])
    plt.grid()
    plt.tight_layout()
    plt.xlabel('Time (seconds)')
    plt.ylabel('Amplitude (volts)')
    plt.title('AM DSB-SC w/o sidebands')

    plt.subplot(subplot_rows, subplot_columns, 2)
    plt.plot(t, am_dsb_sc, plot_colors[0])
    plt.plot(t, u_band, plot_colors[1])
    plt.plot(t, l_band, plot_colors[2])
    plt.grid()
    plt.tight_layout()
    plt.xlabel('Time (seconds)')
    plt.ylabel('Amplitude (volts)')
    plt.title('AM DSB-SC w/ sidebands')

    #   4.  Plot the two sided and single sided spectrum of AM DSB-SC signal
    subplot_rows, subplot_columns = 2, 1
    plt.figure(3)

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


    #   7.  What would change in the spectrum plot if the information 1 and information 2 signals were
    #        sine instead of cosine
    new_i1_signal = isa1 * sin(i1_omega * t)
    new_i2_signal = isa2 * sin(i2_omega * t)

    new_i_signal = new_i1_signal + new_i2_signal
    c_signal = csa * cos(c_omega * t)

    am_dsb_sc = new_i_signal * c_signal

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

    subplot_rows, subplot_columns = 2, 1
    plt.figure(4)

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

    #   8.  Describe the changes to the spectrum plot and power output of AM DSB-SC if the carrier signal amplitude
    #        would double
    new_csa = 2 * csa

    c_signal = new_csa * cos(c_omega * t)
    am_dsb_sc = i_signal * c_signal
    u_band = i_signal * new_csa
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
    end_frequency_range_ticks = int(end_frequency_range_limit / 1000)

    subplot_rows, subplot_columns = 2, 1
    plt.figure(5)

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

    m = isa / new_csa
    new_power_output = round((pow(m, 2) / (2 + pow(m, 2))), 1)
    print(f'New power output:\t{new_power_output}')

    diff = new_power_output - power_output
    diff_perc = round(diff / power_output * 100, 1)
    print(
        f'The percentage difference between the old and new power output is {diff_perc}%')


# with plt.xkcd():
main(1, 1000, 4, 2000, 3, 10000)
plt.show()
