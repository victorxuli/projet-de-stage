function varargout = changement(varargin)
% CHANGEMENT MATLAB code for changement.fig
%      CHANGEMENT, by itself, creates a new CHANGEMENT or raises the existing
%      singleton*.
%
%      H = CHANGEMENT returns the handle to a new CHANGEMENT or the handle to
%      the existing singleton*.
%
%      CHANGEMENT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHANGEMENT.M with the given input arguments.
%
%      CHANGEMENT('Property','Value',...) creates a new CHANGEMENT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before changement_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to changement_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help changement

% Last Modified by GUIDE v2.5 31-Jul-2018 16:10:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @changement_OpeningFcn, ...
                   'gui_OutputFcn',  @changement_OutputFcn, ...
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


% --- Executes just before changement is made visible.
function changement_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to changement (see VARARGIN)

% Choose default command line output for changement
global nombre_parc;
% set(handles.popupmenu1,'String',nombre_parc);


global nombre_parc;
global parc;
global i;
i = 1;
parc = "AIRAINES";
[size_parc,~] = size(nombre_parc);
if(size_parc == 7)
    set(handles.checkbox1,'String',nombre_parc(1));
    set(handles.checkbox2,'String',nombre_parc(2));
    set(handles.checkbox3,'String',nombre_parc(3));
    set(handles.checkbox4,'String',nombre_parc(4));
    set(handles.checkbox5,'String',nombre_parc(5));
    set(handles.checkbox6,'String',nombre_parc(6));
    set(handles.checkbox7,'String',nombre_parc(7));
    % set(handles.checkbox8,'String',nombre_parc(8));
    % set(handles.checkbox5,'Visible','off');
    % set(handles.checkbox6,'Visible','off');
    % set(handles.checkbox7,'Visible','off');
    set(handles.checkbox8,'Visible','off');
end
if(size_parc == 4)
    set(handles.checkbox1,'String',nombre_parc(1));
    set(handles.checkbox2,'String',nombre_parc(2));
    set(handles.checkbox3,'String',nombre_parc(3));
    set(handles.checkbox4,'String',nombre_parc(4));
    set(handles.checkbox5,'Visible','off');
    set(handles.checkbox6,'Visible','off');
    set(handles.checkbox7,'Visible','off');
    set(handles.checkbox8,'Visible','off');
end
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes changement wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = changement_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
val=get(handles.popupmenu1,'Value');
global S;
global nombre_parc;
[rang_nb_parc,~] = size(nombre_parc);
S.nombre_parc = rang_nb_parc;
for i = 1:rang_nb_parc
    if(val ==i)
        S.Parc = string(nombre_parc(i,1));
    end
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data_base_donnee;
global S;
global Data_Parc;
global nombre_turbine;
global parc;
global nombre_status;
global rang_parc;
global rang_nombre_turbine;
global rang_nombre_status;
global code_status;
global nombre_mois;
global nombre_jour;
global Matrice_mois;
global Matrice_jour;
[rang_parc,~] = size(parc);
clearvars code_status;
for p = 1:rang_parc
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
    [rang_nombre_turbine(p).data,~] = size(nombre_turbine(p).data);
    nombre_status(p).data = unique(Data_Parc(p).FAMILLE_ARRET_CNSTRCTR);
    [rang_nombre_status(p).data,~] = size(nombre_status(p).data);
end

nn=0;
mm=0;
for p = 1:rang_parc
    nn = nn+rang_nombre_turbine(p).data;
    mm = mm+rang_nombre_status(p).data;
end

k=[];
for p = 1:rang_parc
    k = [k;nombre_status(p).data];
end
k = unique(k);
[k,~] = size(k);

global find_turbine1;
global tous_les_status;
global rang_code_status_defaillance1_sans_identique;
global double_code_status_defaillance1_sans_identique;
global rang_double_code_status_defaillance1;
global double_code_status_defaillance1;
global v;
%find_status = find(strcmp(Data_base_donnee.FAMILLE_ARRET_CNSTRCTR,S.status_code));

