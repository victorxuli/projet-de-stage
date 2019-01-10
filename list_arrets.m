[num,txt] = xlsread('Liste Arrêts.xlsx');
Data_liste_arrets.REF_TURBINE_VALOREM = txt(2:end,3);
Data_liste_arrets.DEB_ARRET = txt(2:end,4);
Data_liste_arrets.FIN_ARRET = txt(2:end,5);
Data_liste_arrets.FAMILLE_STATUS = txt(2:end,14);
Data_liste_arrets.DUREE_ARRET = num(1:end,6);
Data_liste_arrets.SECONDE_DEB = datenum(Data_liste_arrets.DEB_ARRET)*24*3600;
Data_liste_arrets.SECONDE_FIN = datenum(Data_liste_arrets.FIN_ARRET)*24*3600;
%%
[a,~] = find(strcmp(Data_liste_arrets.FAMILLE_STATUS,'MAINTENANCE'));
[b,~] = find(strcmp(Data_liste_arrets.FAMILLE_STATUS,'MAINTENANCE CORRECTIVE'));
[c,~] = find(strcmp(Data_liste_arrets.FAMILLE_STATUS,'MAINTENANCE CURATIVE'));
[d,~] = find(strcmp(Data_liste_arrets.FAMILLE_STATUS,'MAINTENANCE PREVENTIVE'));
e = union(a,b);
f = union(c,d);
rang_maintenance = union(e,f);

maintenance.DEB_ARRET = Data_liste_arrets.DEB_ARRET(rang_maintenance);
maintenance.FIN_ARRET = Data_liste_arrets.FIN_ARRET(rang_maintenance);
maintenance.DUREE_ARRET = Data_liste_arrets.DUREE_ARRET(rang_maintenance);
maintenance.SECONDE_DEB = datenum(maintenance.DEB_ARRET)*24*3600;
maintenance.SECONDE_FIN = datenum(maintenance.FIN_ARRET)*24*3600;
[taile_maintenance,~] = size(maintenance.DEB_ARRET);
for i = 1 : taile_maintenance
    [g,~] = find(Data_Parc(parc_choisi).SECONDE>maintenance.SECONDE_DEB(i));
    [h,~] = find(Data_Parc(parc_choisi).SECONDE<maintenance.SECONDE_FIN(i));
    periode_maintenance = intersect(g,h);
    Data_Parc(parc_choisi).ID(periode_maintenance) = [];
    Data_Parc(parc_choisi).Parc(periode_maintenance) = [];
    Data_Parc(parc_choisi).Constructeur(periode_maintenance) = [];
    Data_Parc(parc_choisi).Modele_Turbine(periode_maintenance) = [];
    Data_Parc(parc_choisi).DEBUT_STATUS(periode_maintenance) = [];
    Data_Parc(parc_choisi).FIN_STATUS(periode_maintenance) = [];
    Data_Parc(parc_choisi).DUREE(periode_maintenance) = [];
    Data_Parc(parc_choisi).REF_Turbine(periode_maintenance) = [];
    Data_Parc(parc_choisi).CODE_STATUS(periode_maintenance) = [];
    Data_Parc(parc_choisi).NOM_STATUS(periode_maintenance) = [];
    Data_Parc(parc_choisi).FAMILLE_ARRET_CNSTRCTR(periode_maintenance) = [];
	Data_Parc(parc_choisi).FAMILLE_ARRET_VALOREM(periode_maintenance) = [];
    Data_Parc(parc_choisi).MAIN_COURANTE(periode_maintenance) = [];
    Data_Parc(parc_choisi).GROUPE_DISPO(periode_maintenance) = [];
    Data_Parc(parc_choisi).CODE_BRAKING_PRGRM(periode_maintenance) = [];
    Data_Parc(parc_choisi).NOM_BRAKING_PRGRM(periode_maintenance) = [];
    Data_Parc(parc_choisi).FAMILLE_CALC_MAIN_COURANTE(periode_maintenance) = [];
    Data_Parc(parc_choisi).FAMILLE_CALC_AFFECT_DATA_STATUS(periode_maintenance) = [];
    Data_Parc(parc_choisi).SECONDE(periode_maintenance) = [];
