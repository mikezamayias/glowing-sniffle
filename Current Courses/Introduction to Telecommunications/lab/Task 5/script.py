from numpy import pi, cos, linspace, sin, split
from scipy.fftpack import fft, fftshift
import matplotlib.pyplot as plt
import numpy as np


#   plot colors
pc = [
    '#1f77b4', '#ff7f0e', '#2ca02c', '#d62728', '#9467bd',
    '#8c564b', '#e377c2', '#7f7f7f', '#bcbd22', '#17becf'
]

#   constant kf
kf = 2*pi*4000
#   consant con
con = 100
#   number of periods
nop = 3


#   signals time
def time(fm, fc):
    #   max frequency
    fre = min(fm, fc)
    #   period
    per = 1 / fre
    #   nyquist frequency
    nyq_fre = 2 * fre
    #   sampling frequency
    sam_fre = con * nyq_fre
    #   time
    tim = linspace(0, per*nop, sam_fre)
    #   return
    return tim, sam_fre

#   fourier transform


def four_tran(signal, tot_sam):
    #   fourier transform
    s_ft = fft(signal)
    #   normalised fourier transform
    ns_ft = abs(s_ft) / tot_sam
    #   final fourier transform
    fs = fftshift(ns_ft)
    return fs

#   frequency range of two sided spectrum


def freq_rang(tot_sam, ps):
    if tot_sam % 2 == 0:
        f_range = linspace(-tot_sam / 2, tot_sam / 2 - 1, tot_sam)
    else:
        f_range = linspace(-(tot_sam - 1) / 2, (tot_sam - 1) / 2, tot_sam)
    dur = tot_sam * ps
    f_range *= 1 / dur
    return f_range

#   single sided spectrum


def sin_sid_spe(spectrum):
    return split(spectrum, 2)[-1]

#   average normalized power


def anp(signal):
    return pow(signal, 2)/2


