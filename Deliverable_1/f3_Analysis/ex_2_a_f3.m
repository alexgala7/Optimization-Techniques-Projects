L = [10^-15.95; 0.01; 0.1; 0.5; 1; 2];
nn = 100;
g = 0.618;

figure(1);
clf;

for k = 1:length(L)
    l = L(k);
    A = NaN * ones(nn, 1);
    B = NaN * ones(nn, 1);
    X = NaN * ones(nn, 2);
    F3 = NaN * ones(nn, 2);

    A(1, 1) = -1;
    B(1, 1) = 3;
    X(1, 1) = A(1, 1) + (1 - g) * (B(1, 1) - A(1, 1));
    X(1, 2) = A(1, 1) + g * (B(1, 1) - A(1, 1));
    F3(1, 1) = f3(X(1, 1));
    F3(1, 2) = f3(X(1, 2));

    for i = 1:nn
        if (B(i, 1) - A(i, 1)) < l
            fprintf('Το σημείο ελαχίστου για l = %2.4f βρίσκεται στο διάστημα [%2.4f, %2.4f]\n', l, A(i, 1), B(i, 1));
            fprintf('Χρειάστηκαν %d επαναλήψεις για να βρεθεί και %d υπολογισμοί της f.\n', i, i + 1);
            break;

        elseif f3(X(i, 1)) > f3(X(i, 2))
            A(i + 1, 1) = X(i, 1);
            B(i + 1, 1) = B(i, 1);
            X(i + 1, 2) = A(i + 1, 1) + g * (B(i + 1, 1) - A(i + 1, 1));
            X(i + 1, 1) = X(i, 2);
            F3(i + 1, 2) = f3(X(i + 1, 2));
            F3(i + 1, 1) = F3(i, 2);

        elseif f3(X(i, 1)) < f3(X(i, 2))
            A(i + 1, 1) = A(i, 1);
            B(i + 1, 1) = X(i, 2);
            X(i + 1, 2) = X(i, 1);
            X(i + 1, 1) = A(i + 1, 1) + (1 - g) * (B(i + 1, 1) - A(i + 1, 1));
            F3(i + 1, 1) = f3(X(i + 1, 1));
            F3(i + 1, 2) = F3(i, 1);
        end

        fprintf('f3(x1_%d) = f3(%2.4f) = %2.4f και f3(x2_%d) = f3(%2.4f) = %2.4f\n', i, X(i, 1), f3(X(i, 1)), i, X(i, 2), f3(X(i, 2)));
    end

    X_sorted = sort(X);
    X_vector = reshape(X_sorted, 1, []);
    F3_a = NaN * ones(1, length(X_vector));
    for j = 1:length(X_vector)
        F3_a(1, j) = f3(X_vector(1, j));
    end
    
    subplot(2, 3, k);
    plot(X_vector, F3_a);
    xlabel('X');
    ylabel('f3(x)');
    title(sprintf('f3 με l = %g', l));
end

sgtitle('Απεικόνιση της f3 για διαφορετικές τιμές l με τη μέθοδο του Χρυσού Τομέα');
