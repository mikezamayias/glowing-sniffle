import matplotlib.pyplot as plt
from numpy import arange, cos, linspace, pi, sin, sinc, split
from scipy.fftpack import fft, fftshift

#   the colors to use for the lines in the plots
colors = ['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728',
          '#9467bd', '#8c564b', '#e377c2', '#7f7f7f',
          '#bcbd22', '#17becf']


#   Data
#   information_signal_amplitude = int(input('Enter information signal amplitude:\t'))
#   information_signal_frequency = int(input('Enter information signal frequency:\t'))
#   carrier_signal_amplitude = int(input('Enter carrier signal amplitude:\t'))
#   carrier_signal_frequency = int(input('Enter carrier signal frequency:\t'))



def main(information_signal_amplitude, information_signal_frequency, carrier_signal_amplitude, carrier_signal_frequency):
    #   task 322
    number_of_signal_periods = 3
    signal_resolution = 1000

    #   Information Signal
    information_signal_period = 1/information_signal_frequency
    information_signal_start = 0
    information_signal_end = number_of_signal_periods*information_signal_period
    information_signal_sampling = signal_resolution*number_of_signal_periods
    information_signal_time = linspace(
        information_signal_start, information_signal_end, information_signal_sampling
    )
    w_information = 2*pi*information_signal_frequency
    information_signal = information_signal_amplitude * \
        cos(w_information*information_signal_time)

    #   Carrier Signal
    carrier_signal_period = 1/information_signal_frequency
    carrier_signal_start = 0
    carrier_signal_end = number_of_signal_periods*information_signal_period
    carrier_signal_sampling = signal_resolution*number_of_signal_periods
    carrier_signal_time = linspace(
        carrier_signal_start, carrier_signal_end, carrier_signal_sampling
    )
    w_carrier = 2*pi*carrier_signal_frequency
    carrier_signal = carrier_signal_amplitude * \
        cos(w_carrier*carrier_signal_time)


    #   Full AM signal
    full_am_signal = (carrier_signal_amplitude+information_signal) * \
        cos(w_carrier*carrier_signal_time)

    upper_band = information_signal+carrier_signal_amplitude
    lower_band = -upper_band

        #   task 323
    upper_band_max = int(max(upper_band))
    upper_band_min = int(min(upper_band))
    modulation_index = round(information_signal_amplitude /
                            carrier_signal_amplitude, 2)

    print(f'Upper band minima:\t{upper_band_min}')
    print(f'Upper band maxima:\t{upper_band_max}')
    print(f'Modulation index:\t{modulation_index}')


    #   task 324
    total_samples = len(carrier_signal_time)
    signal_fft = fft(full_am_signal)
    normalized_fft_signal = abs(signal_fft) / total_samples
    final_signal_fft = fftshift(normalized_fft_signal)
    if total_samples % 2 == 0:
        frequency_range = linspace(-total_samples, total_samples-1, total_samples)
    else:
        frequency_range = linspace(-(total_samples-1),
                                total_samples-1, total_samples)

    """#   plt.figure(2, figsize=[9, 3], dpi=100)
    plt.figure(2)
    single_sided_frequency_range = split(frequency_range, 2)[-1]
    single_sided_final_fft_signel = split(final_signal_fft,2)[-1]
    plt.plot(single_sided_frequency_range, single_sided_final_fft_signel)
    plt.grid()
    plt.title('Single-sided spectrum')
    plt.xlabel('Frequency (Hz)')
    plt.ylabel('Amplitude (Volts)')
    #plt.savefig('323.png', bbox_inches='tight')"""

    c_av_nor_power = pow(carrier_signal_amplitude, 2) / 2
    i_av_nor_power = pow(information_signal_amplitude, 2) / 2
    am_av_nor_power = pow(max(full_am_signal), 2) / 2
    print(f'Average normalized carrier signal power:\t{c_av_nor_power}')
    print(f'Average normalized information signal power:\t{i_av_nor_power}')
    print(f'Average normalized AM DSB-LC signal power:\t{am_av_nor_power}')
    return am_av_nor_power
"""
    #   plt.figure(1, figsize=[9, 9], dpi=400)
    plt.figure(1)
    plt.subplot(4, 1, 1)
    plt.plot(information_signal_time, information_signal,
            color=colors[0], label='Information Signal',  dash_capstyle='round')
    plt.grid()
    plt.tight_layout()
    plt.xlabel('Time (seconds)')
    plt.ylabel('Amplitude (volts)')
    plt.title('Information Signal')

    plt.subplot(4, 1, 2)
    plt.plot(carrier_signal_time, carrier_signal,
            color=colors[1], label='Carrier Signal', dash_capstyle='round')
    plt.grid()
    plt.tight_layout()
    plt.xlabel('Time (seconds)')
    plt.ylabel('Amplitude (volts)')
    plt.title('Carrier Signal')

    plt.subplot(4, 1, 3)
    plt.plot(carrier_signal_time, full_am_signal,
            color=colors[2], label='Full AM Signal', dash_capstyle='round')
    plt.grid()
    plt.tight_layout()
    plt.xlabel('Time (seconds)')
    plt.ylabel('Amplitude (volts)')
    plt.title('Full AM Signal')

    plt.subplot(4, 1, 4)
    plt.plot(information_signal_time, upper_band,
            color=colors[4], dash_capstyle='round')
    plt.plot(information_signal_time, lower_band,
            color=colors[4], dash_capstyle='round')
    plt.plot(carrier_signal_time, full_am_signal,
            color=colors[3], dash_capstyle='round')
    plt.grid()
    plt.tight_layout()
    plt.xlabel('Time (seconds)')
    plt.ylabel('Amplitude (volts)')
    plt.title('Full AM signal with sidebands')
    #   plt.savefig('322.png', bbox_inches='tight')"""




cas = [5, 10]
cfs = [16000, 20000, 24000]
ias = [2, 4, 6, 8]
ifs = [i*1000 for i in [4, 8, 10, 12]]

for ca in cas:
    for cf in cfs:
        for ia in ias:
            for if_ in ifs:
                if main(ia, if_, ca, cf) == 12.5:
                    print('found it')
                    break

#plt.show()
