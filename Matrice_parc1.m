global Data_base_donnee;
global S;
clear Data_Parc;
nombre_parc = unique(Data_base_donnee.Parc);
[rang_nb_parc,~] = size(nombre_parc);
for i = 1:rang_nb_parc
    nombre_parc1(i,1) =string(nombre_parc(i,1));
    find_parc1(i).data = find(strcmp(Data_base_donnee.Parc,nombre_parc1(i,1)));
end
Data_Parc.ID = Data_base_donnee.ID(find_parc1(1).data,:);
Data_Parc.Constructeur = Data_base_donnee.Constructeur(find_parc1(1).data,:);
Data_Parc.Modele_Turbine = Data_base_donnee.Modele_Turbine(find_parc1(1).data,:);
Data_Parc.DEBUT_STATUS = Data_base_donnee.DEBUT_STATUS(find_parc1(1).data,:);
Data_Parc.FIN_STATUS = Data_base_donnee.FIN_STATUS(find_parc1(1).data,:);
Data_Parc.DUREE = Data_base_donnee.DUREE(find_parc1(1).data,:);
Data_Parc.REF_Turbine = Data_base_donnee.REF_Turbine(find_parc1(1).data,:);
Data_Parc.CODE_STATUS = Data_base_donnee.CODE_STATUS(find_parc1(1).data,:);
Data_Parc.NOM_STATUS = Data_base_donnee.NOM_STATUS(find_parc1(1).data,:);
Data_Parc.FAMILLE_ARRET_CNSTRCTR = Data_base_donnee.FAMILLE_ARRET_CNSTRCTR(find_parc1(1).data,:);
Data_Parc.FAMILLE_ARRET_VALOREM = Data_base_donnee.FAMILLE_ARRET_VALOREM(find_parc1(1).data,:);
Data_Parc.MAIN_COURANTE = Data_base_donnee.MAIN_COURANTE(find_parc1(1).data,:);
Data_Parc.GROUPE_DISPO = Data_base_donnee.GROUPE_DISPO(find_parc1(1).data,:);
Data_Parc.CODE_BRAKING_PRGRM = Data_base_donnee.CODE_BRAKING_PRGRM(find_parc1(1).data,:);
Data_Parc.NOM_BRAKING_PRGRM = Data_base_donnee.NOM_BRAKING_PRGRM(find_parc1(1).data,:);
Data_Parc.FAMILLE_CALC_MAIN_COURANTE = Data_base_donnee.FAMILLE_CALC_MAIN_COURANTE(find_parc1(1).data,:);
Data_Parc.FAMILLE_CALC_AFFECT_DATA_STATUS = Data_base_donnee.FAMILLE_CALC_AFFECT_DATA_STATUS(find_parc1(1).data,:);
Data_Parc.SECONDE = Data_base_donnee.SECONDE(find_parc1(1).data,:);
%%
nombre_turbine = unique(Data_Parc.REF_Turbine(:,1));
[rang_nb_turbine,~] = size(nombre_turbine);
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
%%
[find_turbine1,tous_les_status] = separer_status_turbine(Data_Parc);
%%
for i = 1:rang_nb_turbine
    code_status1(i).SECONDE = Data_Parc.SECONDE(find_turbine1(i).turbine,:);
end
%% 根据不同风机读分别取其所有故障DEF数据
for i = 1:rang_nb_turbine
    code_status1(i).find_code_status = find(strcmp(tous_les_status(i).M(:,2),S.status_code));
    code_status1(i).status(:,1) = find_turbine1(i).tous_les_status(code_status1(i).find_code_status,1);
    code_status1(i).status(:,2) = find_turbine1(i).tous_les_status(code_status1(i).find_code_status,2);
    code_status1(i).status(:,3) = find_turbine1(i).tous_les_status(code_status1(i).find_code_status,3);
    code_status1(i).status(:,4) = find_turbine1(i).tous_les_status(code_status1(i).find_code_status,4);
    code_status1(i).status(:,5) = find_turbine1(i).tous_les_status(code_status1(i).find_code_status,5);
end

for i=1:rang_nb_turbine
    [~,colonne_code_status_sans_identique] = unique(code_status1(i).status(:,1),'first'); 
    j = sort(colonne_code_status_sans_identique);
    code_status1(i).status_sans_identique = code_status1(i).status(j,:);
end

for i = 1:rang_nb_turbine
    kan = str2num(char(code_status1(i).status(:,1)));
    code_status1(i).new(:,1) = kan;
    code_status1(i).SECONDE1 = code_status1(i).SECONDE(code_status1(i).find_code_status,1);
    code_status1(i).new(:,2) = code_status1(i).SECONDE1;
    kan = cell2mat(code_status1(i).status(:,4));
    code_status1(i).new(:,3) = kan;
end

for i = 1:rang_nb_turbine
    [rang_code_status_new,~] = size(code_status1(i).new);
    code_status1(i).rang_new = rang_code_status_new;
end
%% matrice 1 mois

