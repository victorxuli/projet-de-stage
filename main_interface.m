function varargout = main_interface(varargin)
% MAIN_INTERFACE MATLAB code for main_interface.fig
%      MAIN_INTERFACE, by itself, creates a new MAIN_INTERFACE or raises the existing
%      singleton*.
%
%      H = MAIN_INTERFACE returns the handle to a new MAIN_INTERFACE or the handle to
%      the existing singleton*.
%
%      MAIN_INTERFACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_INTERFACE.M with the given input arguments.
%   
%      MAIN_INTERFACE('Property','Value',...) creates a new MAIN_INTERFACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_interface_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_interface_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main_interface

% Last Modified by GUIDE v2.5 25-Jul-2018 09:14:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...xx
                   'gui_OpeningFcn', @main_interface_OpeningFcn, ...
                   'gui_OutputFcn',  @main_interface_OutputFcn, ...
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


% --- Executes just before main_interface is made visible.
function main_interface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main_interface (see VARARGIN)

% Choose default command line output for main_interface
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main_interface wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_interface_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in liste_fichier.
function liste_fichier_Callback(hObject, eventdata, handles)
% hObject    handle to liste_fichier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns liste_fichier contents as cell array
%        contents{get(hObject,'Value')} returns selected item from liste_fichier
val=get(handles.liste_fichier,'Value');
global S;
switch val
    case 3
        S.Nom_du_fichier = 'FOYE_LAMARNE_LIMOUZINIERE_PDRS_SMCC_SPDB';
    case 2
        S.Nom_du_fichier = 'AIRAINES_CHALEONS_STHILAIRES_COURGIS_VENOYBEINE';
end


% --- Executes during object creation, after setting all properties.
function liste_fichier_CreateFcn(hObject, eventdata, handles)
% hObject    handle to liste_fichier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in ouvrir_fichier.
function ouvrir_fichier_Callback(hObject, eventdata, handles)
% hObject    handle to ouvrir_fichier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S;
global Data_base_donnee;
global nombre_parc;
global nombre_parc1;
global rang_nb_parc;
global a;
global b;
set(handles.text1,'String','Importer en cours...');
set(handles.parametres,'string','Importer le fichier excel en cours...');
pause(2);
[num,txt] = xlsread(S.Nom_du_fichier); %importer les donn¨¦es d'un fichier Excel vers Matlab
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
%%
set(handles.text1,'String','terminer! Veuillez choisir les parametre de donnees!');
a = 'Nom du fichier :';
a = strcat(a,S.Nom_du_fichier);
set(handles.text2,'String',a);
nombre_parc = unique(Data_base_donnee.Parc);
[rang_nb_parc,~] = size(nombre_parc);
for i = 1:rang_nb_parc
    nombre_parc1(i,1) =string(nombre_parc(i,1));
end
set(handles.parametres,'string','fichier importer fini. en attendant de choisir le parc...');
% [rang_nb_parc,~] = size(nombre_parc);
b = 'Nombre parc totals : ';
b = strcat(b,string(rang_nb_parc));
set(handles.text_parc_total,'string',b);
clear txt
clear num


% --- Executes on button press in parc.
function parc_Callback(hObject, eventdata, handles)
% hObject    handle to parc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.parametres,'string','en train de choisir le parc...');
global nombre_parc;
run('parc');

