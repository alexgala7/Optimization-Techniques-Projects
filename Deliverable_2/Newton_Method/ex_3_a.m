e = 0.001;
nn = 100000;
gamma = 0.5;
X = NaN * ones(nn, 1);
Y = NaN * ones(nn, 1);
D = NaN * ones(nn, 2);
F = NaN * ones(nn, 1);
Hessians = cell(nn, 1);
X(1,1) = -1;
Y(1,1) = 1;
F(1, 1) = f(X(1,1), Y(1,1));
for i=1:nn
    if norm(compute_gradient(X(i,1), Y(i,1)))<e
    break;
    else 
        H = compute_hessian(X(i,1), Y(i,1));
        Hessians{i} = H;
        inv_hes = inv(compute_hessian(X(i,1), Y(i,1)));
        inv_hes_1 = inv_hes(1, :);
        inv_hes_2 = inv_hes(2, :);
        D(i,1) = -(inv_hes_1) * compute_gradient(X(i,1), Y(i,1))';
        D(i,2) = -(inv_hes_2) * compute_gradient(X(i,1), Y(i,1))';
        X(i+1, 1) = X(i,1) + gamma * D(i,1);
        Y(i+1, 1) = Y(i,1) + gamma * D(i,2);
        F(i+1, 1) = f(X(i+1, 1), Y(i+1, 1));

    end
end

fprintf(['Το ολικό ελάχιστο της συνάρτησης f χρησιμοποιώντας τη μέθοδο\n' ...
    'Newton, με σταθερό βήμα %.2f και σημείο εκκίνησης του\n' ...
    'αλγορίθμου το (%.2f, %.2f) είναι το %.4f και βρέθηκε σε %d επαναλήψεις.\n'], ...
    gamma, X(1,1), Y(1,1), f(X(i,1), Y(i,1)), i-1);
