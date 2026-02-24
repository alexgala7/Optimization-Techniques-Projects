e = 0.001;
nn = 100000;
mu = 1;
beta = 2;
alpha = 0.5;
gamma_min = 1e-6;
G = 0.05:0.05:1;

best_gamma = NaN;
min_iterations = Inf;
best_minimum = NaN;
results = NaN(length(G), 2);

for g_idx = 1:length(G)
    gamma = G(g_idx);
    X = NaN * ones(nn, 1);
    Y = NaN * ones(nn, 1);
    F = NaN * ones(nn, 1);

    X(1, 1) = 1;
    Y(1, 1) = -1;
    F(1, 1) = f(X(1, 1), Y(1, 1));

    for i = 1:nn
        grad = compute_gradient(X(i, 1), Y(i, 1));
        if norm(grad) < e
            break;
        else
            H = compute_hessian(X(i, 1), Y(i, 1));

            while ~is_positive_definite(H + mu * eye(2))
                mu = beta * mu;
            end

            H_mu = H + mu * eye(2);
            d_k = -H_mu \ grad';

            gamma_current = gamma;
            while true
                X_temp = X(i, 1) + gamma_current * d_k(1);
                Y_temp = Y(i, 1) + gamma_current * d_k(2);
                F_temp = f(X_temp, Y_temp);

                grad_next = compute_gradient(X_temp, Y_temp);

                if F_temp <= F(i) + alpha * gamma_current * dot(d_k, grad) && ...
                   dot(d_k, grad_next) > beta * dot(d_k, grad)
                    X(i+1, 1) = X_temp;
                    Y(i+1, 1) = Y_temp;
                    F(i+1, 1) = F_temp;
                    break;
                else
                    gamma_current = gamma_current / 2;
                    if gamma_current < gamma_min
                        error('Το βήμα γ έγινε πολύ μικρό και η μέθοδος απέτυχε να ικανοποιήσει τα κριτήρια.');
                    end
                end
            end
        end
    end

    iterations = i - 1;
    results(g_idx, :) = [iterations, gamma];

    if iterations < min_iterations
        min_iterations = iterations;
        best_gamma = gamma;
        best_minimum = F(i, 1);
    end
end

fprintf(['Το ολικό ελάχιστο της συνάρτησης f χρησιμοποιώντας τη μέθοδο\n' ...
    'Levenberg-Marquardt, με σταθερό βήμα %.2f και σημείο εκκίνησης του\n' ...
    'αλγορίθμου το (%.2f, %.2f) είναι το %.4f και βρέθηκε σε %d επαναλήψεις.\n'], ...
    best_gamma, X(1, 1), Y(1, 1), best_minimum, min_iterations);

plot(results(:, 1), results(:, 2), '-o');
xlabel('Αριθμός επαναλήψεων');
ylabel('γ');
title('Επίδραση του γ στον αριθμό επαναλήψεων');
grid on;

function result = is_positive_definite(A)
    result = all(eig(A) > 0);
end
