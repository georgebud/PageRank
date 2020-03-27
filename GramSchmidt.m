% Budau George, 312CC

function B = GramSchmidt(A)
% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
% Se foloseste algoritmul Gram-Schmidt modificat pentru factorizarea QR 
% Se afla cu ajutorul unui sistem superior triunghiular inversa matricii A, luand fiecare coloana in parte
% Intrari:
% -> A: matricea de inversat
% Iesiri:
% -> B: matricea A inversata

	[n n] = size(A); % dimensiunile matricii

  B = zeros(n); % initializarea matricii inversate
	I = eye(n); % matricea unitate
  Q = []; % initializare Q din factorizarea Gram-Schmidt
  
  for j = 1 : n  % se itereaza prin fiecare coloana pentru a calcula matricea ortogonala Q
    q = A(1 : n, j); % initializez cu coloana curenta din A
    aux = q; % copie
    
    for k = 1 : j - 1
      produs = sum(aux .* Q(:, k)); % se calculeaza produsul scalar
      q = q - produs * Q(1 : n, k); % se creeaza vectorul ortogonal q
    endfor
    
    q = q / norm(q); % normez vectorul q
    Q = [Q q]; % se adauga coloana q la matricea Q
  endfor
  
  R = Q' * A; % se calculeaza R din factorizarea QR = A

	% se afla inversa matricii A luand fiecare coloana in parte
	for i = 1 : n
		b = I(:, i);
		x = SST(R, Q' * b); % se afla x din calculul unui sistem superior triunghiular
		B(:, i) = x; % se adauga coloana i a matricii inversate
	endfor
  
endfunction