tic
clear all;
% ��ȡexcel�ļ��� Data_base_donnee
S.Nom_du_fichier = input('quel est le nom du fichier :','s');
Data_base_donnee = import_fichier(S.Nom_du_fichier);
toc
find_status = "DEF";
[ab,~] = find(strcmp(Data_base_donnee.FAMILLE_ARRET_CNSTRCTR,'DEF'));
code_status_defaillance = Data_base_donnee.CODE_STATUS(ab);
[~,cd] = unique(code_status_defaillance,'first'); 
p = sort(cd);
code_status_defaillance_sans_identique = code_status_defaillance(p);
double_code_status_defaillance_sans_identique = str2num(char(code_status_defaillance_sans_identique));
double_code_status_defaillance_sans_identique(:,2) = 1;
[ef,~] = find(double_code_status_defaillance_sans_identique(:,1)==455);
double_code_status_defaillance_sans_identique(ef,2) = 0;
cell_code_status_defaillance_sans_identique = num2cell(double_code_status_defaillance_sans_identique);
xlswrite('code_status',cell_code_status_defaillance_sans_identique,'code_status','A1');

%%
codestatus = xlsread('code_status');
[gh,~] = find(codestatus(:,2) ==0);
[ij,~] = find(strcmp(string(Data_base_donnee.CODE_STATUS),string(codestatus(gh,1))));

Data_base_donnee.ID(ij)=[];
Data_base_donnee.Parc(ij)=[];
Data_base_donnee.Constructeur(ij)=[];
Data_base_donnee.Modele_Turbine(ij)=[];
Data_base_donnee.DEBUT_STATUS(ij)=[];
Data_base_donnee.FIN_STATUS(ij)=[];
Data_base_donnee.DUREE(ij)=[];
Data_base_donnee.REF_Turbine(ij)=[];
Data_base_donnee.CODE_STATUS(ij)=[];
Data_base_donnee.NOM_STATUS(ij)=[];
Data_base_donnee.FAMILLE_ARRET_CNSTRCTR(ij)=[];
Data_base_donnee.FAMILLE_ARRET_VALOREM(ij)=[];
Data_base_donnee.MAIN_COURANTE(ij)=[];
Data_base_donnee.GROUPE_DISPO(ij)=[];
Data_base_donnee.CODE_BRAKING_PRGRM(ij)=[];
Data_base_donnee.NOM_BRAKING_PRGRM(ij)=[];
Data_base_donnee.FAMILLE_CALC_MAIN_COURANTE(ij)=[];
Data_base_donnee.FAMILLE_CALC_AFFECT_DATA_STATUS(ij)=[];
Data_base_donnee.SECONDE(ij)=[];

%% melanger 2 parc
parc = {"AIRAINES";"CHALEONS"};
parc = string(parc);
[tt,~] = size(parc);
for i = 1:tt
    [~,colonne] = ismember(Data_base_donnee.Parc,parc(i));
    if(i==1)
        t = colonne;
    else
        t = t+colonne;
    end
end
[rang,~] = find(t==1);

