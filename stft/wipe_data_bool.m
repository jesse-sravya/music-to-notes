function newS_bool = wipe_data_bool(S, thresh_percent)

    [temp, ind] = max(S(:));
    [maxF, maxT] = ind2sub(size(S), ind);
    maxS = S(maxF, maxT);

    [temp, ind] = min(S(:));
    [minF, minT] = ind2sub(size(S), ind);
    minS = S(minF, minT);

    threshold = (thresh_percent * minS) + maxS;

    newS_bool = zeros(size(S));

    for i=1:size(S, 1) % f
        for j=1:size(S, 2) % t
            if S(i, j) >= threshold
                newS_bool(i, j) = 1;
            end
        end
    end
    
end