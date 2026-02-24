e = 0.001;
nn = 100000;
G = [0.1 0.3 3 5];
results = NaN(length(G), 3);

colors = lines(length(G));

figure;
hold on;
for g_i = 1:2
    gamma = G(g_i);
    X1 = NaN * ones(nn, 1);
    X2 = NaN * ones(nn, 1);
    F = NaN * ones(nn, 1);
    D = NaN * ones(nn, 2);

    X1(1, 1) = 1;
    X2(1, 1) = -1;
    F(1, 1) = f(X1(1, 1), X2(1, 1));

    for i = 1:nn
        if norm(compute_gradient(X1(i, 1), X2(i, 1))) < e
            break;
        else
            D(i, 1) = -partial_x1(X1(i, 1), X2(i, 1));
            D(i, 2) = -partial_x2(X1(i, 1), X2(i, 1));
            X1(i+1, 1) = X1(i, 1) + gamma * D(i, 1);
            X2(i+1, 1) = X2(i, 1) + gamma * D(i, 2);
            F(i+1, 1) = f(X1(i+1, 1), X2(i+1, 1));
        end
    end

    results(g_i, :) = [i - 1, gamma, F(i, 1)];
    fprintf('Για γ = %.2f, το ελάχιστο της f βρέθηκε σε %d επαναλήψεις με τιμή %.4f.\n', ...
        gamma, i - 1, F(i, 1));

    plot(0:i, F(1:i+1), 'DisplayName', sprintf('γ = %.2f', gamma), ...
        'Color', colors(g_i, :));
end
xlabel('Αριθμός Επαναλήψεων');
ylabel('f');
title('Εξέλιξη της f για γ = 0.1 και γ = 0.3');
legend('show');
grid on;
hold off;

figure;
hold on;
for g_i = 3:4 
    gamma = G(g_i);
    X1 = NaN * ones(nn, 1);
    X2 = NaN * ones(nn, 1);
    F = NaN * ones(nn, 1);
    D = NaN * ones(nn, 2);

    X1(1, 1) = 1;
    X2(1, 1) = -1;
    F(1, 1) = f(X1(1, 1), X2(1, 1));

    for i = 1:nn
        if norm(compute_gradient(X1(i, 1), X2(i, 1))) < e
            break;
        else
            D(i, 1) = -partial_x1(X1(i, 1), X2(i, 1));
            D(i, 2) = -partial_x2(X1(i, 1), X2(i, 1));
            X1(i+1, 1) = X1(i, 1) + gamma * D(i, 1);
            X2(i+1, 1) = X2(i, 1) + gamma * D(i, 2);
            F(i+1, 1) = f(X1(i+1, 1), X2(i+1, 1));
        end
    end

    results(g_i, :) = [i - 1, gamma, F(i, 1)];
    fprintf('Για γ = %.2f, το ελάχιστο της f βρέθηκε σε %d επαναλήψεις με τιμή %.4f.\n', ...
        gamma, i - 1, F(i, 1));

    % Διάγραμμα F συναρτήσει των επαναλήψεων
    plot(0:i, F(1:i+1), 'DisplayName', sprintf('γ = %.2f', gamma), ...
        'Color', colors(g_i, :));
end
xlabel('Αριθμός Επαναλήψεων');
ylabel('f');
title('Εξέλιξη της f για γ = 3 και γ = 5');
legend('show');
grid on;
hold off;