% --- Executes on button press in turbine.
function turbine_Callback(hObject, eventdata, handles)
% hObject    handle to turbine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in status.
function status_Callback(hObject, eventdata, handles)
% hObject    handle to status (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data_base_donnee;
global nom_status;
nom_status = unique(Data_base_donnee.FAMILLE_ARRET_CNSTRCTR);
run('status');


% --- Executes on button press in analyse.
function analyse_Callback(hObject, eventdata, handles)
% hObject    handle to analyse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic
global Data_Parc
global S;
global code_status;
global find_turbine1;
global tous_les_status;
global nombre_mois;
global rang_nombre_turbine;
global rang_code_status_defaillance1_sans_identique;
global double_code_status_defaillance1_sans_identique;
global rang_parc;
global nombre_jour;
global Matrice_mois;
global Matrice_jour;
%[find_turbine1,tous_les_status] = separer_status_turbine(Data_Parc);
% code_status = data_code_status(Data_Parc,find_turbine1,tous_les_status,S);
for p = 1:rang_parc
    for i = 1:rang_nombre_turbine(p).data
        code_status(p).find_code_status(i).data = find(strcmp(tous_les_status(p).turbine(i).M(:,2),S.status_code));
        code_status(p).status(i).status(:,1) = find_turbine1(p).turbine(i).tous_les_status(code_status(p).find_code_status(i).data,1);
        code_status(p).status(i).status(:,2) = find_turbine1(p).turbine(i).tous_les_status(code_status(p).find_code_status(i).data,2);
        code_status(p).status(i).status(:,3) = find_turbine1(p).turbine(i).tous_les_status(code_status(p).find_code_status(i).data,3);
        code_status(p).status(i).status(:,4) = find_turbine1(p).turbine(i).tous_les_status(code_status(p).find_code_status(i).data,4);
        code_status(p).status(i).status(:,5) = find_turbine1(p).turbine(i).tous_les_status(code_status(p).find_code_status(i).data,5);
        [code_status(p).status(i).rang,~] = size(code_status(p).status(i).status);
    end
    for i = 1:rang_nombre_turbine(p).data
    code_status(p).SECONDE(i).SECONDE = Data_Parc(p).SECONDE(find_turbine1(p).turbine(i).turbine,:);
    end
    for i = 1:rang_nombre_turbine(p).data
        kan = str2num(char(code_status(p).status(i).status(:,1)));
        code_status(p).new(i).new(:,1) = kan;
        code_status(p).SECONDE1(i).SECONDE1= code_status(p).SECONDE(i).SECONDE(code_status(p).find_code_status(i).data,1);
        code_status(p).new(i).new(:,2) = code_status(p).SECONDE1(i).SECONDE1;
        kan = cell2mat(code_status(p).status(i).status(:,4));
        code_status(p).new(i).new(:,3) = kan;
    end
end

%% matrice mois
for p = 1:rang_parc
    dt = ceil((Data_Parc(p).SECONDE(end,1)-Data_Parc(p).SECONDE(1,1))/(3600*24*30));
    nombre_mois(p).data = dt;
end

if(isempty(Matrice_mois))
    for p = 1 :rang_parc
        for i = 1 : rang_nombre_turbine(p).data
            Matrice_mois(p).turbine(i).data = zeros(rang_code_status_defaillance1_sans_identique+1,nombre_mois(p).data +2);
            Matrice_mois(p).turbine(i).data(2:end,1) = double_code_status_defaillance1_sans_identique;
            for j = 1:nombre_mois(p).data
                Matrice_mois(p).turbine(i).data(1,j+1) = Data_Parc(p).SECONDE(1,1)+(3600*24*30)*j;
            end
            [rang_temps1,~] = find(cell2mat(code_status(p).status(i).status(:,5))<=Matrice_mois(p).turbine(i).data(1,2));
            if(~isempty(rang_temps1))
                [rang_rang_temps1,~] = size(rang_temps1);
                for k = 2:rang_code_status_defaillance1_sans_identique+1
                    for s = 1:rang_rang_temps1
                        if(Matrice_mois(p).turbine(i).data(k,1)==str2double(code_status(p).status(i).status(rang_temps1(s,1),1)))
                            Matrice_mois(p).turbine(i).data(k,2)=Matrice_mois(p).turbine(i).data(k,2)+1;
                        end
                    end
                end
            end
            for j = 2:nombre_mois(p).data
                [rang_temps1,~] = find(cell2mat(code_status(p).status(i).status(:,5))>Matrice_mois(p).turbine(i).data(1,j));
                [rang_temps2,~] = find(cell2mat(code_status(p).status(i).status(:,5))<=Matrice_mois(p).turbine(i).data(1,j+1));
                rang_temps = intersect(rang_temps1,rang_temps2);
                [rang_rang_temps,~] = size(rang_temps);
                if(~isempty(rang_temps))
                    for k = 2:rang_code_status_defaillance1_sans_identique+1
                        for s = 1:rang_rang_temps
                            if(Matrice_mois(p).turbine(i).data(k,1)==str2double(code_status(p).status(i).status(rang_temps(s,1),1)))
                                Matrice_mois(p).turbine(i).data(k,j+1)=Matrice_mois(p).turbine(i).data(k,j+1)+1;
                            end
                        end
                    end
                end
            end
        end
    end
    
    for p = 1 :rang_parc
        for j = 1 : rang_nombre_turbine(p).data
            for i = 1: rang_code_status_defaillance1_sans_identique
                Matrice_mois(p).turbine(j).data(i+1,end) =  sum(Matrice_mois(p).turbine(j).data(i+1,2:nombre_mois(p).data+1));
            end
        end
    end
end

%% matrice 1 jour
for p = 1:rang_parc
    dt = ceil((Data_Parc(p).SECONDE(end,1)-Data_Parc(p).SECONDE(1,1))/(3600*24));
    nombre_jour(p).data = dt;
end

if(isempty(Matrice_jour))
    for p = 1 :rang_parc
        for i = 1 : rang_nombre_turbine(p).data
            Matrice_jour(p).turbine(i).data = zeros(rang_code_status_defaillance1_sans_identique+1,nombre_jour(p).data +2);
            Matrice_jour(p).turbine(i).data(2:end,1) = double_code_status_defaillance1_sans_identique;
            for j = 1:nombre_jour(p).data
                Matrice_jour(p).turbine(i).data(1,j+1) = Data_Parc(p).SECONDE(1,1)+(3600*24)*j;
            end
            [rang_temps1,~] = find(cell2mat(code_status(p).status(i).status(:,5))<=Matrice_jour(p).turbine(i).data(1,2));
            if(~isempty(rang_temps1))
                [rang_rang_temps1,~] = size(rang_temps1);
                for k = 2:rang_code_status_defaillance1_sans_identique+1
                    for s = 1:rang_rang_temps1
                        if(Matrice_jour(p).turbine(i).data(k,1)==str2double(code_status(p).status(i).status(rang_temps1(s,1),1)))
                            Matrice_jour(p).turbine(i).data(k,2)=Matrice_jour(p).turbine(i).data(k,2)+1;
                        end
                    end
                end
            end
            for j = 2:nombre_jour(p).data
                [rang_temps1,~] = find(cell2mat(code_status(p).status(i).status(:,5))>Matrice_jour(p).turbine(i).data(1,j));
                [rang_temps2,~] = find(cell2mat(code_status(p).status(i).status(:,5))<=Matrice_jour(p).turbine(i).data(1,j+1));
                rang_temps = intersect(rang_temps1,rang_temps2);
                [rang_rang_temps,~] = size(rang_temps);
                if(~isempty(rang_temps))
                    for k = 2:rang_code_status_defaillance1_sans_identique+1
                        for s = 1:rang_rang_temps
                            if(Matrice_jour(p).turbine(i).data(k,1)==str2double(code_status(p).status(i).status(rang_temps(s,1),1)))
                                Matrice_jour(p).turbine(i).data(k,j+1)=Matrice_jour(p).turbine(i).data(k,j+1)+1;
                            end
                        end
                    end
                end
            end
        end
    end


    for p = 1 :rang_parc
        for j = 1 : rang_nombre_turbine(p).data
            for i = 1: rang_code_status_defaillance1_sans_identique
                Matrice_jour(p).turbine(j).data(i+1,end) =  sum(Matrice_jour(p).turbine(j).data(i+1,2:nombre_jour(p).data+1));
            end
        end
    end
end

%%
set (main_interface,'Visible','off');
run('change_parc');
toc