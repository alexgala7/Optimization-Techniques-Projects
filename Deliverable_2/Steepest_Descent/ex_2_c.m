e = 0.001;
nn = 10000;

X = NaN * ones(nn, 1);
Y = NaN * ones(nn, 1);
G = NaN * ones(nn, 1);
D = NaN * ones(nn, 2);
F = NaN * ones(nn, 1);

X(1, 1) = 1;
Y(1, 1) = -1; 
F(1, 1) = f(X(1,1), Y(1,1));
f_handle = @(x, y) f(x, y);

for i = 1:nn
    grad = compute_gradient(X(i, 1), Y(i, 1));
    if norm(grad) < e
        break;
    else
        D(i, 1) = -partial_x(X(i, 1), Y(i, 1));
        D(i, 2) = -partial_y(X(i, 1), Y(i, 1));
        G(i, 1) = find_gamma_armijo(f_handle, @(x, y) compute_gradient(x, y), ...
            X(i, 1), Y(i, 1), D(i, 1), D(i, 2), 4, 0.4, 1e-4);

        X(i+1, 1) = X(i, 1) + G(i, 1) * D(i, 1);
        Y(i+1, 1) = Y(i, 1) + G(i, 1) * D(i, 2);
        F(i+1, 1) = f(X(i+1, 1), Y(i+1, 1));
    end
end

fprintf(['Το ολικό ελάχιστο της συνάρτησης f χρησιμοποιώντας τη μέθοδο\n' ...
    'Μέγιστης Καθόδου, με δυναμικό βήμα που παράγεται από τον κανόνα Armijo\n' ...
    'και σημείο εκκίνησης του αλγορίθμου το (%.2f, %.2f) είναι\n' ...
    'το %.4f και βρέθηκε σε %d επαναλήψεις.\n'], ...
    X(1, 1), Y(1, 1), f(X(i, 1), Y(i, 1)), i-1);

iterations = 1:i; %Διώχνω τους όρους ΝaN που έχουν απομείνει για να σχεδιάσω την F
F = F(1:i); 

figure;
plot(iterations, F, '-o', 'LineWidth', 1.5);
xlabel('Αριθμός Επαναλήψεων');
ylabel('Τιμή Αντικειμενικής Συνάρτησης f');
title('Σύγκλιση της Αντικειμενικής Συνάρτησης');
grid on;
