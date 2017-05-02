function samples = StaticCompress(samples, param)

    for i=1:size(samples, 1)
    
        if samples(i, 1) < 0
            sign = -1;
        else
            sign = 1;
            
        norm = abs(samples(i, 1) / 32768); % NOT short.MaxValue
        norm = 1.0 - ((1.0 - norm) ^ param);
        samples(i, 1) = 32768 * norm * sign;
    end
end