% Budau George, 312CC

function R = Algebraic(nume, d)
% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
% Intrari:
% -> nume: numele fisierului din care se citeste;
% -> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
% Iesiri:
% -> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

	[N A M R val1 val2] = Reading(nume); % citire din fisier

	% calcul pentru matricea M
	for i = 1 : N
		nr_leg = 0; % numarul de legaturi pentru i

		% se afla numarul de legaturi pentru fiecare nod i
		for j = 1 : N
			nr_leg += A(i,j);
		endfor;

    % se populeaza matricea M
		for j = 1 : N
			if (A(i, j) == 1) % daca i are link catre j
				M(j, i) = 1 / nr_leg;
			endif
		endfor

	endfor

	T = eye(N) - d * M; % I - d * M
	invT = GramSchmidt(T); % inversa matricii

	R = invT * ((1 - d) / N) * ones(N, 1); % calcularea indicelui PageRank dupa algoritmul Algebraic

endfunction