nombre_mois = ceil((Data_Parc.SECONDE(end,1) - Data_Parc.SECONDE(1,1))/(24*3600*30));
for i = 1:rang_nb_turbine
    K.turbine1(i).occurence = zeros(rang_tous_les_codes_status_sans_identique+1,nombre_mois+1);
    K.turbine1(i).duree = zeros(rang_tous_les_codes_status_sans_identique+1,nombre_mois+1);
    K.turbine1(i).occurence(2:end,1) = double_tous_les_codes_status_sans_identique;
    K.turbine1(i).duree(2:end,1) = double_tous_les_codes_status_sans_identique;
    for j = 1 : nombre_mois
        K.turbine1(i).occurence(1,j+1) = Data_Parc.SECONDE(1,1)+86400*30*j;
        K.turbine1(i).duree(1,j+1) = Data_Parc.SECONDE(1,1)+86400*30*j;
    end
    for s = 1:rang_tous_les_codes_status_sans_identique
        for m = 1 : code_status1(i).rang_new
            if(K.turbine1(i).occurence(s+1,1) == code_status1(i).new(m,1))
                if(code_status1(i).new(m,2)<=K.turbine1(i).occurence(1,2))
                    K.turbine1(i).occurence(s+1,2) = K.turbine1(i).occurence(s+1,2) + 1;
                    K.turbine1(i).duree(s+1,2) = K.turbine1(i).duree(s+1,2)+code_status1(i).new(m,3);
                else
                    for k = 2:nombre_mois
                        if(code_status1(i).new(m,2)>K.turbine1(i).occurence(1,k)&&code_status1(i).new(m,2)<=K.turbine1(i).occurence(1,k+1))
                            K.turbine1(i).occurence(s+1,k+1) = K.turbine1(i).occurence(s+1,k+1) + 1;
                            K.turbine1(i).duree(s+1,k+1) = K.turbine1(i).duree(s+1,k+1) + code_status1(i).new(m,3);
                        end
                    end
                end
            end
        end
    end
end
Matrice1_mois = K.turbine1;
%assignin('base','Matrice1_mois',S.turbine1);
clear K;

%% matrice 10 mins
dt = ceil((Data_Parc.SECONDE(end,1)-Data_Parc.SECONDE(1,1))/600);
for i = 1 : rang_nb_turbine
    turbine1_10min(i).data = zeros(rang_tous_les_codes_status_sans_identique+1,dt+1);
    turbine1_10min(i).data(2:end,1) = double_tous_les_codes_status_sans_identique;
    for j = 1:dt
        turbine1_10min(i).data(1,j+1) = Data_Parc.SECONDE(1,1)+600*j;
    end
    [rang_temps1,~] = find(cell2mat(code_status1(i).status(:,5))<=turbine1_10min(i).data(1,2));
    if(~isempty(rang_temps1))
        [rang_rang_temps1,~] = size(rang_temps1);
        for k = 2:rang_tous_les_codes_status_sans_identique+1
            for s = 1:rang_rang_temps1
                if(turbine1_10min(i).data(k,1)==str2double(code_status1(i).status(rang_temps1(s,1),1)))
                    turbine1_10min(i).data(k,2)=turbine1_10min(i).data(k,2)+1;
                end
            end
        end
    end
    for j = 2:dt
        [rang_temps1,~] = find(cell2mat(code_status1(i).status(:,5))>turbine1_10min(i).data(1,j));
        [rang_temps2,~] = find(cell2mat(code_status1(i).status(:,5))<=turbine1_10min(i).data(1,j+1));
        rang_temps = intersect(rang_temps1,rang_temps2);
        [rang_rang_temps,~] = size(rang_temps);
        if(~isempty(rang_temps))
            for k = 2:rang_tous_les_codes_status_sans_identique+1
                for s = 1:rang_rang_temps
                    if(turbine1_10min(i).data(k,1)==str2double(code_status1(i).status(rang_temps(s,1),1)))
                        turbine1_10min(i).data(k,j+1)=turbine1_10min(i).data(k,j+1)+1;
                    end
                end
            end
        end
    end
end
%assignin('base','Matrice1_mois',turbine10min);
%% matrice 1 jour
dt = ceil((Data_Parc.SECONDE(end,1)-Data_Parc.SECONDE(1,1))/(3600*24));
for i = 1 : rang_nb_turbine
    turbine_jour(i).data = zeros(rang_tous_les_codes_status_sans_identique+1,dt+1);
    turbine_jour(i).data(2:end,1) = double_tous_les_codes_status_sans_identique;
    for j = 1:dt
        turbine_jour(i).data(1,j+1) = Data_Parc.SECONDE(1,1)+(3600*24)*j;
    end
    [rang_temps1,~] = find(cell2mat(code_status1(i).status(:,5))<=turbine_jour(i).data(1,2));
    if(~isempty(rang_temps1))
        [rang_rang_temps1,~] = size(rang_temps1);
        for k = 2:rang_tous_les_codes_status_sans_identique+1
            for s = 1:rang_rang_temps1
                if(turbine_jour(i).data(k,1)==str2double(code_status1(i).status(rang_temps1(s,1),1)))
                    turbine_jour(i).data(k,2)=turbine_jour(i).data(k,2)+1;
                end
            end
        end
    end
    for j = 2:dt
        [rang_temps1,~] = find(cell2mat(code_status1(i).status(:,5))>turbine_jour(i).data(1,j));
        [rang_temps2,~] = find(cell2mat(code_status1(i).status(:,5))<=turbine_jour(i).data(1,j+1));
        rang_temps = intersect(rang_temps1,rang_temps2);
        [rang_rang_temps,~] = size(rang_temps);
        if(~isempty(rang_temps))
            for k = 2:rang_tous_les_codes_status_sans_identique+1
                for s = 1:rang_rang_temps
                    if(turbine_jour(i).data(k,1)==str2double(code_status1(i).status(rang_temps(s,1),1)))
                        turbine_jour(i).data(k,j+1)=turbine_jour(i).data(k,j+1)+1;
                    end
                end
            end
        end
    end
end
Matrice1_jour = turbine_jour;
save(nombre_parc1(1),'turbine1_10min','Matrice1_mois','Matrice1_jour');