Data_Parc1.ID = Data_base_donnee.ID(rang,:);
Data_Parc1.Parc = Data_base_donnee.Parc(rang,:);
Data_Parc1.Constructeur = Data_base_donnee.Constructeur(rang,:);
Data_Parc1.Modele_Turbine = Data_base_donnee.Modele_Turbine(rang,:);
Data_Parc1.DEBUT_STATUS = Data_base_donnee.DEBUT_STATUS(rang,:);
Data_Parc1.FIN_STATUS = Data_base_donnee.FIN_STATUS(rang,:);
Data_Parc1.DUREE = Data_base_donnee.DUREE(rang,:);
Data_Parc1.REF_Turbine = Data_base_donnee.REF_Turbine(rang,:);
Data_Parc1.CODE_STATUS = Data_base_donnee.CODE_STATUS(rang,:);
Data_Parc1.NOM_STATUS = Data_base_donnee.NOM_STATUS(rang,:);
Data_Parc1.FAMILLE_ARRET_CNSTRCTR = Data_base_donnee.FAMILLE_ARRET_CNSTRCTR(rang,:);
Data_Parc1.FAMILLE_ARRET_VALOREM = Data_base_donnee.FAMILLE_ARRET_VALOREM(rang,:);
Data_Parc1.MAIN_COURANTE = Data_base_donnee.MAIN_COURANTE(rang,:);
Data_Parc1.GROUPE_DISPO = Data_base_donnee.GROUPE_DISPO(rang,:);
Data_Parc1.CODE_BRAKING_PRGRM = Data_base_donnee.CODE_BRAKING_PRGRM(rang,:);
Data_Parc1.NOM_BRAKING_PRGRM = Data_base_donnee.NOM_BRAKING_PRGRM(rang,:);
Data_Parc1.FAMILLE_CALC_MAIN_COURANTE = Data_base_donnee.FAMILLE_CALC_MAIN_COURANTE(rang,:);
Data_Parc1.FAMILLE_CALC_AFFECT_DATA_STATUS = Data_base_donnee.FAMILLE_CALC_AFFECT_DATA_STATUS(rang,:);
Data_Parc1.SECONDE = Data_base_donnee.SECONDE(rang,:);
[v,~] = find(strcmp(Data_Parc1.FAMILLE_ARRET_CNSTRCTR,find_status));
code_status_defaillance1 = Data_Parc1.CODE_STATUS(v);
double_code_status_defaillance1 = str2num(char(code_status_defaillance1));
[rang_double_code_status_defaillance1,~] = size(double_code_status_defaillance1);
[~,l] = unique(code_status_defaillance1,'first'); 
pl= sort(l);
code_status_defaillance1_sans_identique = code_status_defaillance1(pl);
double_code_status_defaillance1_sans_identique = str2num(char(code_status_defaillance1_sans_identique));
[rang_code_status_defaillance1_sans_identique,~] = size(double_code_status_defaillance1_sans_identique);
Matrice_1er = zeros(rang_code_status_defaillance1_sans_identique,2);
Matrice_1er(:,1) = double_code_status_defaillance1_sans_identique;
for i = 1 :rang_code_status_defaillance1_sans_identique
    for j = 1 :rang_double_code_status_defaillance1
        if(Matrice_1er(i,1)==double_code_status_defaillance1(j,1))
            Matrice_1er(i,2) = Matrice_1er(i,2)+1;
        end
    end
end
B = sortrows(Matrice_1er,-2);
figure;
name = B(1:20,1);
name = num2str(name);
name = cellstr(name);
pareto(B(1:20,2),name);
title('code status defaillance plus frequents dans le parc AIRAINES ET CHALEONS');
xlabel('code status defaillance');
ylabel('nombre occurrence');
%%
p=1;
parc = {"AIRAINES";"CHALEONS"};
parc = string(parc);
[~,colonne] = ismember(Data_base_donnee.Parc,parc(p));
[rang,~] = find(colonne==1);
Data_Parc(p).ID = Data_base_donnee.ID(rang,:);
Data_Parc(p).Parc = Data_base_donnee.Parc(rang,:);
Data_Parc(p).Constructeur = Data_base_donnee.Constructeur(rang,:);
Data_Parc(p).Modele_Turbine = Data_base_donnee.Modele_Turbine(rang,:);
Data_Parc(p).DEBUT_STATUS = Data_base_donnee.DEBUT_STATUS(rang,:);
Data_Parc(p).FIN_STATUS = Data_base_donnee.FIN_STATUS(rang,:);
Data_Parc(p).DUREE = Data_base_donnee.DUREE(rang,:);
Data_Parc(p).REF_Turbine = Data_base_donnee.REF_Turbine(rang,:);
Data_Parc(p).CODE_STATUS = Data_base_donnee.CODE_STATUS(rang,:);
Data_Parc(p).NOM_STATUS = Data_base_donnee.NOM_STATUS(rang,:);
Data_Parc(p).FAMILLE_ARRET_CNSTRCTR = Data_base_donnee.FAMILLE_ARRET_CNSTRCTR(rang,:);
Data_Parc(p).FAMILLE_ARRET_VALOREM = Data_base_donnee.FAMILLE_ARRET_VALOREM(rang,:);
Data_Parc(p).MAIN_COURANTE = Data_base_donnee.MAIN_COURANTE(rang,:);
Data_Parc(p).GROUPE_DISPO = Data_base_donnee.GROUPE_DISPO(rang,:);
Data_Parc(p).CODE_BRAKING_PRGRM = Data_base_donnee.CODE_BRAKING_PRGRM(rang,:);
Data_Parc(p).NOM_BRAKING_PRGRM = Data_base_donnee.NOM_BRAKING_PRGRM(rang,:);
Data_Parc(p).FAMILLE_CALC_MAIN_COURANTE = Data_base_donnee.FAMILLE_CALC_MAIN_COURANTE(rang,:);
Data_Parc(p).FAMILLE_CALC_AFFECT_DATA_STATUS = Data_base_donnee.FAMILLE_CALC_AFFECT_DATA_STATUS(rang,:);
Data_Parc(p).SECONDE = Data_base_donnee.SECONDE(rang,:);

