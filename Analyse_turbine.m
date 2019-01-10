function varargout = Analyse_turbine(varargin)
% ANALYSE_TURBINE MATLAB code for Analyse_turbine.fig
%      ANALYSE_TURBINE, by itself, creates a new ANALYSE_TURBINE or raises the existing
%      singleton*.
%
%      H = ANALYSE_TURBINE returns the handle to a new ANALYSE_TURBINE or the handle to
%      the existing singleton*.
%
%      ANALYSE_TURBINE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANALYSE_TURBINE.M with the given input arguments.
%
%      ANALYSE_TURBINE('Property','Value',...) creates a new ANALYSE_TURBINE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Analyse_turbine_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Analyse_turbine_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Analyse_turbine

% Last Modified by GUIDE v2.5 25-Jul-2018 10:53:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Analyse_turbine_OpeningFcn, ...
                   'gui_OutputFcn',  @Analyse_turbine_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Analyse_turbine is made visible.
function Analyse_turbine_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Analyse_turbine (see VARARGIN)

% Choose default command line output for Analyse_turbine
global a;
global b;
global c;
global d;
global e;
global f;
global g;
global h;
set(handles.text1,'String',a);

set(handles.text2,'String',b);

set(handles.text3,'String',c);

set(handles.text4,'String',d);

set(handles.text5,'String',e);

set(handles.text6,'String',f);

set(handles.text7,'String',g);

set(handles.text8,'String',h);


global Data_Parc
global S;
global code_status;
global find_turbine1;
global tous_les_status;
global Matrice_1er;
global Matrice_2eme;
global Matrice_1er_pourcentage;
global Matrice_2eme_pourcentage;
global Matrice_1er_freq;
global double_tous_les_codes_status_sans_identique;
global rang_tous_les_codes_status_sans_identique;
global rang_commun;
global rang_rang_commun;
global B;
global C;
% Update handles structure
handles.output = hObject;

guidata(hObject, handles);

% UIWAIT makes Analyse_turbine wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Analyse_turbine_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in nombre_occurrence.
function nombre_occurrence_Callback(hObject, eventdata, handles)
% hObject    handle to nombre_occurrence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ss;
global rang_parc;
global rang_nombre_turbine;
global Matrice_nb;
global C;
global Data_Parc;
global rang_code_status_defaillance1_sans_identique;
global double_code_status_defaillance1_sans_identique;
global code_status;
global periode_jour;
global parc;
global nombre_code_status_choisi;
for p = 1:rang_parc
    periode_jour(p).data = ceil((Data_Parc(p).SECONDE(end,1) - Data_Parc(p).SECONDE(1,1))/(60*60*24));
end

ss = 0;
for p = 1:rang_parc
    ss = ss+rang_nombre_turbine(p).data;
end
pp = 0;
Matrice_nb = zeros(rang_code_status_defaillance1_sans_identique,ss+1);
Matrice_nb(:,1) = double_code_status_defaillance1_sans_identique;
for p = 1:rang_parc
    for i = pp+1 : pp+rang_nombre_turbine(p).data
        for j = 1 :rang_code_status_defaillance1_sans_identique
           for k = 1 :code_status(p).status(i-pp).rang
               if(Matrice_nb(j,1)==str2num(char(code_status(p).status(i-pp).status(k,1))))
                  Matrice_nb(j,i+1) = Matrice_nb(j,i+1)+1;
               end
           end
%            Matrice_nb(j,i+1) = Matrice_nb(j,i+1)/periode_jour(p).data;
        end
    end
    pp = pp + rang_nombre_turbine(p).data;
end

for i = 1 : rang_code_status_defaillance1_sans_identique
    Matrice_nb(i,ss+2) = sum(Matrice_nb(i,2:ss+1));
end

[rang_trouver_1,lie_trouver_1] = find(Matrice_nb(:,2:end) ==0);
[rang_rang_trouver1,~] = size(rang_trouver_1);
for i = 1 : rang_rang_trouver1
    Matrice_nb(rang_trouver_1(i),lie_trouver_1(i)+1)=1;
end




n = zeros(ss,1);
kk = 1;
k=1;
for p = 1 :rang_parc
    for i = kk:rang_nombre_turbine(p).data
        n(k,1) = i;
        k = k+1;
    end
    kk = 1;
