# Analiza-de-corelatie

Datele de Identificare și Validare:

Se încarcă datele de identificare (id) și datele de validare (val) din fișierul lab5_1.mat.
Se elimină trendul din date pentru a evita influența componentelor continue.
Se normalizează datele prin scăderea mediei.
Se trasează seriile temporale ale datelor de identificare și de validare pentru a vizualiza comportamentul acestora.

Calculul Coeficienților FIR pentru Diverse Valori ale lui M:

Se alege o serie de valori pentru M (ordinea filtrului FIR).
Pentru fiecare valoare M, se calculează autocorelația și cross-corelația dintre semnalele de intrare și ieșire.
Se construiește matricea sistemului de regresori în medie zero (funcția FIR) și se calculează coeficienții FIR (h) prin rezolvarea unui sistem de ecuații liniare.
Se efectuează convoluția dintre semnalul de intrare de validare și coeficienții FIR pentru a obține semnalul estimat.
Se calculează și se afișează eroarea medie pătratică (MSE) între semnalul real și cel estimat pentru fiecare valoare a lui M.

Calculul MSE pentru Diferite Valori ale lui M:
Se alege o serie de valori pentru M.
Se repetă același proces ca mai sus pentru a calcula și compara MSE-urile între datele de identificare și cele de validare pentru diferite valori ale lui M.
Se trasează un grafic pentru a vizualiza cum se schimbă MSE în funcție de ordinea filtrului FIR.

Funcția FIR:
Se definește o funcție FIR care construiește matricea sistemului liniar de regresori în medie zero.
Această funcție FIR este utilizată pentru a construi matricea sistemului liniar de regresori pentru metoda FIR. 
Această abordare se bazează pe corelații și coeficienții FIR pentru a estima caracteristicile sistemului.





