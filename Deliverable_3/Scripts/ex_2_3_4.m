e = 0.01;
nn = 100001;

G = [0.5; 0.1; 0.2];
S = [5; 15; 0.1];

initial_conditions = [5, -5; -5, 10; 8, -10];

for idx = 1:length(G)
    gamma = G(idx);
    s = S(idx);

    X1 = NaN * ones(nn, 1);
    X2 = NaN * ones(nn, 1);
    F = NaN * ones(nn, 1);

    X1(1, 1) = initial_conditions(idx, 1);
    X2(1, 1) = initial_conditions(idx, 2);
    F(1, 1) = f(X1(1, 1), X2(1, 1));

    for i = 1:nn
        if norm(compute_gradient(X1(i, 1), X2(i, 1))) < e
            break;
        else
            X1(i+1, 1) = X1(i, 1) + gamma * (projection_x1(X1(i, 1), X2(i, 1), s) - X1(i, 1));
            X2(i+1, 1) = X2(i, 1) + gamma * (projection_x2(X1(i, 1), X2(i, 1), s) - X2(i, 1));
            F(i+1, 1) = f(X1(i+1, 1), X2(i+1, 1));
        end
    end

    final_iterations = i - 1;
    final_minimum = F(i, 1);

    fprintf(['Για γ=%.2f και s=%.2f: Το ολικό ελάχιστο της συνάρτησης f\n' ...
        'με σημείο εκκίνησης (%.2f, %.2f) είναι το %.3f και βρέθηκε σε %d επαναλήψεις.\n'], ...
        gamma, s, X1(1,1), X2(1,1), final_minimum, final_iterations);

    if idx < 3
        plot_iterations = 200;
    else
        plot_iterations = final_iterations + 1;
    end

    plot_X1 = X1(1:min(plot_iterations, final_iterations+1));
    plot_X2 = X2(1:min(plot_iterations, final_iterations+1));
    plot_F = F(1:min(plot_iterations, final_iterations+1));

    figure;
    plot(1:length(plot_F), plot_F, '-o', 'LineWidth', 1.5);
    xlabel('Αριθμός Επαναλήψεων');
    ylabel('Τιμή F');
    title(sprintf('F συναρτήσει των επαναλήψεων (γ=%.2f, s=%.2f)', gamma, s));
    grid on;

    figure;
    hold on;
    plot(1:length(plot_X1), plot_X1, '-o', 'DisplayName', 'X1', 'LineWidth', 1.5);
    plot(1:length(plot_X2), plot_X2, '-o', 'DisplayName', 'X2', 'LineWidth', 1.5);
    hold off;
    xlabel('Αριθμός Επαναλήψεων');
    ylabel('Τιμές X1 και X2');
    title(sprintf('X1 και X2 συναρτήσει των επαναλήψεων (γ=%.2f, s=%.2f)', gamma, s));
    legend('show');
    grid on;
end
