function gamma = find_gamma_armijo(f, grad, xk, yk, Dx, Dy, s, beta, alpha)
    gamma = s;
    m_k = 0;
    f0 = f(xk, yk);
    grad_f = grad(xk, yk);
    descent_condition = alpha * gamma * (grad_f(1) * Dx + grad_f(2) * Dy);
    while f(xk + gamma * Dx, yk + gamma * Dy) > f0 + descent_condition
        gamma = beta * gamma;
        m_k = m_k + 1;
        descent_condition = alpha * gamma * (grad_f(1) * Dx + grad_f(2) * Dy);
    end
end