end
n = string(n);
nn = char(parc);
k =1;
for p = 1 :rang_parc
    for i = kk:rang_nombre_turbine(p).data
        n(k) = strcat(n(k),nn(p,1:3));
        k = k+1;
    end
    kk = 1;
end
C = sortrows(Matrice_nb,-(ss+2));
figure;
imagesc(C(1:nombre_code_status_choisi,2:ss+1));
colormap(flipud(gray));
colorbar;
title('20 code status defaillance plus frequents');
ylabel('code status defaillance');
xlabel('turbine');
set(gca,'Ytick',(1:nombre_code_status_choisi));
set(gca,'YTickLabel',C(1:nombre_code_status_choisi,1));
set(gca,'Xtick',(1:ss));
set(gca,'XTickLabel',n(:,1));

        

% --- Executes on button press in duree.
function duree_Callback(hObject, eventdata, handles)
% hObject    handle to duree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ss;
global rang_parc;
global rang_nombre_turbine;
global Matrice_duree;
global Data_Parc;
global rang_code_status_defaillance1_sans_identique;
global double_code_status_defaillance1_sans_identique;
global code_status;
global periode_jour;
global parc;
global nombre_code_status_choisi;
global D;
for p = 1:rang_parc
    periode_jour(p).data = ceil((Data_Parc(p).SECONDE(end,1) - Data_Parc(p).SECONDE(1,1))/(60*60*24));
end
ss = 0;
for p = 1:rang_parc
    ss = ss+rang_nombre_turbine(p).data;
end
pp = 0;
Matrice_duree = zeros(rang_code_status_defaillance1_sans_identique,ss+1);
Matrice_duree(:,1) = double_code_status_defaillance1_sans_identique;
for p = 1:rang_parc
    for i = pp+1 : pp+rang_nombre_turbine(p).data
        for j = 1 :rang_code_status_defaillance1_sans_identique
           for k = 1 :code_status(p).status(i-pp).rang
               if(Matrice_duree(j,1)==str2num(char(code_status(p).status(i-pp).status(k,1))))
                  Matrice_duree(j,i+1) = Matrice_duree(j,i+1)+cell2mat(code_status(p).status(i-pp).status(k,4));
               end
           end
           Matrice_duree(j,i+1) = Matrice_duree(j,i+1)/periode_jour(p).data;
        end
    end
    pp = pp + rang_nombre_turbine(p).data;
end

for i = 1 : rang_code_status_defaillance1_sans_identique
    Matrice_duree(i,ss+2) = sum(Matrice_duree(i,2:ss+1));
end

n = zeros(ss,1);
kk = 1;
k=1;
for p = 1 :rang_parc
    for i = kk:rang_nombre_turbine(p).data
        n(k,1) = i;
        k = k+1;
    end
    kk = 1;
end
n = string(n);
nn = char(parc);
k =1;
for p = 1 :rang_parc
    for i = kk:rang_nombre_turbine(p).data
        n(k) = strcat(n(k),nn(p,1:3));
        k = k+1;
    end
    kk = 1;
end
D = sortrows(Matrice_duree,-(ss+2));
figure;
imagesc(D(1:nombre_code_status_choisi,2:ss+1));
colormap(flipud(gray));
colorbar;
title('les code status defaillance plus long normalise par jour');
ylabel('code status defaillance');
xlabel('turbine');
set(gca,'Ytick',(1:nombre_code_status_choisi));
set(gca,'YTickLabel',D(1:nombre_code_status_choisi,1));
set(gca,'Xtick',(1:ss));
set(gca,'XTickLabel',n(:,1));

