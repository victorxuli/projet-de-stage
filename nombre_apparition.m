function [Matrice_1er,Matrice_1er_pourcentage,double_tous_les_codes_status_sans_identique,rang_tous_les_codes_status_sans_identique] = nombre_apparition(Data_Parc,S,code_status)
%%
find_status = find(strcmp(Data_Parc.FAMILLE_ARRET_CNSTRCTR,S.status_code));
data_def(:,1) = Data_Parc.CODE_STATUS(find_status,1);
data_def(:,2) = num2cell(Data_Parc.DUREE(find_status,1));
[~,cd] = unique(Data_Parc.CODE_STATUS(find_status,1),'first'); 
j = sort(cd);
tous_les_codes_status_sans_identique_code = data_def(j,1);
tous_les_codes_status_sans_identique_duree = data_def(j,2);
double_tous_les_codes_status_sans_identique = str2num(char(tous_les_codes_status_sans_identique_code));
%double_tous_les_codes_status_sans_identique_duree = str2num(char(tous_les_codes_status_sans_identique_duree));
[rang_tous_les_codes_status_sans_identique,~] = size(double_tous_les_codes_status_sans_identique);


Matrice_1er = zeros(rang_tous_les_codes_status_sans_identique,S.Nombre_turbine+1);
Matrice_1er(:,1) = double_tous_les_codes_status_sans_identique;

for i = 1:S.Nombre_turbine
    [rang1,~] = size(code_status(i).status);
    double_code_status_status = str2num(char(code_status(i).status(:,1)));
    for j = 1:rang_tous_les_codes_status_sans_identique
        sum1=0;
        for k = 1:rang1
            if(Matrice_1er(j,1) == double_code_status_status(k,1))
                sum1 = sum1+1;
            end
        end
        Matrice_1er(j,i+1) = sum1;
    end
end

% figure
% imagesc(Matrice_1er(1:end,2:end));
% xlabel('numero de turbine');
% ylabel('les code status defaillance');
% title('nombre apparition');
% set(gca,'Ytick',(1:rang_tous_les_codes_status_sans_identique));
% set(gca,'YTickLabel',Matrice_1er(1:end));

Matrice_1er_pourcentage = zeros(rang_tous_les_codes_status_sans_identique,S.Nombre_turbine+1);
Matrice_1er_pourcentage(:,1) = double_tous_les_codes_status_sans_identique;
for i = 1:S.Nombre_turbine
    for j = 1:rang_tous_les_codes_status_sans_identique
        Matrice_1er_pourcentage(j,i+1) = Matrice_1er(j,i+1)/sum(Matrice_1er(j,2:end));
    end
end
% figure
% imagesc(Matrice_1er_pourcentage(1:end,2:end));
% xlabel('numero de turbine');
% ylabel('les code status defaillance');
% title('pourcentage de nombre apparition par rapport aux turbine');
% set(gca,'Ytick',(1:rang_tous_les_codes_status_sans_identique));
% set(gca,'YTickLabel',Matrice_1er(1:end));
end