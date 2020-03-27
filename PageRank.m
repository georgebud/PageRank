% Budau George, 312CC

function [R1 R2] = PageRank(nume, d, eps)
% Calculeaza indicii PageRank pentru cele 2 cerinte
% Scrie fisierul de iesire nume.out
  
	[N A M R val1 val2] = Reading(nume);

	output = strcat(nume, '.out'); % se creeaza fisierul in care se scrie
	fileID = fopen(output, 'wt');

	R1 = Iterative(nume, d, eps); % vectorul PageRank conform algoritmului Iterative
	R2 = Algebraic(nume, d); % vectorul PageRank conform algoritmului Algebraic

	fprintf(fileID, '%d\n\n', N); % se scrie pe prima linie numarul de pagini analizate si se adauga un rand liber
	fprintf(fileID, '%.6f\n', R1); % se scrie vectorul R1 cu precizie de 6 zecimale 
	fprintf(fileID, '\n');
	fprintf(fileID, '%.6f\n', R2); % se scrie vectorul R2 cu precizie de 6 zecimale
	fprintf(fileID, '\n');

	PR1 = R2;
  dupR2 = R2; % duplicare vector R2
	PR1 = sort(R2, 'descend'); % sortarea vectorului PR1 in ordine descrescatoare

	tol = 0.00000000000000001; % toleranta pentru numere a caror diferenta este foarte mica
  
	% scrierea in fisier al clasamentului celor mai importante pagini
	for i = 1 : N
		fprintf(fileID, '%d ', i); % indicii in ordine

		for j = 1 : N
      % daca numerele sunt egale sau daca diferenta lor in modul este foarte mica se adauga in fisier indicele corespunzator
			if ((PR1(i) == dupR2(j)) || (abs(PR1(i) - dupR2(j) < tol)))
				fprintf(fileID, '%d ', j);
				dupR2(j) = -1; % se marcheaza pozitia j pentru a nu mai lua in cosiderare valoarea respectiva
			endif
		endfor

		u = Apartenenta(PR1(i), val1, val2);
		fprintf(fileID, '%.6f\n', u); % se scrie in fisier gradul de apartenenta
	endfor

	fclose(fileID); % inchiderea fisierului

endfunction