nombre_turbine(p).data = unique(Data_Parc(p).REF_Turbine);
[rang_nb_turbine(p).data,~] = size(nombre_turbine(p).data);
for i = 1:rang_nb_turbine(p).data
    find_turbine1(p).turbine(i).turbine = find(strcmp(Data_Parc(p).REF_Turbine,nombre_turbine(p).data(i)));
    find_turbine1(p).turbine(i).tous_les_status(:,1) = Data_Parc(p).CODE_STATUS(find_turbine1(p).turbine(i).turbine,:);
    find_turbine1(p).turbine(i).tous_les_status(:,2) = Data_Parc(p).NOM_STATUS(find_turbine1(p).turbine(i).turbine,:);
    find_turbine1(p).turbine(i).tous_les_status(:,3) = Data_Parc(p).FAMILLE_ARRET_CNSTRCTR(find_turbine1(p).turbine(i).turbine,:); 
    find_turbine1(p).turbine(i).tous_les_status(:,4) = num2cell(Data_Parc(p).DUREE(find_turbine1(p).turbine(i).turbine,:)); 
    find_turbine1(p).turbine(i).tous_les_status(:,5) = num2cell(Data_Parc(p).SECONDE(find_turbine1(p).turbine(i).turbine,:));
    tous_les_status(p).turbine(i).M(:,1) = Data_Parc(p).CODE_STATUS(find_turbine1(p).turbine(i).turbine,:);
    tous_les_status(p).turbine(i).M(:,2) = Data_Parc(p).FAMILLE_ARRET_CNSTRCTR(find_turbine1(p).turbine(i).turbine,:);
    tous_les_status(p).turbine(i).M(:,3) = Data_Parc(p).DEBUT_STATUS(find_turbine1(p).turbine(i).turbine,:);
    tous_les_status(p).turbine(i).M(:,4) = num2cell(Data_Parc(p).SECONDE(find_turbine1(p).turbine(i).turbine,:));
    tous_les_status(p).turbine(i).M(:,5) = num2cell(Data_Parc(p).DUREE(find_turbine1(p).turbine(i).turbine,:)); 
end
S.status_code = find_status;
for i = 1:rang_nb_turbine(p).data
    code_status(p).find_code_status(i).data = find(strcmp(tous_les_status(p).turbine(i).M(:,2),S.status_code));
    code_status(p).status(i).status(:,1) = find_turbine1(p).turbine(i).tous_les_status(code_status(p).find_code_status(i).data,1);
    code_status(p).status(i).status(:,2) = find_turbine1(p).turbine(i).tous_les_status(code_status(p).find_code_status(i).data,2);
    code_status(p).status(i).status(:,3) = find_turbine1(p).turbine(i).tous_les_status(code_status(p).find_code_status(i).data,3);
    code_status(p).status(i).status(:,4) = find_turbine1(p).turbine(i).tous_les_status(code_status(p).find_code_status(i).data,4);
    code_status(p).status(i).status(:,5) = find_turbine1(p).turbine(i).tous_les_status(code_status(p).find_code_status(i).data,5);
    [code_status(p).status(i).rang,~] = size(code_status(p).status(i).status);
end
for i = 1:rang_nb_turbine(p).data
    code_status(p).SECONDE(i).SECONDE = Data_Parc(p).SECONDE(find_turbine1(p).turbine(i).turbine,:);
