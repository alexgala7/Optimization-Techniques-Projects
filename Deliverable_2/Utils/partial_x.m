function a = partial_x(x,y)
    a = 5*x^4 * exp(-x^2 - y^2) - 2*x^6 * exp(-x^2 - y^2);
end
