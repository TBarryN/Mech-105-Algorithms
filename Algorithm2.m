function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = [10, 2, -1; -3, -6, 2; 1, 1, 5];
n = length(A);
L = zeros(n);
U = zeros(n);
P = eye(n);
for i = 1:n
    if size(L) ~= size(A)
        error ('Matrix is not valid')
        L=NaN;
        U=NaN;
        return
    end
    [~,r] = max(abs(A(i:end,i)));
    r = n-(n-i+1)+r;
    A([i r],:) = A([r i],:);
    P([i r],:) = P([r i],:);
    L([i r],:) = L([r i],:);
        
    L(i:n,i) = A(i:n,i)/A(i,i);
    U(i,1:n) = A(i,1:n);
    A(i+1:n,1:n) = A(i+1:n,1:n) - L(i+1:n,i)*A(i,1:n);
    if size(L) ~= size(A)
        error ('Matrix is not valid')
        L=NaN;
        U=NaN;
        return
    end
end
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix


end

%% Solve the system of equations in the form A*x = b
%   10*x1 + 2*x2 - x3 = 27
%   -3*x1 - 6*x2 + 2*x3 = -61.5
%   x1 + x2 + 5*x3 = -21.5
% Set up A for the given system
A = [10, 2, -1; 
    -3, -6, 2;
    1, 1, 5];
% Set up b
b = [27; -61.5; -21.5];
% Solve for x
x = A\b;

% Test your function
[L, U, P] = luFactor(A)

% How can you test the output of your function is correct?