function newS = wipe_data(S, thresh_percent)

    [temp, ind] = max(S(:));
    [maxF, maxT] = ind2sub(size(S), ind);
    maxS = S(maxF, maxT);

    [temp, ind] = min(S(:));
    [minF, minT] = ind2sub(size(S), ind);
    minS = S(minF, minT);

    threshold = (thresh_percent * minS) + maxS;

    newS = S;

    for i=1:size(S, 1) % f
        for j=1:size(S, 2) % t

            if newS(i, j) < threshold
                newS(i, j) = minS;
            end
        end
    end 
end