end
for i = 1:rang_nb_turbine(p).data
    kan = str2num(char(code_status(p).status(i).status(:,1)));
    code_status(p).new(i).new(:,1) = kan;
    code_status(p).SECONDE1(i).SECONDE1= code_status(p).SECONDE(i).SECONDE(code_status(p).find_code_status(i).data,1);
    code_status(p).new(i).new(:,2) = code_status(p).SECONDE1(i).SECONDE1;
    kan = cell2mat(code_status(p).status(i).status(:,4));
    code_status(p).new(i).new(:,3) = kan;
end
%%%%%%%%%%%%%%%%%%%%%%%
[~,colonne] = ismember(Data_base_donnee.Parc,parc(p+1));
[rang,~] = find(colonne==1);
Data_Parc(p+1).ID = Data_base_donnee.ID(rang,:);
Data_Parc(p+1).Parc = Data_base_donnee.Parc(rang,:);
Data_Parc(p+1).Constructeur = Data_base_donnee.Constructeur(rang,:);
Data_Parc(p+1).Modele_Turbine = Data_base_donnee.Modele_Turbine(rang,:);
Data_Parc(p+1).DEBUT_STATUS = Data_base_donnee.DEBUT_STATUS(rang,:);
Data_Parc(p+1).FIN_STATUS = Data_base_donnee.FIN_STATUS(rang,:);
Data_Parc(p+1).DUREE = Data_base_donnee.DUREE(rang,:);
Data_Parc(p+1).REF_Turbine = Data_base_donnee.REF_Turbine(rang,:);
Data_Parc(p+1).CODE_STATUS = Data_base_donnee.CODE_STATUS(rang,:);
Data_Parc(p+1).NOM_STATUS = Data_base_donnee.NOM_STATUS(rang,:);
Data_Parc(p+1).FAMILLE_ARRET_CNSTRCTR = Data_base_donnee.FAMILLE_ARRET_CNSTRCTR(rang,:);
Data_Parc(p+1).FAMILLE_ARRET_VALOREM = Data_base_donnee.FAMILLE_ARRET_VALOREM(rang,:);
Data_Parc(p+1).MAIN_COURANTE = Data_base_donnee.MAIN_COURANTE(rang,:);
Data_Parc(p+1).GROUPE_DISPO = Data_base_donnee.GROUPE_DISPO(rang,:);
Data_Parc(p+1).CODE_BRAKING_PRGRM = Data_base_donnee.CODE_BRAKING_PRGRM(rang,:);
Data_Parc(p+1).NOM_BRAKING_PRGRM = Data_base_donnee.NOM_BRAKING_PRGRM(rang,:);
Data_Parc(p+1).FAMILLE_CALC_MAIN_COURANTE = Data_base_donnee.FAMILLE_CALC_MAIN_COURANTE(rang,:);
Data_Parc(p+1).FAMILLE_CALC_AFFECT_DATA_STATUS = Data_base_donnee.FAMILLE_CALC_AFFECT_DATA_STATUS(rang,:);
Data_Parc(p+1).SECONDE = Data_base_donnee.SECONDE(rang,:);
%%%%%