% --- Executes on button press in pourcentage_nb.
function pourcentage_nb_Callback(hObject, eventdata, handles)
% hObject    handle to pourcentage_nb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global Matrice_1er_pourcentage;
% global B;
% global S;
% global nombre_code_status_choisi;
% [~, ia] = ismember(B(1:nombre_code_status_choisi,1),Matrice_1er_pourcentage(1:end,1));
% TT = Matrice_1er_pourcentage(ia,1:S.Nombre_turbine+1);
% figure
% imagesc(TT(1:end,2:end));
% colormap(flipud(gray));
% colorbar;
% xlabel('numero de turbine');
% ylabel('les 20 code status defaillance');
% title('pourcentage de nombre apparition par rapport aux turbine');
% set(gca,'Ytick',(1:nombre_code_status_choisi));
% set(gca,'YTickLabel',TT(1:end));
global rang_code_status_defaillance1_sans_identique;
global double_code_status_defaillance1_sans_identique;
global ss;
global nombre_code_status_choisi;
global C;
global Matrice_nb_pourcentage;
global rang_parc;
global rang_nombre_turbine;
global parc;
global double_status;
double_status = C(1:end,1);
Matrice_nb_pourcentage = zeros(rang_code_status_defaillance1_sans_identique,ss+1);
Matrice_nb_pourcentage(:,1) = double_status;
for i = 1 :rang_code_status_defaillance1_sans_identique
    for j = 1:ss
        Matrice_nb_pourcentage(i,j+1) = C(i,j+1)/sum(C(i,2:end-1));
    end
end
n = zeros(ss,1);
kk = 1;
k=1;
for p = 1 :rang_parc
    for i = kk:rang_nombre_turbine(p).data
        n(k,1) = i;
        k = k+1;
    end
    kk = 1;
end
n = string(n);
nn = char(parc);
k =1;
for p = 1 :rang_parc
    for i = kk:rang_nombre_turbine(p).data
        n(k) = strcat(n(k),nn(p,1:3));
        k = k+1;
    end
    kk = 1;
end
figure;
imagesc(Matrice_nb_pourcentage(1:nombre_code_status_choisi,2:end));
title('pourcentage de nombre occurrence entre les turbine ');
ylabel('code status defaillance');
xlabel('turbine');
set(gca,'Ytick',(1:nombre_code_status_choisi));
set(gca,'YTickLabel',Matrice_nb_pourcentage(1:nombre_code_status_choisi,1));
set(gca,'Xtick',(1:ss));
set(gca,'XTickLabel',n(:,1));
colormap(flipud(gray));
colorbar;

% --- Executes on button press in pourcentage_duree.
function pourcentage_duree_Callback(hObject, eventdata, handles)
% hObject    handle to pourcentage_duree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rang_code_status_defaillance1_sans_identique;
global double_code_status_defaillance1_sans_identique;
global ss;
global nombre_code_status_choisi;
global D;
global Matrice_duree_pourcentage;
global rang_parc;
global rang_nombre_turbine;
global parc;
Matrice_duree_pourcentage = zeros(rang_code_status_defaillance1_sans_identique,ss+1);
Matrice_duree_pourcentage(:,1) = double_code_status_defaillance1_sans_identique;
for i = 1 :rang_code_status_defaillance1_sans_identique
    for j = 1:ss
        Matrice_duree_pourcentage(i,j+1) = D(i,j+1)/sum(D(i,2:end-1));
    end
end
n = zeros(ss,1);
kk = 1;
k=1;
for p = 1 :rang_parc
    for i = kk:rang_nombre_turbine(p).data
        n(k,1) = i;
        k = k+1;
    end
    kk = 1;
end
n = string(n);
nn = char(parc);
k =1;
for p = 1 :rang_parc
    for i = kk:rang_nombre_turbine(p).data
        n(k) = strcat(n(k),nn(p,1:3));
        k = k+1;
    end
    kk = 1;
end
figure;
imagesc(Matrice_duree_pourcentage(1:nombre_code_status_choisi,2:end));
title('pourcentage de duree entre les turbine ');
ylabel('code status defaillance');
xlabel('turbine');
set(gca,'Ytick',(1:nombre_code_status_choisi));
set(gca,'YTickLabel',Matrice_duree_pourcentage(1:nombre_code_status_choisi,1));
set(gca,'Xtick',(1:ss));
set(gca,'XTickLabel',n(:,1));
colormap(flipud(gray));
colorbar;


% --- Executes on button press in retour.
function retour_Callback(hObject, eventdata, handles)
% hObject    handle to retour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(Analyse_turbine,'Visible','off');
set(change_parc,'Visible','on');







