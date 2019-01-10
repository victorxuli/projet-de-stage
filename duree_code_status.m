function Matrice_2eme = duree_code_status(find_turbine1,Data_Parc,rang_tous_les_codes_status_sans_identique,S,double_tous_les_codes_status_sans_identique,code_status,Matrice_1er)
%% 该园区所有故障状态编码持续时间的矩阵
Matrice_2eme = zeros(rang_tous_les_codes_status_sans_identique,S.Nombre_turbine+1);
Matrice_2eme(:,1) = double_tous_les_codes_status_sans_identique;

for i = 1:S.Nombre_turbine
    [rang1,~] = size(code_status(i).status);
    double_code_status_status = str2num(char(code_status(i).status(:,1)));
    double_code_status_status_duree1 = Data_Parc.DUREE(find_turbine1(i).turbine,1);
    double_code_status_status_duree2 = double_code_status_status_duree1(code_status(i).find_code_status,1);
    for j = 1:rang_tous_les_codes_status_sans_identique
        sum1=0;
        for k = 1:rang1
            if(Matrice_1er(j,1) == double_code_status_status(k,1))
                sum1 = sum1 + double_code_status_status_duree2(k,1);
            end
        end
        Matrice_2eme(j,i+1) = sum1;
    end
end
% figure
% imagesc(Matrice_2eme(1:end,2:end));
% xlabel('numero de turbine');
% ylabel('les code status defaillance');
% title('somme duree(en jour)');
% set(gca,'Ytick',(1:rang_tous_les_codes_status_sans_identique));
% set(gca,'YTickLabel',Matrice_2eme(1:end));
end