% find_status1(p).data = find(strcmp(Data_Parc(p).FAMILLE_ARRET_CNSTRCTR,S.status_code));
% data_def(p).data(:,1) = Data_Parc(p).CODE_STATUS(find_status1(p).data,1);
% data_def(p).data(:,2) = num2cell(Data_Parc(p).DUREE(find_status1(p).data,1));
% [~,cd] = unique(Data_Parc(p).CODE_STATUS(find_status1(p).data,1),'first'); 
% j = sort(cd);
% tous_les_codes_status_sans_identique_code(p).data = data_def(p).data(j,1);
% tous_les_codes_status_sans_identique_duree(p).data = data_def(p).data(j,2); %
% double_tous_les_codes_status_sans_identique = str2num(char(tous_les_codes_status_sans_identique_code));
% %double_tous_les_codes_status_sans_identique_duree = str2num(char(tous_les_codes_status_sans_identique_duree));
% [rang_tous_les_codes_status_sans_identique,~] = size(double_tous_les_codes_status_sans_identique);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nombre_turbine(p+1).data = unique(Data_Parc(p+1).REF_Turbine);
[rang_nb_turbine(p+1).data,~] = size(nombre_turbine(p+1).data);
for i = 1:rang_nb_turbine(p+1).data
    find_turbine1(p+1).turbine(i).turbine = find(strcmp(Data_Parc(p+1).REF_Turbine,nombre_turbine(p+1).data(i)));
    find_turbine1(p+1).turbine(i).tous_les_status(:,1) = Data_Parc(p+1).CODE_STATUS(find_turbine1(p+1).turbine(i).turbine,:);
    find_turbine1(p+1).turbine(i).tous_les_status(:,2) = Data_Parc(p+1).NOM_STATUS(find_turbine1(p+1).turbine(i).turbine,:);
    find_turbine1(p+1).turbine(i).tous_les_status(:,3) = Data_Parc(p+1).FAMILLE_ARRET_CNSTRCTR(find_turbine1(p+1).turbine(i).turbine,:); 
    find_turbine1(p+1).turbine(i).tous_les_status(:,4) = num2cell(Data_Parc(p+1).DUREE(find_turbine1(p+1).turbine(i).turbine,:)); 
    find_turbine1(p+1).turbine(i).tous_les_status(:,5) = num2cell(Data_Parc(p+1).SECONDE(find_turbine1(p+1).turbine(i).turbine,:));
    tous_les_status(p+1).turbine(i).M(:,1) = Data_Parc(p+1).CODE_STATUS(find_turbine1(p+1).turbine(i).turbine,:);
    tous_les_status(p+1).turbine(i).M(:,2) = Data_Parc(p+1).FAMILLE_ARRET_CNSTRCTR(find_turbine1(p+1).turbine(i).turbine,:);
    tous_les_status(p+1).turbine(i).M(:,3) = Data_Parc(p+1).DEBUT_STATUS(find_turbine1(p+1).turbine(i).turbine,:);
    tous_les_status(p+1).turbine(i).M(:,4) = num2cell(Data_Parc(p+1).SECONDE(find_turbine1(p+1).turbine(i).turbine,:));
    tous_les_status(p+1).turbine(i).M(:,5) = num2cell(Data_Parc(p+1).DUREE(find_turbine1(p+1).turbine(i).turbine,:)); 
end

for i = 1:rang_nb_turbine(p+1).data
    code_status(p+1).find_code_status(i).data = find(strcmp(tous_les_status(p+1).turbine(i).M(:,2),S.status_code));
    code_status(p+1).status(i).status(:,1) = find_turbine1(p+1).turbine(i).tous_les_status(code_status(p+1).find_code_status(i).data,1);
    code_status(p+1).status(i).status(:,2) = find_turbine1(p+1).turbine(i).tous_les_status(code_status(p+1).find_code_status(i).data,2);
    code_status(p+1).status(i).status(:,3) = find_turbine1(p+1).turbine(i).tous_les_status(code_status(p+1).find_code_status(i).data,3);
    code_status(p+1).status(i).status(:,4) = find_turbine1(p+1).turbine(i).tous_les_status(code_status(p+1).find_code_status(i).data,4);
    code_status(p+1).status(i).status(:,5) = find_turbine1(p+1).turbine(i).tous_les_status(code_status(p+1).find_code_status(i).data,5);
    [code_status(p+1).status(i).rang,~] = size(code_status(p+1).status(i).status);
end
for i = 1:rang_nb_turbine(p+1).data
    code_status(p+1).SECONDE(i).SECONDE = Data_Parc(p+1).SECONDE(find_turbine1(p+1).turbine(i).turbine,:);
end
for i = 1:rang_nb_turbine(p+1).data
    kan = str2num(char(code_status(p+1).status(i).status(:,1)));
    code_status(p+1).new(i).new(:,1) = kan;
    code_status(p+1).SECONDE1(i).SECONDE1= code_status(p+1).SECONDE(i).SECONDE(code_status(p+1).find_code_status(i).data,1);
    code_status(p+1).new(i).new(:,2) = code_status(p+1).SECONDE1(i).SECONDE1;
    kan = cell2mat(code_status(p+1).status(i).status(:,4));
    code_status(p+1).new(i).new(:,3) = kan;
end

