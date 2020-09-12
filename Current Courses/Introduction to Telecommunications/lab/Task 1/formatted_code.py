#   import modules
import matplotlib.pyplot as plt
from numpy import linspace, pi, array, sin, sign, arange, cos


#   set line colors for the plots
colors = ['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728',
          '#9467bd', '#8c564b', '#e377c2', '#7f7f7f',
          '#bcbd22', '#17becf']

#   set core values
amplitude = 1
frequency = 1
signal_resolution = 1000
number_of_signal_periods = 4

#   calculate the rest of the values
signal_period = 1 / frequency
signal_duration = int(number_of_signal_periods*signal_period)
samples_per_signal_period = signal_resolution * number_of_signal_periods
period_sampling = signal_period / samples_per_signal_period
number_of_samples = int(1/period_sampling)+1
time = linspace(-2, 2, number_of_samples)

#   ask user input
order_of_harmonics = int(
    input('Enter the order of harmonics to calculate:\t'))

#   square function


def square_wave(time): return (abs((time % 1) - 0.25) <
                               0.25).astype(float) - (abs((time % 1) - 0.75) < 0.25).astype(float)


#   first plot
plt.figure(1)
#   plot time and square wave fuction
plt.plot(time, square_wave(time), colors[0])
#   set plot options
plt.xlabel('Time')
plt.ylabel('Amplitude')
plt.title('Square signal')
plt.grid()
#   save plot
# plt.savefig('Figure_1.png')


#       calculate harmonic order sum
#   set core values
harmonic_orders = []
harmonic_indexes = []
harmonic_order_sum = 0
harmonic_order = 1
while harmonic_order < order_of_harmonics + 1:
    if harmonic_order % 2 != 0:
        current_harmonic_value = 4 / (harmonic_order*pi) * \
            sin(2 * pi * harmonic_order * frequency * time)
        harmonic_orders.append(current_harmonic_value)
        harmonic_indexes.append(harmonic_order)
        harmonic_order_sum += current_harmonic_value
    harmonic_order += 1
#   second plot
plt.figure(2)
#   plot time and square wave
plt.plot(time, square_wave(time), colors[0], label='Square signal')
#   plot time and harmonic order sum
plt.plot(time, harmonic_order_sum, colors[1],
         label=f'Sum of {order_of_harmonics} harmonic orders')
#   set plot options
plt.xlabel('Time')
plt.ylabel('Amplitude')
plt.title('Square signal approximation')
plt.legend()
plt.grid()
#   save plot
# plt.savefig('Figure_2.png')


#       calculate each harmonic order
#   set core values
harmonic_order = 0
color_index = 0
harmonic_length = len(harmonic_indexes)
while harmonic_order < harmonic_length:
    #   third plot
    plt.figure(3)
    #   plot time and harmonic order
    plt.plot(time, harmonic_orders[harmonic_order],
             colors[color_index], label=f'{harmonic_indexes[harmonic_order]} harmonic order')
    #   plot options
    plt.xlabel('Time')
    plt.ylabel('Amplitude')
    plt.title('Square signal harmonic orders')
    plt.legend()
    plt.grid()
    #   loop steps
    color_index += 1
    harmonic_order += 1
    '''
    because the line colors can be less than the harmonic orders to plot,
    every time the color_index is larger than the number of colors,
    the color_index gets back to 0
    '''
    if color_index >= len(colors):
        color_index = 0
#   save plot
# plt.savefig('Figure_3.png')


#   function to get the amplitude of a harmonic order
def nth_harmonic_order_amplitude(order): return 2 / (pi * order)


harmonic_order_plane = array(harmonic_indexes)
#   fourth plot
plt.figure(4)
#   plot harmonic orders' amplitude
plt.stem(harmonic_order_plane, nth_harmonic_order_amplitude(
    harmonic_order_plane))
#   set plot options
plt.xlabel('Harmonic orders')
plt.ylabel('Amplitude')
plt.title(f'Amplitude of {order_of_harmonics} harmonic orders')
plt.grid()
#   save plot
# plt.savefig('Figure_4.png')

#   show plots
plt.show()
