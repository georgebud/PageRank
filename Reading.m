% Budau George, 312CC

function [N A M R val1 val2] = Reading(nume)
% Functie care citeste dintr-un fisier text
% Intrari: 
% -> nume: numele fisierului din care se citeste;
% Iesiri:
% -> N: numarul de resurse web.
% -> A: matrice de adiacenta.
% -> M: matrice pentru calculul recurentei
% -> R: vector de PageRank-uri
% -> val1 : valoarea de pe penultima linie
% -> val2 : valoarea de pe ultima linie

  fileID = fopen(nume, 'rt'); % deschiderea fisierului

	N = fscanf(fileID, "%d", 1); % N resurse web
	A = zeros(N, N); % initializare matrice de adiacenta
	M = zeros(N, N); % initializare matrice pentru calculul recurentei
	R = zeros(N, 1); % vector de PageRank-uri in pasul precedent

	% se parcurge fisierul de intrare
	for i = 1 : N
		i = fscanf(fileID, "%d", 1); % nodul curent
		numar_leg = fscanf(fileID, "%d", 1); %  numarul de legaturi al nodului i
		vector_leg = fscanf(fileID, "%d", numar_leg); % se citesc legaturile nodului i
    
		for j = 1 : numar_leg
			A(i, vector_leg(j)) = 1; % creare matrice de adiacenta
		endfor

		A(i, i) = 0; % diagonala principala
	endfor

	% citirea valorilor de la sfarsit
	val1 = fscanf(fileID, "%f", 1);
	val2 = fscanf(fileID, "%f", 1);

	fclose(fileID); % inchiderea fisierului

endfunction