periode_jour(p).data = ceil((Data_Parc(p).SECONDE(end,1) - Data_Parc(p).SECONDE(1,1))/(60*60*24));
periode_jour(p+1).data = ceil((Data_Parc(p+1).SECONDE(end,1) - Data_Parc(p+1).SECONDE(1,1))/(60*60*24));



Matrice_nb = zeros(rang_code_status_defaillance1_sans_identique,rang_nb_turbine(p).data+rang_nb_turbine(p+1).data+1);
Matrice_nb(:,1) = double_code_status_defaillance1_sans_identique;
for i = 1 : rang_nb_turbine(p).data
    for j = 1 :rang_code_status_defaillance1_sans_identique
        for k = 1 :code_status(p).status(i).rang
            if(Matrice_nb(j,1)==str2num(char(code_status(p).status(i).status(k,1))))
                Matrice_nb(j,i+1) = Matrice_nb(j,i+1)+1;
            end
        end
    end
end

for i = 1+rang_nb_turbine(p).data : (rang_nb_turbine(p).data + rang_nb_turbine(p+1).data)
    for j = 1 :rang_code_status_defaillance1_sans_identique
        for k = 1 :code_status(p+1).status(i-rang_nb_turbine(p).data).rang
            if(Matrice_nb(j,1)==str2num(char(code_status(p+1).status(i-rang_nb_turbine(p).data).status(k,1))))
                Matrice_nb(j,i+1) = Matrice_nb(j,i+1)+1;
            end
        end
    end
end



Matrice_nb = zeros(rang_code_status_defaillance1_sans_identique,rang_nb_turbine(p).data+rang_nb_turbine(p+1).data+1);
Matrice_nb(:,1) = double_code_status_defaillance1_sans_identique;
for i = 1 : rang_nb_turbine(p).data
    for j = 1 :rang_code_status_defaillance1_sans_identique
        for k = 1 :code_status(p).status(i).rang
            if(Matrice_nb(j,1)==str2num(char(code_status(p).status(i).status(k,1))))
                Matrice_nb(j,i+1) = Matrice_nb(j,i+1)+1;
            end
        end
        Matrice_nb(j,i+1) = Matrice_nb(j,i+1)/periode_jour(p).data;
    end
end

for i = 1+rang_nb_turbine(p).data : (rang_nb_turbine(p).data + rang_nb_turbine(p+1).data)
    for j = 1 :rang_code_status_defaillance1_sans_identique
        for k = 1 :code_status(p+1).status(i-rang_nb_turbine(p).data).rang
            if(Matrice_nb(j,1)==str2num(char(code_status(p+1).status(i-rang_nb_turbine(p).data).status(k,1))))
                Matrice_nb(j,i+1) = Matrice_nb(j,i+1)+1;
            end
        end
        Matrice_nb(j,i+1) = Matrice_nb(j,i+1)/periode_jour(p+1).data;
    end
end

for i = 1 : rang_code_status_defaillance1_sans_identique
    Matrice_nb(i,rang_nb_turbine(p).data+rang_nb_turbine(p+1).data+2) = sum(Matrice_nb(i,2:rang_nb_turbine(p).data+rang_nb_turbine(p+1).data+1));
end
n = zeros(rang_nb_turbine(p).data+rang_nb_turbine(p+1).data,1);
for i = 1:rang_nb_turbine(p).data
    n(i,1) = i;
end
for i = rang_nb_turbine(p).data+1:rang_nb_turbine(p).data+rang_nb_turbine(p+1).data
    n(i,1) = i-rang_nb_turbine(p).data;
end
C = sortrows(Matrice_nb,-(rang_nb_turbine(p).data+rang_nb_turbine(p+1).data+2));
figure;
imagesc(C(1:20,2:rang_nb_turbine(p).data+rang_nb_turbine(p+1).data+1));
colormap(flipud(gray));
colorbar;
title('20 code status defaillance plus frequents dans le parc AIRAINES ET CHALEONS ');
ylabel('code status defaillance');
xlabel('nombre occurrence');
set(gca,'Ytick',(1:20));
set(gca,'YTickLabel',C(1:20,1));
set(gca,'Xtick',(1:rang_nb_turbine(p).data+rang_nb_turbine(p+1).data));
set(gca,'XTickLabel',n(:,1));