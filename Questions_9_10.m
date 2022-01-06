%Question 9 et 10

%On compare les temps et les taux de classification en fonction:
% Les voisinege ((R,N) = {(1,8),(2,12),(4,16)})
% mapping = {0, 'u2', 'ri', 'riu2'}

nb_bins_classique = 256;
nb_bins_u2 = 59;
nb_bins_ri = 36; 
nb_bins_riu2 = 10; 
nb_bins_classique_2_12 = 4096;
nb_bins_classique_4_16 = 65536;

%Pour Voisinage: (1,8)
disp('Taux de Lbp classique au voisinage 1,8:') 
tic
Reconnaissance_Comparaison_Q9(1,8,0,nb_bins_classique)
toc  

disp('Taux de Lbp u2 1,8:') 
tic
Reconnaissance_Comparaison_Q9(1,8,'u2', nb_bins_u2)
toc 

disp('Taux de Lbp ri au voisinage 1,8:') 
tic
Reconnaissance_Comparaison_Q9(1,8,'ri',nb_bins_ri)
toc 

disp('Taux de Lbp riu2 au voisinage 1,8:') 
tic
Reconnaissance_Comparaison_Q9(1,8,'riu2',nb_bins_riu2)
toc 

%On trouve que la méthode classique est donne les meilleurs résultats par rapport au Taux et temps
%On fixe LBP sous sa forme classique, et en fait varier les voisinages:

%Test le meilleur voisinages
disp('Taux de Lbp classique au voisinage 1,8:') 
tic
Reconnaissance_Comparaison_Q9(1,8,0,nb_bins_classique)
toc  

disp('Taux de Lbp classique au voisinage 2,12:') 
tic
Reconnaissance_Comparaison_Q9(2,12,0,nb_bins_classique_2_12)
toc  

disp('Taux de Lbp classique au voisinage 4,16:') 
tic
Reconnaissance_Comparaison_Q9(4,16,0,nb_bins_classique_4_16)
toc  


%Le taux de classification images test avec la distance euclidienne
disp('Le taux de classification images test avec l intersection histograme')
tic
Reconnaissance_Comparaison_Q9(2,12,0,nb_bins_classique_2_12)
toc

disp('Le taux de classification images test avec la distance euclidienne')
tic
Reconnaissance_Avec_Dist_Euclidienne(2,12,0,nb_bins_classique_2_12)
toc
