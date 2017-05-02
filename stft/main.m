clear, clc, close all

% [t, f, S] = runStft('../Piano notes/a5a4a6.wav');
% [t, f, S] = runStft('../Piano notes/a4a6_poly.wav');
% [t, f, S] = runStft('../Piano notes/c4c4_seq.wav');
% [t, f, S] = runStft('../Piano notes/c4c5_poly.wav');
[t, f, S] = runStft('../Piano notes/twinkle.wav');
% [t, f, S] = runStft('../Piano notes/e4f4g4_poly.wav');
% [t, f, S] = runStft('../Piano notes/c4_piano.wav');
% [t, f, S] = runStft('../Piano notes/a5_piano.wav');

plot_t_f_S(t, f, S);

%% Wipe out data, less than a certain percentage threshold.

% newS = wipe_data(S, 0.10);
% plot_t_f_S(t, f, newS);

%% Wipe out data, less than a certain percentage threshold. 0/1

newS_bool = wipe_data_bool(S, 0.10);
plot_t_f_S(t, f, newS_bool);

% ROWS = frequencies
% COLS = times

%% countIslands code for the count as well as the cluster elements.

[clusters, count] = countIslands_clusters(newS_bool, t, f, S);


%% Find cluster details
clc
[notes_times, labels] = findClusterDetails(clusters, 'large', 100); 

labels