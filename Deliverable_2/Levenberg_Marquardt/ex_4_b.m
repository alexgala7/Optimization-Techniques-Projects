e = 0.001;
nn = 100000;
mu = 1e-3;
beta = 0.8;
alpha = 1e-4;

X = NaN * ones(nn, 1);
Y = NaN * ones(nn, 1);
F = NaN * ones(nn, 1);
Hessians = cell(nn, 1);
Eigenvalues = NaN(nn, 2);

X(1, 1) = 1;
Y(1, 1) = -1;
F(1, 1) = f(X(1, 1), Y(1, 1));

for k = 1:nn
    grad = compute_gradient(X(k, 1), Y(k, 1));
    if norm(grad) < e
        break;
    end
    
    H = compute_hessian(X(k, 1), Y(k, 1));
    Hessians{k} = H;
    
    while true
        try
            chol(H + mu * eye(size(H)));
            break;
        catch
            mu = mu * 10;
        end
    end
    
    H_mod = H + mu * eye(size(H));
    Eigenvalues(k, :) = eig(H_mod);
    d_k = -H_mod \ grad';

    gamma = 1;
    while f(X(k, 1) + gamma * d_k(1), Y(k, 1) + gamma * d_k(2)) > ...
          F(k, 1) + alpha * gamma * dot(grad, d_k)
        gamma = gamma * beta;
    end

    X(k+1, 1) = X(k, 1) + gamma * d_k(1);
    Y(k+1, 1) = Y(k, 1) + gamma * d_k(2);
    F(k+1, 1) = f(X(k+1, 1), Y(k+1, 1));
end

fprintf(['Το ολικό ελάχιστο της συνάρτησης f χρησιμοποιώντας τη μέθοδο\n' ...
         'Levenberg-Marquardt, με δυναμικό βήμα και σημείο εκκίνησης το\n' ...
         '(%.2f, %.2f) είναι το %.4f και βρέθηκε σε %d επαναλήψεις.\n'], ...
        X(1, 1), Y(1, 1), f(X(k, 1), Y(k, 1)), k-1);

iterations = 1:k;
F = F(1:k);
Eigenvalues = Eigenvalues(1:k, :);

figure;
plot(iterations, F, '-o', 'LineWidth', 1.5);
xlabel('Αριθμός Επαναλήψεων');
ylabel('Τιμή Αντικειμενικής Συνάρτησης f');
title('Σύγκλιση της Αντικειμενικής Συνάρτησης (Levenberg-Marquardt)');
grid on;

figure;
plot(iterations, Eigenvalues(:, 1), '-o', 'LineWidth', 1.5, 'DisplayName', 'Λ1');
hold on;
plot(iterations, Eigenvalues(:, 2), '-o', 'LineWidth', 1.5, 'DisplayName', 'Λ2');
xlabel('Αριθμός Επαναλήψεων');
ylabel('Ιδιοτιμές του Τροποποιημένου Εσσιανού');
title('Ιδιοτιμές Τροποποιημένου Εσσιανού Πίνακα');
legend('show');
grid on;
