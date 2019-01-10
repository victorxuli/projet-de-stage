function  Data_base_donnee = import_fichier(m)
[num,txt] = xlsread(m);
%% 读取初始数据至Data_base_donnee
Data_base_donnee.ID = num(:,1);
Data_base_donnee.Parc = txt(2:end,2);
Data_base_donnee.Constructeur = txt(2:end,3);
Data_base_donnee.Modele_Turbine = txt(2:end,4);
Data_base_donnee.DEBUT_STATUS = txt(2:end,5);
Data_base_donnee.FIN_STATUS = txt(2:end,6);
Data_base_donnee.DUREE = num(:,7);
Data_base_donnee.REF_Turbine = txt(2:end,8);
Data_base_donnee.CODE_STATUS = txt(2:end,9);
Data_base_donnee.NOM_STATUS = txt(2:end,10);
Data_base_donnee.FAMILLE_ARRET_CNSTRCTR = txt(2:end,11);
Data_base_donnee.FAMILLE_ARRET_VALOREM = txt(2:end,12);
Data_base_donnee.MAIN_COURANTE = txt(2:end,13);
Data_base_donnee.GROUPE_DISPO = txt(2:end,14);
Data_base_donnee.CODE_BRAKING_PRGRM = txt(2:end,15);
Data_base_donnee.NOM_BRAKING_PRGRM = txt(2:end,16);
Data_base_donnee.FAMILLE_CALC_MAIN_COURANTE = txt(2:end,17);
Data_base_donnee.FAMILLE_CALC_AFFECT_DATA_STATUS = txt(2:end,18);
Data_base_donnee.SECONDE = datenum(Data_base_donnee.DEBUT_STATUS)*24*3600;

clear txt
clear num
end