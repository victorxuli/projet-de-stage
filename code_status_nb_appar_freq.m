function Matrice_freq = code_status_nb_appar_freq(S,Matrice_1er_freq,code_status,Data_Parc,nombre_mois,Matrice_1er,Matrice_2eme,rang_nb_turbine,double_tous_les_codes_status_sans_identique,rang_tous_les_codes_status_sans_identique)
for i = 1 :rang_nb_turbine
    Matrice_freq(i).Matrice = zeros(rang_tous_les_codes_status_sans_identique,3);
    Matrice_freq(i).Matrice(:,1) = double_tous_les_codes_status_sans_identique;
    for j = 1 : rang_tous_les_codes_status_sans_identique
      Matrice_freq(i).Matrice(j,2) = Matrice_1er(j,i+1);
      Matrice_freq(i).Matrice(j,3) = Matrice_2eme(j,i+1);
    end
end

%% 前20个出现次数最多的code_status 的月次数矩阵
for i = 1 :rang_nb_turbine
    Matrice_freq(i).Matrice_B = sortrows(Matrice_freq(i).Matrice,-2);
    Matrice_freq(i).code_commun_B = Matrice_freq(i).Matrice_B(1:20,1);
end

for i = 1 : rang_nb_turbine
    for j = 1 :20
        Matrice_freq(i).Matrice_B_code_plus_freq(j).Matrice = zeros(2,nombre_mois+1);
        Matrice_freq(i).Matrice_B_code_plus_freq(j).Matrice(2,1) = Matrice_freq(i).code_commun_B(j,1);
        for k = 1 :nombre_mois
            Matrice_freq(i).Matrice_B_code_plus_freq(j).Matrice(1,k+1) = Data_Parc.SECONDE(1,1)+86400*30*k;
        end
    end
end

for i = 1 : rang_nb_turbine
    for j = 1:20
        for m = 1 : code_status(i).rang_new
            if(Matrice_freq(i).Matrice_B_code_plus_freq(j).Matrice(2,1) == code_status(i).new(m,1))
                if(code_status(i).new(m,2)<=Matrice_freq(i).Matrice_B_code_plus_freq(j).Matrice(1,2))
                    Matrice_freq(i).Matrice_B_code_plus_freq(j).Matrice(2,2) =  1;
                else
                    for k = 2:nombre_mois
                        if(code_status(i).new(m,2)>Matrice_freq(i).Matrice_B_code_plus_freq(j).Matrice(1,k)&&code_status(i).new(m,2)<=Matrice_freq(i).Matrice_B_code_plus_freq(j).Matrice(1,k+1))
                        Matrice_freq(i).Matrice_B_code_plus_freq(j).Matrice(2,k+1) =  1;
                        end
                    end
                end
            end
        end
    end
end


%%
c = sortrows(Matrice_1er_freq,-2);
for i = 1 : S.Nombre_turbine
    Matrice_freq(i).code_commun_sans_turbine = intersect(c(1:20,1),Matrice_1er_freq(:,1));
end

for i = 1 : rang_nb_turbine
    for j = 1 :20
        Matrice_freq(i).Matrice_C_code_plus_freq(j).Matrice = zeros(2,nombre_mois+1);
        Matrice_freq(i).Matrice_C_code_plus_freq(j).Matrice(2,1) =Matrice_freq(i).code_commun_sans_turbine(j,1);
        for k = 1 :nombre_mois
            Matrice_freq(i).Matrice_C_code_plus_freq(j).Matrice(1,k+1) = Data_Parc.SECONDE(1,1)+86400*30*k;
        end
    end
end

for i = 1 : rang_nb_turbine
    for j = 1:20
        for m = 1 : code_status(i).rang_new
            if(Matrice_freq(i).Matrice_C_code_plus_freq(j).Matrice(2,1) == code_status(i).new(m,1))
                if(code_status(i).new(m,2)<=Matrice_freq(i).Matrice_C_code_plus_freq(j).Matrice(1,2))
                    Matrice_freq(i).Matrice_C_code_plus_freq(j).Matrice(2,2) =  1;
                else
                    for k = 2:nombre_mois
                        if(code_status(i).new(m,2)>Matrice_freq(i).Matrice_C_code_plus_freq(j).Matrice(1,k)&&code_status(i).new(m,2)<=Matrice_freq(i).Matrice_C_code_plus_freq(j).Matrice(1,k+1))
                        Matrice_freq(i).Matrice_C_code_plus_freq(j).Matrice(2,k+1) =  1;
                        end
                    end
                end
            end
        end
    end
end