end


[r,~] = find(strcmp(Data_liste_arrets.FAMILLE_STATUS,'ELECTRIQUE'));
[rang_r,~] = size(r);
duree_electrique = Data_liste_arrets.DUREE_ARRET(r);
DEB_electrique = Data_liste_arrets.DEB_ARRET(r);
FIN_electrique = Data_liste_arrets.FIN_ARRET(r);
Turbine_electrique = Data_liste_arrets.REF_TURBINE_VALOREM(r);
[s,~] = find(duree_electrique>(36/864));
DEB_electrique_important = DEB_electrique(s);  %% defaut electrique pour toutes les turbines
FIN_electrique_important = FIN_electrique(s);
Turbine_electrique_important = Turbine_electrique(s);  %% defaut electrique important dans les turbines


for i = 1:rang_nombre_turbine(parc_choisi).data
    [rang_turbine(i).data,~] = find(strcmp(Turbine_electrique_important,nombre_turbine(parc_choisi).data(i)));
    eletrique(i).DEB = DEB_electrique_important(rang_turbine(i).data);
    eletrique(i).FIN = FIN_electrique_important(rang_turbine(i).data);
end

%% 之后将重要的电力故障数据由风机区分 然后去两次相邻电力故障中间的全部状态代码code_status

code_status_elec = [3110;3555;3255;2710;3260];

periode_DEB_T4 = ["2015/3/2 11:17:01";"2017/1/27 13:51:24";"2017/10/11 13:43:27";"2017/11/11 16:15:45";"2018/2/12 19:04:44";"2018/4/19 7:29:59"];
periode_FIN_T4 = ["2015/4/2 11:17:01";"2017/2/27 13:51:24";"2017/11/11 13:43:27";"2017/11/14 16:43:40";"2018/3/12 19:04:44";"2018/4/19 18:50:32"];
aa = datenum(cellstr(periode_DEB_T4));
bb = datenum(cellstr(periode_FIN_T4));
for i = 1 : 6
    nombre_heure(i).data = ceil((bb(i)-aa(i))*24);
end


