function a = projection_x1(x1, x2, s)
    x1_bar = x1 * (1 - (2/3) * s);
    if x1_bar <= -10
        a = -10;
    elseif x1_bar >= 5
        a = 5;
    else
        a = x1_bar;
    end
end
