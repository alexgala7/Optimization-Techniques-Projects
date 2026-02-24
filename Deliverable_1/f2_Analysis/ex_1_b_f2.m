L = [0.002000000000001; 0.01; 0.1; 0.5; 1; 2];
e = 0.001;
nn = 100;

figure(1);
clf;

for k = 1:length(L)
    l = L(k);
    A = NaN * ones(nn, 1);
    B = NaN * ones(nn, 1);
    X = NaN * ones(nn, 2);
    F2 = NaN * ones(nn, 2);
    
    A(1, 1) = -1;
    B(1, 1) = 3;

    for i = 1:nn
        if (B(i, 1) - A(i, 1)) < l
            fprintf('Το σημείο ελαχίστου για l = %2.4f βρίσκεται στο διάστημα [%2.4f, %2.4f]\n', l, A(i, 1), B(i, 1));
            fprintf('Χρειάστηκαν %d επαναλήψεις για να βρεθεί και %d υπολογισμοί της f.\n', i, 2 * (i - 1));
            break;
        else
            X(i, 1) = (A(i, 1) + B(i, 1)) / 2 - e;
            X(i, 2) = (A(i, 1) + B(i, 1)) / 2 + e;

            if f2(X(i, 1)) < f2(X(i, 2))
                A(i + 1, 1) = A(i, 1);
                B(i + 1, 1) = X(i, 2);
            else
                A(i + 1, 1) = X(i, 1);
                B(i + 1, 1) = B(i, 1);
            end
            fprintf('f2(x1_%d) = f2(%2.4f) = %2.4f και f2(x2_%d) = f2(%2.4f) = %2.4f\n', i, X(i, 1), f2(X(i, 1)), i, X(i, 2), f2(X(i, 2)));
            F2(i, 1) = f2(X(i, 1));
            F2(i, 2) = f2(X(i, 2));
        end
    end

    X_sorted = sort(X);
    X_vector = reshape(X_sorted, 1, []);
    F2_a = NaN * ones(1, length(X_vector));
    for j = 1:length(X_vector)
        F2_a(1, j) = f2(X_vector(1, j));
    end
    
    % Δημιουργία υποπλασίου για κάθε τιμή του l
    subplot(2, 3, k);
    plot(X_vector, F2_a);
    xlabel('X');
    ylabel('f2(x)');
    title(sprintf('l = %g', l));
end

sgtitle('Απεικόνιση της f2 για διαφορετικές τιμές l με τη μέθοδο της Διχοτόμου');
