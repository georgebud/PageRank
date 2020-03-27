% Budau George, 312CC

function [x] = SST (A, b)
% rezolvarea unui sistem superior triunghiular.

  [n n] = size(A);
  x = zeros(n, 1);
  
  for i = n : -1 : 1
    Y = A(i, i + 1 : n) * x(i + 1 : n);
    x(i) = (b(i) - Y) / A(i, i);
    endfor
    
endfunction