[~,code_status_02_04_2015_3110] = xlsread('E4_02.04.2015_3110.xlsx');
[~,code_status_12_03_2018_3110] = xlsread('E4_12.03.2018_3110.xlsx');
[~,code_status_14_03_2018_3555] = xlsread('E4_14.03.2018_3555.xlsx');
[~,code_status_14_11_2017_3555] = xlsread('E4_14.11.2017_3555.xlsx');
[~,code_status_27_02_2018_3110] = xlsread('E4_27.02.2017_3555.xlsx');

code_status_02_04_2015_3110 = str2num(char(code_status_02_04_2015_3110));
code_status_12_03_2018_3110 = str2num(char(code_status_12_03_2018_3110));
code_status_14_03_2018_3555 = str2num(char(code_status_14_03_2018_3555));
code_status_14_11_2017_3555 = str2num(char(code_status_14_11_2017_3555));
code_status_27_02_2018_3110 = str2num(char(code_status_27_02_2018_3110));

[~,cd] = unique(code_status_02_04_2015_3110);
p = sort(cd);
unique_code_status_02_04_2015_3110= code_status_02_04_2015_3110(p);


[~,cd] = unique(code_status_12_03_2018_3110);
p = sort(cd);
unique_code_status_12_03_2018_3110= code_status_12_03_2018_3110(p);


[~,cd] = unique(code_status_14_03_2018_3555);
p = sort(cd);
unique_code_status_14_03_2018_3555= code_status_14_03_2018_3555(p);


[~,cd] = unique(code_status_14_11_2017_3555);
p = sort(cd);
unique_code_status_14_11_2017_3555= code_status_14_11_2017_3555(p);


[~,cd] = unique(code_status_27_02_2018_3110);
p = sort(cd);
unique_code_status_12_03_2018_3110= code_status_27_02_2018_3110(p);


[code_status_commun_3110,~] = intersect(unique_code_status_12_03_2018_3110,unique_code_status_02_04_2015_3110);

[code_status_commun_3555,~] = intersect(unique_code_status_14_03_2018_3555,unique_code_status_14_11_2017_3555);
[code_status_commun_3555,~] = intersect(code_status_commun_3555,unique_code_status_12_03_2018_3110);
