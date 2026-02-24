function a = projection_x2(x1, x2, s)
    x2_bar = x2 * (1 - 6 * s);
    if x2_bar <= -8
        a = -8;
    elseif x2_bar >= 12
        a = 12;
    else
        a = x2_bar;
    end
end