[find_turbine1,tous_les_status] = separer_status_turbine(Data_Parc);

% nombre_turbine = unique(Data_Parc.REF_Turbine);
% [rang_nb_turbine,~] = size(nombre_turbine);
% S.Nombre_turbine = rang_nb_turbine;


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
[v,~] = find(strcmp(Data_Parc1.FAMILLE_ARRET_CNSTRCTR,S.status_code));
code_status_defaillance1 = Data_Parc1.CODE_STATUS(v);
double_code_status_defaillance1 = str2num(char(code_status_defaillance1));
[rang_double_code_status_defaillance1,~] = size(double_code_status_defaillance1);
[~,l] = unique(code_status_defaillance1,'first'); 
pl= sort(l);
code_status_defaillance1_sans_identique = code_status_defaillance1(pl);
double_code_status_defaillance1_sans_identique = str2num(char(code_status_defaillance1_sans_identique));
[rang_code_status_defaillance1_sans_identique,~] = size(double_code_status_defaillance1_sans_identique);






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

%% matrice 1 jour
for p = 1:rang_parc
    dt = ceil((Data_Parc(p).SECONDE(end,1)-Data_Parc(p).SECONDE(1,1))/(3600*24));
    nombre_jour(p).data = dt;
end

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


global a;
global b;
global c;
global d;
global e;
global f;
global g;
global h;


c = 'Nom du parc choisi : ';
for i = 1 :rang_parc
    c = strcat(c,parc(i));
    c = strcat(c,",");
end

d = 'Nombre turbine totals :';
d = strcat(d,string(nn));

e = 'type de FAMILLE_ARRET_CNSTRCTR totals :';
e = strcat(e,string(k));

f = 'Type de FAMILLE_ARRET_CNSTRCTR choisi :';
f = strcat(f,string(S.status_code));

g = 'code status defaillance totals :';
g = strcat(g,string(rang_code_status_defaillance1_sans_identique));
S.debut_data = Data_Parc1.DEBUT_STATUS(1,1);
S.fin_data = Data_Parc1.DEBUT_STATUS(end,1);
h = 'Periode du temps :  ';
h = strcat(h,S.debut_data);
h = strcat(h,'  ид   ');
h = strcat(h,S.fin_data);

h3 = guihandles(change_parc);
set(h3.text1,'String',a);

set(h3.text2,'String',b);

set(h3.text3,'String',c);

set(h3.text4,'String',d);

set(h3.text5,'String',e);

set(h3.text6,'String',f);

set(h3.text7,'String',g);

set(h3.text8,'String',h);

close('changement');







% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
global i;
global parc;
global ttt;
ttt= get(handles.checkbox1,'String');
parc(i,1) = ttt;
i = i+1;

% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
global i;
global parc;
global ttt;
ttt = get(handles.checkbox2,'String');
parc(i,1) = ttt;
i = i+1;

% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
global i;
global parc;
global ttt;
ttt = get(handles.checkbox3,'String');
parc(i,1) = ttt;
i = i+1;

% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4
global i;
global parc;
global ttt;
ttt = get(handles.checkbox4,'String');
parc(i,1) = ttt;
i = i+1;

% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5
global i;
global parc;
global ttt;
ttt= get(handles.checkbox5,'String');
parc(i,1) = ttt;
i = i+1;

% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6
global i;
global parc;
global ttt;
ttt = get(handles.checkbox6,'String');
parc(i,1) = ttt;
i = i+1;

% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7
global i;
global parc;
global ttt;
ttt = get(handles.checkbox7,'String');
parc(i,1) = ttt;
i = i+1;

% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8
global i;
global parc;
global ttt;
ttt = get(handles.checkbox8,'String');
parc(i,1) = ttt;
i = i+1;