for i = 1 : 6
    [a,~] = find(Data_Parc(parc_choisi).SECONDE/86400>aa(i));
    [b,~] = find(Data_Parc(parc_choisi).SECONDE/86400<bb(i));
    [c,~] = intersect(a,b);
    
    Data_Parc_periode.ID = Data_Parc(parc_choisi).ID(c,:);
    Data_Parc_periode.Parc = Data_Parc(parc_choisi).Parc(c,:);
    Data_Parc_periode.Constructeur = Data_Parc(parc_choisi).Constructeur(c,:);
    Data_Parc_periode.Modele_Turbine = Data_Parc(parc_choisi).Modele_Turbine(c,:);
    Data_Parc_periode.DEBUT_STATUS = Data_Parc(parc_choisi).DEBUT_STATUS(c,:);
    Data_Parc_periode.FIN_STATUS = Data_Parc(parc_choisi).FIN_STATUS(c,:);
    Data_Parc_periode.DUREE = Data_Parc(parc_choisi).DUREE(c,:);
    Data_Parc_periode.REF_Turbine = Data_Parc(parc_choisi).REF_Turbine(c,:);
    Data_Parc_periode.CODE_STATUS = Data_Parc(parc_choisi).CODE_STATUS(c,:);
    Data_Parc_periode.NOM_STATUS = Data_Parc(parc_choisi).NOM_STATUS(c,:);
    Data_Parc_periode.FAMILLE_ARRET_CNSTRCTR = Data_Parc(parc_choisi).FAMILLE_ARRET_CNSTRCTR(c,:);
    Data_Parc_periode.FAMILLE_ARRET_VALOREM = Data_Parc(parc_choisi).FAMILLE_ARRET_VALOREM(c,:);
    Data_Parc_periode.MAIN_COURANTE = Data_Parc(parc_choisi).MAIN_COURANTE(c,:);
    Data_Parc_periode.GROUPE_DISPO = Data_Parc(parc_choisi).GROUPE_DISPO(c,:);
    Data_Parc_periode.CODE_BRAKING_PRGRM = Data_Parc(parc_choisi).CODE_BRAKING_PRGRM(c,:);
    Data_Parc_periode.NOM_BRAKING_PRGRM = Data_Parc(parc_choisi).NOM_BRAKING_PRGRM(c,:);
    Data_Parc_periode.FAMILLE_CALC_MAIN_COURANTE = Data_Parc(parc_choisi).FAMILLE_CALC_MAIN_COURANTE(c,:);
    Data_Parc_periode.FAMILLE_CALC_AFFECT_DATA_STATUS = Data_Parc(parc_choisi).FAMILLE_CALC_AFFECT_DATA_STATUS(c,:);
    Data_Parc_periode.SECONDE = Data_Parc(parc_choisi).SECONDE(c,:)/86400;
    for j = 1 : rang_nombre_turbine(parc_choisi).data
        [rang_turbine(j).data,~] = find(strcmp(Data_Parc_periode.REF_Turbine,nombre_turbine(parc_choisi).data(j)));
        code_status_periode(j).code_status = Data_Parc_periode.CODE_STATUS(rang_turbine(j).data);
        code_status_periode(j).duree = Data_Parc_periode.DUREE(rang_turbine(j).data);
        code_status_periode(j).DEBUT_STATUS = Data_Parc_periode.DEBUT_STATUS(rang_turbine(j).data);
        code_status_periode(j).SECONDE = datenum(code_status_periode(j).DEBUT_STATUS);
        code_status_periode(j).double_code_status = str2num(char(code_status_periode(j).code_status));
        [code_status_periode(j).rang,~] = size(code_status_periode(j).double_code_status);
    end

    Matrice_final(i).data = zeros(5+1,nombre_heure(i).data+1);
    Matrice_final(i).data(2:end,1) = code_status_elec;
    for k = 1:nombre_heure(i).data
        Matrice_final(i).data(1,k+1) = aa(i)+1/24*k;
    end
    for s = 1:5
        [rang_T4,~] = find(Matrice_final(i).data(s+1,1)==code_status_periode(4).double_code_status);
        if(isempty(rang_T4))
            continue;
        else
            data_T4 = code_status_periode(4).SECONDE(rang_T4);
            [rang_data_T4,~] = size(data_T4);
            duree_T4 = ceil(code_status_periode(4).duree*86400/(60*60));
            [kkk,~] = find(duree_T4==0);
            duree_T4(kkk) = 1;
            if(~isempty(rang_data_T4))
                for n = 1 :rang_data_T4
                    if(data_T4(n)<Matrice_final(i).data(1,2))
                        Matrice_final(i).data(s+1,2:1+duree_T4(n))=1;
                    else
                        for r = 2:nombre_heure(i).data
                            if(data_T4(n)>=Matrice_final(i).data(1,r)&&data_T4(n)<=Matrice_final(i).data(1,r+1))
                                Matrice_final(i).data(s+1,r+1:r+duree_T4(n))=1;
                            end
                        end
                    end
                end
            end
        end
        %                     turbine1_10min(i).data(k,2)=turbine1_10min(i).data(k,2)+1;
    end
    figure;
    for np = 1 :5
        plot(Matrice_final(i).data(np+1,2:end));
        t = strcat(periode_DEB_T4(i)," to ");
        t = strcat(t,periode_FIN_T4(i));
        title(t);
        hold on;
    end
    legend(string(Matrice_final(i).data(2:end,1)));
    axis([0 800 0 3]);
end

    