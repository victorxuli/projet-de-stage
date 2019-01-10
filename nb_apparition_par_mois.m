function [Matrice_4eme,nombre_mois,rang_rang_commun] = nb_apparition_par_mois(Matrice_2eme,Data_Parc,find_status,rang_commun)
%% Matrice_4eme 出现故障次数较多的状态编码的矩阵（每个月的故障次数）
new(:,1) = Data_Parc.CODE_STATUS(find_status,1);
new = str2num(char(new));
new(:,2) = Data_Parc.SECONDE(find_status,1);
[rang_new,~] = size(new);
nombre_mois = ceil((Data_Parc.SECONDE(end,1) - Data_Parc.SECONDE(1,1))/(24*3600*30));

[rang_rang_commun,~] = size(rang_commun);
code_commun = Matrice_2eme(rang_commun,1);
for i = 1 : rang_rang_commun
    Matrice_4eme(i).Matrice = zeros(2,nombre_mois+1);
    Matrice_4eme(i).Matrice(2,1) = code_commun(i,1);
     for j = 1:nombre_mois
        Matrice_4eme(i).Matrice(1,j+1) = Data_Parc.SECONDE(1,1)+86400*30*j;
    end
end

for i = 1:rang_rang_commun
    for j = 1 : rang_new
        if(Matrice_4eme(i).Matrice(2,1) == new(j,1))
            if(new(j,2)<=Matrice_4eme(i).Matrice(1,2))
                Matrice_4eme(i).Matrice(2,2) = Matrice_4eme(i).Matrice(2,2) + 1;
            else
                for k = 2:nombre_mois
                    if(new(j,2)>Matrice_4eme(i).Matrice(1,k)&&new(j,2)<=Matrice_4eme(i).Matrice(1,k+1))
                    Matrice_4eme(i).Matrice(2,k+1) = Matrice_4eme(i).Matrice(2,k+1) + 1;
                    end
                end
            end
        end
    end
end