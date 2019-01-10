function S = occurence_duree(S,code_status,Data_Parc,rang_tous_les_codes_status_sans_identique,nombre_mois,double_tous_les_codes_status_sans_identique)
%%

for i = 1:S.Nombre_turbine
    S.turbine1(i).occurence = zeros(rang_tous_les_codes_status_sans_identique+1,nombre_mois+2);
    S.turbine1(i).duree = zeros(rang_tous_les_codes_status_sans_identique+1,nombre_mois+1);
    S.turbine1(i).occurence(2:end,1) = double_tous_les_codes_status_sans_identique;
    S.turbine1(i).duree(2:end,1) = double_tous_les_codes_status_sans_identique;
    for j = 1 : nombre_mois
        S.turbine1(i).occurence(1,j+1) = Data_Parc.SECONDE(1,1)+86400*30*j;
        S.turbine1(i).duree(1,j+1) = Data_Parc.SECONDE(1,1)+86400*30*j;
    end
    for s = 1:rang_tous_les_codes_status_sans_identique
        for m = 1 : code_status(i).rang_new
            if(S.turbine1(i).occurence(s+1,1) == code_status(i).new(m,1))
                if(code_status(i).new(m,2)<=S.turbine1(i).occurence(1,2))
                    S.turbine1(i).occurence(s+1,2) = S.turbine1(i).occurence(s+1,2) + 1;
                    S.turbine1(i).duree(s+1,2) = S.turbine1(i).duree(s+1,2)+code_status(i).new(m,3);
                else
                    for k = 2:nombre_mois
                        if(code_status(i).new(m,2)>S.turbine1(i).occurence(1,k)&&code_status(i).new(m,2)<=S.turbine1(i).occurence(1,k+1))
                            S.turbine1(i).occurence(s+1,k+1) = S.turbine1(i).occurence(s+1,k+1) + 1;
                            S.turbine1(i).duree(s+1,k+1) = S.turbine1(i).duree(s+1,k+1) + code_status(i).new(m,3);
                        end
                    end
                end
            end
        end
        S.turbine1(i).occurence(s+1,end) = sum(S.turbine1(i).occurence(s+1,2:end-1));
    end
end
% for i = 1 :S.Nombre_turbine
%     s = num2str(i);
%     t = 'nombre apparition pour turbine :';
%     t = strcat(t,s);
%     figure
%     imagesc(S.turbine1(i).occurence(2:end,2:end));
%     xlabel('le temps(en mois)');
%     ylabel('les codes status defaillance');
%     title(t);
%     set(gca,'Ytick',(1:rang_tous_les_codes_status_sans_identique));
%     set(gca,'YTickLabel',S.turbine1(i).occurence(2:end));
% end

end