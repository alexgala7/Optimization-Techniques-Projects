e = 0.001;
nn = 100000;
G = 0.05:0.05:1;
results = NaN(length(G), 3);

for g_idx = 1:length(G)
    gamma = G(g_idx);
    X = NaN * ones(nn, 1);
    Y = NaN * ones(nn, 1);
    F = NaN * ones(nn, 1);
    D = NaN * ones(nn, 2);

    X(1, 1) = 1;
    Y(1, 1) = -1;
    F(1, 1) = f(X(1, 1), Y(1, 1));

    for i = 1:nn
        if norm(compute_gradient(X(i, 1), Y(i, 1))) < e
            break;
        else
            D(i, 1) = -partial_x(X(i, 1), Y(i, 1));
            D(i, 2) = -partial_y(X(i, 1), Y(i, 1));
            X(i+1, 1) = X(i, 1) + gamma * D(i, 1);
            Y(i+1, 1) = Y(i, 1) + gamma * D(i, 2);
            F(i+1, 1) = f(X(i+1, 1), Y(i+1, 1));
        end
    end

    results(g_idx, :) = [i - 1, gamma, F(i, 1)];
end

[~, best_idx] = min(results(:, 1));
best_gamma = results(best_idx, 2);
best_minimum = results(best_idx, 3);
best_iterations = results(best_idx, 1);

fprintf(['Το ολικό ελάχιστο της συνάρτησης f χρησιμοποιώντας τη μέθοδο\n' ...
    'Μέγιστης Καθόδου, με σταθερό βήμα %.2f και σημείο εκκίνησης του\n' ...
    'αλγορίθμου το (%.2f, %.2f) είναι το %.4f και βρέθηκε σε %d επαναλήψεις.\n'], ...
    best_gamma, X(1,1), Y(1,1), best_minimum, best_iterations);

plot(results(:, 1), results(:, 2), '-o');
xlabel('Αριθμός Επαναλήψεων');
ylabel('\gamma');
title('Επίδραση του \gamma στον αριθμό επαναλήψεων');
grid on;
