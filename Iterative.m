% Budau George, 312CC

function R = Iterative(nume, d, eps)
% Functia care calculeaza matricea R folosind algoritmul iterativ.
% Intrari:
% -> nume: numele fisierului din care se citeste;
% -> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
% -> eps: eroarea care apare in algoritm.
% Iesiri:
% -> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

	[N A M R val1 val2] = Reading(nume); % citire din fisier
	R_curent = R; % vectorul de PageRank-uri la pasul curent

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

	for i = 1 : N
		R(i) = 1 / N; % primul pas
	endfor

	while(1) % calcularea indicelui PageRank prin algoritmul Iterative dupa forma matriceala
		R_curent = d * M * R + ((1 - d) / N) * ones(N, 1);

		if (norm(R_curent - R) < eps) % conditia de oprire
			break;
		endif

		R = R_curent; % actualizare indice PageRank al resursei R
	endwhile
  
endfunction