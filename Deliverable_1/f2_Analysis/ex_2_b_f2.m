L = [10^-15.35; 0.01; 0.1; 0.5; 1; 2]; 
g = 0.618;
nn = 100;

figure(1);
clf;
hold on;

for m = 1:length(L)
    l = L(m);
    A = NaN * ones(nn, 1);
    B = NaN * ones(nn, 1);
    X = NaN * ones(nn, 2);
    F2 = NaN * ones(nn, 2);
    K = NaN * ones(nn, 1);
    A(1, 1) = -1;
    B(1, 1) = 3;
    X(1, 1) = A(1, 1) + (1 - g) * (B(1, 1) - A(1, 1));
    X(1, 2) = A(1, 1) + g * (B(1, 1) - A(1, 1));
    F2(1, 1) = f2(X(1, 1));
    F2(1, 2) = f2(X(1, 2));

     for i = 1:nn
         K(i, 1) = i;
        if (B(i, 1) - A(i, 1)) < l
            fprintf('Το σημείο ελαχίστου για l = %2.4f βρίσκεται στο διάστημα [%2.4f, %2.4f]\n', l, A(i, 1), B(i, 1));
            fprintf('Χρειάστηκαν %d επαναλήψεις για να βρεθεί και %d υπολογισμοί της f.\n', i, i + 1);
            break;

        elseif f2(X(i, 1)) > f2(X(i, 2))
            A(i + 1, 1) = X(i, 1);
            B(i + 1, 1) = B(i, 1);
            X(i + 1, 2) = A(i + 1, 1) + g * (B(i + 1, 1) - A(i + 1, 1));
            X(i + 1, 1) = X(i, 2);
            F2(i + 1, 2) = f2(X(i + 1, 2));
            F2(i + 1, 1) = F2(i, 2);

        elseif f2(X(i, 1)) < f2(X(i, 2))
            A(i + 1, 1) = A(i, 1);
            B(i + 1, 1) = X(i, 2);
            X(i + 1, 2) = X(i, 1);
            X(i + 1, 1) = A(i + 1, 1) + (1 - g) * (B(i + 1, 1) - A(i + 1, 1));
            F2(i + 1, 1) = f2(X(i + 1, 1));
            F2(i + 1, 2) = F2(i, 1);
        end

        fprintf('f2(x1_%d) = f2(%2.4f) = %2.4f και f2(x2_%d) = f2(%2.4f) = %2.4f\n', i, X(i, 1), f2(X(i, 1)), i, X(i, 2), f2(X(i, 2)));
    end

    A = A(1:i);
    B = B(1:i);
    K = K(1:i);

    plot(K, A, '.-', 'DisplayName', sprintf('A για l = %.3f', l))
    plot(K, B, '.-', 'DisplayName', sprintf('B για l = %.3f', l))
end

legend('show')
xlabel('k')
ylabel('ak, bk')
title('Γραφική παράσταση των άκρων του διαστήματος συναρτήσει του δείκτη επαναλήψεων για διαφορετικές τιμές του l')
hold off;
