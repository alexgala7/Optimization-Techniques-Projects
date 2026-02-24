function grad = compute_gradient(x, y)

    df_dx = 5*x^4 * exp(-x^2 - y^2) - 2*x^6 * exp(-x^2 - y^2); % ∂f/∂x
    df_dy = -2*x^5 * y * exp(-x^2 - y^2); % ∂f/∂y

    grad = [df_dx, df_dy];
end
