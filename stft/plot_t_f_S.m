function plot_t_f_S(time, freq, dB)

    % plot the spectrogram
    figure(1)
    surf(time, freq, dB)
    shading interp
    axis tight
    box on
    view(0, 90)
    set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
    xlabel('Time, s')
    ylabel('Frequency, Hz')
    title('Amplitude spectrogram of the signal')

    handl = colorbar;
    set(handl, 'FontName', 'Times New Roman', 'FontSize', 14)
    ylabel(handl, 'Magnitude, dB')


end