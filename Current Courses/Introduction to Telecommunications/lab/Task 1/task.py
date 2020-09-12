import matplotlib.pyplot as plt
import matplotlib.colors as mcolors
from numpy import linspace, pi, array, sin
from scipy import signal


#   line colors
colors = list(mcolors.TABLEAU_COLORS)


def square_wave(time):
    #   return (abs((time % 1) - 0.25) < 0.25).astype(float) - (abs((time % 1) - 0.75) < 0.25).astype(float)
    return signal.square(2*pi*time)


def harmonic_orders_amplitude(harmonic_orders):
    return 2 / (pi * harmonic_orders)


#   data
signal_resolution = 1000
number_of_signal_periods = 4

signal_amplitude = 1
signal_frequency = 1
signal_period = 1 / signal_frequency

signal_duration = int(number_of_signal_periods*signal_period)
samples_per_signal_period = signal_resolution * number_of_signal_periods
period_sampling = signal_period / samples_per_signal_period
number_of_samples = int(1/period_sampling)+1

time = linspace(-2, 2, number_of_samples)
signal_function = square_wave(time)

#   order_of_harmonics = int(
#       input('Enter the order of harmonics to calculate:\t'))
order_of_harmonics = 10


"""
Plot signal
"""
plot1 = plt.subplot(4, 1, 1)
plot1.plot(time, signal_function, label='Signal function',
           color=colors[0])
plot1.set_xlabel('Time')
plot1.set_ylabel('Amplitude')
plot1.set_title('Square signal')
plot1.legend()
plot1.grid()


"""
Plot signal's harmonic order approximation
"""
plot2 = plt.subplot(4, 1, 2)
harmonic_values, harmonic_indexes = [], []
harmonic_sum, harmonic_order = 0, 1
harmonic_orders = order_of_harmonics + 1
while harmonic_order < harmonic_orders:
    if harmonic_order % 2 != 0:
        harmonic_value = 4 / (harmonic_order*pi) * \
            sin(2 * pi * harmonic_order * signal_frequency * time)
        harmonic_values.append(harmonic_value)
        harmonic_indexes.append(harmonic_order)
        harmonic_sum += harmonic_value
    harmonic_order += 1

plot2.plot(time, square_wave(time), colors[0], label='Square signal')
plot2.plot(time, harmonic_sum,
           color=colors[1],
           label=f'Harmonic approximation',
           )
plot2.set_xlabel('Time')
plot2.set_ylabel('Amplitude')
plot2.set_title('Square signal approximation')
plot2.legend()
plot2.grid()


"""
Plot signal's harmonic orders
"""
plot3 = plt.subplot(4, 1, 3)
harmonic_order = 0
color_index = 0
harmonic_length = len(harmonic_indexes)
while harmonic_order < harmonic_length:
    plot3.plot(time, harmonic_values[harmonic_order],
               color=colors[color_index],
               label=f'Harmonic order: {harmonic_indexes[harmonic_order]}',
               alpha=0.8)
    plot3.set_xlabel('Time')
    plot3.set_ylabel('Amplitude')
    plot3.set_title('Signal harmonic orders')
    plot3.legend()
    plot3.grid()
    color_index += 1
    harmonic_order += 1
    if color_index >= len(colors):
        color_index = 0


"""
Plot signal's harmonic order's amplitude
"""
plot4 = plt.subplot(4, 1, 4)
harmonic_order, color_index = 0, 0
harmonic_order_plane = array(harmonic_indexes)
harmonic_order_amplitude = harmonic_orders_amplitude(harmonic_order_plane)
while harmonic_order < harmonic_length:
    plot4.scatter(
        harmonic_order_plane[harmonic_order],
        harmonic_order_amplitude[harmonic_order],
        label=f'{harmonic_order_plane[harmonic_order]} harmonic order\'s amplitude'
    )
    plot4.set_xlabel('Harmonic orders')
    plot4.set_ylabel('Amplitude')
    plot4.set_title(f'Harmonic orders amplitude')
    plot4.legend()
    plot4.grid()
    color_index += 1
    harmonic_order += 1
    if color_index >= len(colors):
        color_index = 0


"""
Show plots
"""
plt.show()
