
% Finding maximum element from a 2D matrix
[maxA,ind] = max(S(:));
[m,n] = ind2sub(size(S),ind)

%%
% 
% Making a list of all the time frames, with their respective maximum dB
% and it's frequencies.
t_f_S_list = [;];
clc
for i=1:size(t, 2)
    [maxS, idx] = max(S(:, i));
    
    t_f_S_list(i, 1) = t(1, i);
    t_f_S_list(i, 2) = f(1, idx(1, 1));
    t_f_S_list(i, 3) = maxS;
   
end

%% 
% spectrogram(x)

%% Threshold based on set detecion //Not working
clc
threshhold = 100;
win = 90;
running_total = 0;
j = 1;

for i=1:win-1
    running_total = running_total + t_f_S_list(i, 2);
end
onset = [];

for i=win:size(t_f_S_list, 1)
    running_total = running_total - t_f_S_list(i-win+1, 2);
    running_total = running_total + t_f_S_list(i, 2);
    moving_avg = running_total / win;
    
    if moving_avg > threshhold
        onset = [onset; (i - (win/2))];
    end
end

%% Wipe out data, less than a certain percentage threshold.

newS = wipe_data(S, 0.10);
plot_t_f_S(t, f, newS);

%% Wipe out data, less than a certain percentage threshold. 0/1

newS_bool = wipe_data_bool(S, 0.10);
plot_t_f_S(t, f, newS_bool);

% ROWS = frequencies
% COLS = times