%%
for i = 1 : rang_nb_turbine
    Matrice_freq(i).seuil_nb = quantile(Matrice_freq(i).Matrice(1:end,2),.90);
    Matrice_freq(i).rang_seuil_nb = find(Matrice_freq(i).Matrice(1:end,2)>=Matrice_freq(i).seuil_nb);
    Matrice_freq(i).seuil_duree = quantile(Matrice_freq(i).Matrice(1:end,3),.90);
    Matrice_freq(i).rang_seuil_duree = find(Matrice_freq(i).Matrice(1:end,3)>=Matrice_freq(i).seuil_duree);
    Matrice_freq(i).rang_commun = intersect(Matrice_freq(i).rang_seuil_nb,Matrice_freq(i).rang_seuil_duree);
    [rang_rang_commun,~] = size(Matrice_freq(i).rang_commun);
    Matrice_freq(i).rang_rang_commun = rang_rang_commun;
    Matrice_freq(i).code_commun = Matrice_freq(i).Matrice(Matrice_freq(i).rang_commun,1);
end

for i = 1 : rang_nb_turbine
    for j = 1 :Matrice_freq(i).rang_rang_commun
        Matrice_freq(i).Matrice_code_plus_freq(j).Matrice = zeros(2,nombre_mois+1);
        Matrice_freq(i).Matrice_code_plus_freq(j).Matrice(2,1) = Matrice_freq(i).code_commun(j,1);
        for k = 1 :nombre_mois
            Matrice_freq(i).Matrice_code_plus_freq(j).Matrice(1,k+1) = Data_Parc.SECONDE(1,1)+86400*30*k;
        end
    end
end


for i = 1 : rang_nb_turbine
    for j = 1:Matrice_freq(i).rang_rang_commun
        for m = 1 : code_status(i).rang_new
            if(Matrice_freq(i).Matrice_code_plus_freq(j).Matrice(2,1) == code_status(i).new(m,1))
                if(code_status(i).new(m,2)<=Matrice_freq(i).Matrice_code_plus_freq(j).Matrice(1,2))
                    Matrice_freq(i).Matrice_code_plus_freq(j).Matrice(2,2) = Matrice_freq(i).Matrice_code_plus_freq(j).Matrice(2,2) + 1;
                else
                    for k = 2:nombre_mois
                        if(code_status(i).new(m,2)>Matrice_freq(i).Matrice_code_plus_freq(j).Matrice(1,k)&&code_status(i).new(m,2)<=Matrice_freq(i).Matrice_code_plus_freq(j).Matrice(1,k+1))
                        Matrice_freq(i).Matrice_code_plus_freq(j).Matrice(2,k+1) = Matrice_freq(i).Matrice_code_plus_freq(j).Matrice(2,k+1) + 1;
                        end
                    end
                end
            end
        end
    end
end

%%

for i = 1 : rang_nb_turbine
    for j = 1 :Matrice_freq(i).rang_rang_commun
        Matrice_freq(i).Matrice_code_plus_freq(j).Matrice1 = zeros(2,nombre_mois+1);
        Matrice_freq(i).Matrice_code_plus_freq(j).Matrice1(2,1) = Matrice_freq(i).code_commun(j,1);
        for k = 1 :nombre_mois
            Matrice_freq(i).Matrice_code_plus_freq(j).Matrice1(1,k+1) = Data_Parc.SECONDE(1,1)+86400*30*k;
        end
    end
end


for i = 1 : rang_nb_turbine
    for j = 1:Matrice_freq(i).rang_rang_commun
        for m = 1 : code_status(i).rang_new
            if(Matrice_freq(i).Matrice_code_plus_freq(j).Matrice1(2,1) == code_status(i).new(m,1))
                if(code_status(i).new(m,2)<=Matrice_freq(i).Matrice_code_plus_freq(j).Matrice1(1,2))
                    Matrice_freq(i).Matrice_code_plus_freq(j).Matrice1(2,2) =  1;
                else
                    for k = 2:nombre_mois
                        if(code_status(i).new(m,2)>Matrice_freq(i).Matrice_code_plus_freq(j).Matrice1(1,k)&&code_status(i).new(m,2)<=Matrice_freq(i).Matrice_code_plus_freq(j).Matrice1(1,k+1))
                        Matrice_freq(i).Matrice_code_plus_freq(j).Matrice1(2,k+1) =  1;
                        end
                    end
                end
            end
        end
    end
end






% for i = 1:rang_nb_turbine
%     for j = 1:Matrice_freq(i).rang_rang_commun
%         figure
%         imagesc(Matrice_freq(i).Matrice_code_plus_freq(j).Matrice(2,2:end));
%         s = num2str(Matrice_freq(i).Matrice_code_plus_freq(j).Matrice(2,1));
%         t = 'nombre occurence pour le code_status plus frequents et plus long turbine :';
%         t = strcat(t,num2str(i));
%         h = 'les codes status defaillance';
%         h = strcat(h,s);
%         xlabel('le temps(en mois)');
%         ylabel(h);
%         title(t);
%         set(gca,'Ytick',(1:rang_tous_les_codes_status_sans_identique));
%         set(gca,'YTickLabel',Matrice_freq(i).Matrice_code_plus_freq(j).Matrice(2,1));
%     end
% end
end