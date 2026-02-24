function gamma = find_gamma_bisection(f, xk, yk, Dx, Dy, a, b, epsilon, delta)

    while (b - a) > epsilon
        c1 = (a + b) / 2 - delta;
        c2 = (a + b) / 2 + delta;

        g1 = f(xk + c1 * Dx, yk + c1 * Dy);
        g2 = f(xk + c2 * Dx, yk + c2 * Dy);
        
        if g1 < g2
            b = c2;
        else
            a = c1;
        end
    end
    gamma = (a + b) / 2;
end