def main(am, fm, ac, fc):
    #   time, frequency sampling
    t, fs = time(fm, fc)
    print(f'Frequency sampling:\t{fs}')
    #   period sampling
    ps = 1 / fs
    print(f'Period sampling:\t{ps}')
    #   modulation index
    m = round((kf * am) / (2 * pi * fm), 1)
    #   information signal
    xm = am * cos(2 * pi * fm * t)
    #   carrier signal
    xc = ac * cos(2 * pi * fc * t)
    #   phase shift
    phit = ((kf*am)/(2*pi*fm))*sin(2*pi*fm*t)
    #   fm signal
    xfm = ac * cos(2 * pi * fc * t + phit)
    #   plot figure number
    pfn = 1

    #   total samples
    tot_sam = len(t)
    #   two sided xfm spectrum
    xfm_tsp = four_tran(xfm, tot_sam)
    #   single sided xfm spectrum
    xfm_ssp = sin_sid_spe(xfm_tsp)
    #   frequency range of two sided xfm spectrum
    fr_xfm_tsp = freq_rang(tot_sam, ps)
    #   frequency range of single sided xfm spectrum
    fr_xfm_ssp = sin_sid_spe(fr_xfm_tsp)
    #   two sided xfm spectrum limits
    end = (3*fc) / 1000
    xfm_tsp_lims = [-end, end]
    #   single sided xfm spectrum limits
    xfm_ssp_lims = [0, end]

    #   two sided xm spectrum
    xm_tsp = four_tran(xm, tot_sam)
    #   single sided xm spectrum
    xm_ssp = sin_sid_spe(xm_tsp)
    #   frequency range of two sided xm spectrum
    fr_xm_tsp = freq_rang(tot_sam, ps)
    #   frequency range of single sided xm spectrum
    fr_xm_ssp = sin_sid_spe(fr_xm_tsp)
    #   two sided xm spectrum limits
    end = ((fm + fc) / 2) / 1000
    xm_tsp_lims = [-end, end]
    #   single sided xm spectrum limits
    xm_ssp_lims = [0, end]

    #   fm amplitude
    fm_amp = float(max(xfm))
    print(f'FM amplitude:\t{fm_amp}')
    #   average normalized carrier power
    anxcp = anp(ac)
    print(f'Average normalized carrier power:\t{anxcp}')
    #   average normalized information power
    anxmp = anp(am)
    print(f'Average normalized information power:\t{anxmp}')
    #   average normalized carrier power
    anxfmp = anp(int(max(xfm)))
    print(f'Average normalized FM power:\t{anxfmp}')
    #   peak frequency deviation
    pfd = m * fm
    print(f'Peak frequency deviation:\t{pfd}')
    #   modulation index
    print(f'Modulation index:\t{m}')
    #   information bandwidth
    print(f'Information bandwidth:\t{float(fm)}')
    #   fm bandwidth
    xfm_band = 2 * (m + 1) * fm
    print(f'FM bandwidth:\t{xfm_band}')

    #   subplot coordinates
    sub_cols, sub_rows = 1, 2

    plt.figure(pfn)
    plt.subplot(sub_rows, sub_cols, 1)
    plt.plot(t, xm, label='Information', color=pc[0])
    plt.plot(t, xc, label='Carrier', color=pc[2])
    plt.grid()
    plt.legend()
    plt.tight_layout()
    plt.xlabel('Time (seconds)')
    plt.ylabel('Amplitude (volts)')
    plt.title('Information and carrier signals')

    plt.subplot(sub_rows, sub_cols, 2)
    plt.plot(t, xm, label='Information', color=pc[0])
    plt.plot(t, xfm, label='FM', color=pc[2])
    plt.grid()
    plt.legend()
    plt.tight_layout()
    plt.xlabel('Time (seconds)')
    plt.ylabel('Amplitude (volts)')
    plt.title('Information and FM signals')
    pfn += 1

    #   subplot coordinates
    sub_cols, sub_rows = 1, 2

    plt.figure(pfn)
    plt.subplot(sub_rows, sub_cols, 1)
    plt.plot(fr_xm_tsp, xm_tsp)
    plt.grid()
    plt.xlim(xm_tsp_lims)
    plt.tight_layout()
    plt.xlabel('Frequency (kHz)')
    plt.ylabel('Amplitude (volts)')
    plt.title('Two sided Information spectrum')

    plt.subplot(sub_rows, sub_cols, 2)
    plt.plot(fr_xm_ssp, xm_ssp, color=pc[0])
    plt.grid()
    plt.xlim(xm_ssp_lims)
    plt.tight_layout()
    plt.xlabel('Frequency (kHz)')
    plt.ylabel('Amplitude (volts)')
    plt.title('Single sided Information spectrum ')
    pfn += 1

    #   subplot coordinates
    sub_cols, sub_rows = 1, 2

    plt.figure(pfn)
    plt.subplot(sub_rows, sub_cols, 1)
    plt.plot(fr_xfm_tsp, xfm_tsp, color=pc[0])
    plt.grid()
    plt.xlim(xfm_tsp_lims)
    plt.tight_layout()
    plt.xlabel('Frequency (kHz)')
    plt.ylabel('Amplitude (volts)')
    plt.title('Two sided FM spectrum')

    plt.subplot(sub_rows, sub_cols, 2)
    plt.plot(fr_xfm_ssp, xfm_ssp, color=pc[0])
    plt.grid()
    plt.xlim(xfm_ssp_lims)
    plt.tight_layout()
    plt.xlabel('Frequency (kHz)')
    plt.ylabel('Amplitude (volts)')
    plt.title('Single sided FM spectrum ')
    pfn += 1


cas = [5, 10]
cfs = [16000, 20000, 24000]
ias = [2, 4, 6, 8]
ifs = [i*1000 for i in [4, 8, 10, 12]]

for ca

main(1, 2000, 3, 20000)
#   plt.show()
