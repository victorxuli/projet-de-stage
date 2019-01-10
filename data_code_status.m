function code_status = data_code_status(Data_Parc,find_turbine1,tous_les_status,S)
nombre_turbine = unique(Data_Parc.REF_Turbine);
[rang_nb_turbine,~] = size(nombre_turbine);
%% 根据不同风机分别读取时间数据
for i = 1:rang_nb_turbine
    code_status(i).SECONDE = Data_Parc.SECONDE(find_turbine1(i).turbine,:);
end
%% 根据不同风机读分别取其所有故障DEF数据
for i = 1:rang_nb_turbine
    code_status(i).find_code_status = find(strcmp(tous_les_status(i).M(:,2),S.status_code));
    code_status(i).status(:,1) = find_turbine1(i).tous_les_status(code_status(i).find_code_status,1);
    code_status(i).status(:,2) = find_turbine1(i).tous_les_status(code_status(i).find_code_status,2);
    code_status(i).status(:,3) = find_turbine1(i).tous_les_status(code_status(i).find_code_status,3);
    code_status(i).status(:,4) = find_turbine1(i).tous_les_status(code_status(i).find_code_status,4);
    code_status(i).status(:,5) = find_turbine1(i).tous_les_status(code_status(i).find_code_status,5);
end
%% 消除状态编码相同的行 获得所有状态编码唯一的故障DEF数据
for i=1:rang_nb_turbine
    [~,colonne_code_status_sans_identique] = unique(code_status(i).status(:,1),'first'); 
    j = sort(colonne_code_status_sans_identique);
    code_status(i).status_sans_identique = code_status(i).status(j,:);
end

%%
for i = 1:rang_nb_turbine
    kan = str2num(char(code_status(i).status(:,1)));
    code_status(i).new(:,1) = kan;
    code_status(i).SECONDE1 = code_status(i).SECONDE(code_status(i).find_code_status,1);
    code_status(i).new(:,2) = code_status(i).SECONDE1;
    kan = cell2mat(code_status(i).status(:,4));
    code_status(i).new(:,3) = kan;
%     code_status(i).O = find(code_status(i).SECONDE1(:,1)>=S.debut);
%     code_status(i).P = code_status(i).SECONDE1(code_status(i).O,1);
%     code_status(i).Q = find(code_status(i).P<=S.fin);
%     code_status(i).R = code_status(i).P(code_status(i).Q,1);
%     code_status(i).S = datestr(code_status(i).R/(24*3600));
%     code_status(i).status4(:,1) = code_status(i).status(:,1);
%     code_status(i).status4 = str2num(char(code_status(i).status4));
%     code_status(i).status4(:,2) = code_status(i).SECONDE1;
%     if(isempty(code_status(i).R))
%         ma = 0;
%     else
%        ma = find(code_status(i).R(1)==code_status(i).status4(:,2)); 
%        [l,~] = size(code_status(i).Q);
%        code_status(i).test10 = zeros(l,1);
%        code_status(i).test10(:,1) = code_status(i).status4(ma:ma+l-1,1);
%        [~,cd] = unique(code_status(i).test10,'first'); 
%        j = sort(cd);
%        code_status(i).status3 = code_status(i).test10(j,:);
end
%%
% for i = 1:rang_nb_turbine
%     [l,~] = size(code_status(i).Q);
%     if(l~=0)
%         sii(i).s = find(code_status(i).R(1,1)==code_status(i).SECONDE1(:,1));
%         pii(i).s = find(code_status(i).R(l,1)==code_status(i).SECONDE1(:,1));
%     end
% end
% %%
for i = 1:rang_nb_turbine
    [rang_code_status_new,~] = size(code_status(i).new);
    code_status(i).rang_new = rang_code_status_new;
end
end