% --- Executes on button press in battery.
function battery_Callback(hObject, eventdata, handles)
% hObject    handle to battery (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ss;
global Matrice_nb;
global n;
global rang_parc;
global rang_nombre_turbine;
global parc;
global Matrice_battery_axis;
Matrice_battery_axis = zeros(3,ss+1);
Matrice_battery_axis(1,1) = 725;
Matrice_battery_axis(2,1) = 730;
Matrice_battery_axis(3,1) = 735;
[f,~] = find(Matrice_nb(:,1) == 725);
Matrice_battery_axis(1,2:end) =  Matrice_nb(f,2:end-1);
[f,~] = find(Matrice_nb(:,1) == 730);
Matrice_battery_axis(2,2:end) =  Matrice_nb(f,2:end-1);
[f,~] = find(Matrice_nb(:,1) == 735);
Matrice_battery_axis(3,2:end) =  Matrice_nb(f,2:end-1);

n = zeros(ss,1);
kk = 1;
k=1;
for p = 1 :rang_parc
    for i = kk:rang_nombre_turbine(p).data
        n(k,1) = i;
        k = k+1;
    end
    kk = 1;
end
n = string(n);
nn = char(parc);
k =1;
for p = 1 :rang_parc
    for i = kk:rang_nombre_turbine(p).data
        n(k) = strcat(n(k),nn(p,1:3));
        k = k+1;
    end
    kk = 1;
end


figure;
imagesc(Matrice_battery_axis(1:3,2:end));
title('nombre occurrence de defaillance battery axis normalise par jour ');
ylabel('code status defaillance');
xlabel('turbine');
set(gca,'Ytick',(1:3));
set(gca,'YTickLabel',Matrice_battery_axis(1:3,1));
set(gca,'Xtick',(1:ss));
set(gca,'XTickLabel',n(:,1));
colormap(flipud(gray));
colorbar;


% --- Executes on button press in nb_normalise.
function nb_normalise_Callback(hObject, eventdata, handles)
% hObject    handle to nb_normalise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ss;
global rang_parc;
global rang_nombre_turbine;
global Matrice_nb;
global C;
global Data_Parc;
global rang_code_status_defaillance1_sans_identique;
global double_code_status_defaillance1_sans_identique;
global code_status;
global periode_jour;
global parc;
global nombre_code_status_choisi;
for p = 1:rang_parc
    periode_jour(p).data = ceil((Data_Parc(p).SECONDE(end,1) - Data_Parc(p).SECONDE(1,1))/(60*60*24));
end

ss = 0;
for p = 1:rang_parc
    ss = ss+rang_nombre_turbine(p).data;
end
pp = 0;
Matrice_nb = zeros(rang_code_status_defaillance1_sans_identique,ss+1);
Matrice_nb(:,1) = double_code_status_defaillance1_sans_identique;
for p = 1:rang_parc
    for i = pp+1 : pp+rang_nombre_turbine(p).data
        for j = 1 :rang_code_status_defaillance1_sans_identique
           for k = 1 :code_status(p).status(i-pp).rang
               if(Matrice_nb(j,1)==str2num(char(code_status(p).status(i-pp).status(k,1))))
                  Matrice_nb(j,i+1) = Matrice_nb(j,i+1)+1;
               end
           end
           Matrice_nb(j,i+1) = Matrice_nb(j,i+1)/periode_jour(p).data;
        end
    end
    pp = pp + rang_nombre_turbine(p).data;
end

for i = 1 : rang_code_status_defaillance1_sans_identique
    Matrice_nb(i,ss+2) = sum(Matrice_nb(i,2:ss+1));
end




n = zeros(ss,1);
kk = 1;
k=1;
for p = 1 :rang_parc
    for i = kk:rang_nombre_turbine(p).data
        n(k,1) = i;
        k = k+1;
    end
    kk = 1;
end
n = string(n);
nn = char(parc);
k =1;
for p = 1 :rang_parc
    for i = kk:rang_nombre_turbine(p).data
        n(k) = strcat(n(k),nn(p,1:3));
        k = k+1;
    end
    kk = 1;
end
C = sortrows(Matrice_nb,-(ss+2));
figure;
imagesc(C(1:nombre_code_status_choisi,2:ss+1));
colormap(flipud(gray));
colorbar;
title('20 code status defaillance plus frequents normalise par jour');
ylabel('code status defaillance');
xlabel('turbine');
set(gca,'Ytick',(1:nombre_code_status_choisi));
set(gca,'YTickLabel',C(1:nombre_code_status_choisi,1));
set(gca,'Xtick',(1:ss));
set(gca,'XTickLabel',n(:,1));