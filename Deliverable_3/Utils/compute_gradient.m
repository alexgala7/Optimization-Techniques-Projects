function grad = compute_gradient(x1, x2)

    df_dx1 = (2/3)*x1;
    df_dx2 = 6*x2;

    grad = [df_dx1, df_dx2];
end
