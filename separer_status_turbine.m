function [find_turbine1,tous_les_status] = separer_status_turbine(Data_Parc)
global parc;
[rang_parc,~] = size(parc);
for p = 1:rang_parc
    nombre_turbine(p).data = unique(Data_Parc(p).REF_Turbine);
    [rang_nb_turbine(p).data,~] = size(nombre_turbine(p).data);
    if(rang_nb_turbine(p).data>9)
        for k = 1:rang_nb_turbine(p).data
            t = 'T';
            t = strcat(t,string(k));
            t = cellstr(t);
            nombre_turbine(p).data(k) = t;
        end
    end
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
end