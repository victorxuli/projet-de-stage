function resultat1 = resultat(Matrice_1er_freq,rang_commun,S,Data_Parc,nombre_mois,rang_rang_commun,code_status,nombre_turbine)
global D;
D = Matrice_1er_freq(rang_commun,1);
for i = 1:rang_rang_commun
    resultat1(i).M = zeros(S.Nombre_turbine+1,nombre_mois+1);
    for j = 1 :nombre_mois
        resultat1(i).M(1,j+1) = Data_Parc.SECONDE(1,1)+86400*30*j;
    end
    for s = 1: S.Nombre_turbine
        for m = 1:code_status(s).rang_new
            if(D(i,1)==code_status(s).new(m,1))
                if(code_status(s).new(m,2)<=resultat1(i).M(1,2))
                    resultat1(i).M(s+1,2) = resultat1(i).M(s+1,2) + 1;
                else
                    for k = 2:nombre_mois
                        if(code_status(s).new(m,2)>resultat1(i).M(1,k)&&code_status(s).new(m,2)<=resultat1(i).M(1,k+1))
                            resultat1(i).M(s+1,k+1) = resultat1(i).M(s+1,k+1) + 1;
                        end
                    end
                end
            end
        end
    end
    E(1,1) = num2cell(D(i,1));
    E(2:1+S.Nombre_turbine,1) = nombre_turbine(:,1);
    resultat1(i).M = num2cell(resultat1(i).M);
    resultat1(i).M(1:1+S.Nombre_turbine,1) = E(1:1+S.Nombre_turbine,1);
    date = datestr(cell2mat(resultat1(i).M(1,2:end))/(24*3600));
    date = cellstr(date);
    date = date';
    resultat1(i).M(1,2:end) = date;
end