function H = compute_hessian(x, y)

    exp_factor = exp(-x^2 - y^2);
    d2f_dx2 = exp_factor * (4 * x^3 * (5 - 2 * x^2) - 4 * x^5 * (5 - 2 * x^2) - 2 * x^5);
    d2f_dxdy = -2 * y * x^4 * exp_factor * (5 - 2 * x^2); 
    d2f_dy2 = -2 * x^5 * exp_factor * (1 - 2 * y^2);
    H = [d2f_dx2, d2f_dxdy; d2f_dxdy, d2f_dy2];
    
end
