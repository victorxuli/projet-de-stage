function Matrice_2eme_pourcentage = Durree_pourcentage(rang_tous_les_codes_status_sans_identique,S,double_tous_les_codes_status_sans_identique,Matrice_2eme)
Matrice_2eme_pourcentage = zeros(rang_tous_les_codes_status_sans_identique,S.Nombre_turbine+1);
Matrice_2eme_pourcentage(:,1) = double_tous_les_codes_status_sans_identique;
for i = 1:S.Nombre_turbine
    for j = 1:rang_tous_les_codes_status_sans_identique
        Matrice_2eme_pourcentage(j,i+1) = Matrice_2eme(j,i+1)/sum(Matrice_2eme(j,2:end));
    end
end