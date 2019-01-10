function [Matrice_1er_freq,rang_seuil_nb,rang_commun] = somme_duree(Matrice_2eme,rang_tous_les_codes_status_sans_identique,double_tous_les_codes_status_sans_identique,Matrice_1er)
%% 该园区所有故障状态编码持续时间的矩阵
Matrice_1er_freq = zeros(rang_tous_les_codes_status_sans_identique,3);
Matrice_1er_freq(:,1) = double_tous_les_codes_status_sans_identique;
for i = 1 : rang_tous_les_codes_status_sans_identique
    add = sum(Matrice_1er(i,2:end));
    Matrice_1er_freq(i,2) = add;
end
seuil_nb = quantile(Matrice_1er_freq(1:end,2),.90);
rang_seuil_nb = find(Matrice_1er_freq(1:end,2)>=seuil_nb);
for i = 1 : rang_tous_les_codes_status_sans_identique
    add = sum(Matrice_2eme(i,2:end));
    Matrice_1er_freq(i,3) = add;
end
seuil_duree = quantile(Matrice_1er_freq(1:end,3),.90);
rang_seuil_duree = find(Matrice_1er_freq(1:end,3)>=seuil_duree);

rang_commun = intersect(rang_seuil_nb,rang_seuil_duree);
end