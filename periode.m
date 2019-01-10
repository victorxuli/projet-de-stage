function varargout = periode(varargin)
% PERIODE MATLAB code for periode.fig
%      PERIODE, by itself, creates a new PERIODE or raises the existing
%      singleton*.
%
%      H = PERIODE returns the handle to a new PERIODE or the handle to
%      the existing singleton*.
%
%      PERIODE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PERIODE.M with the given input arguments.
%
%      PERIODE('Property','Value',...) creates a new PERIODE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before periode_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to periode_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help periode

% Last Modified by GUIDE v2.5 26-Jul-2018 10:42:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @periode_OpeningFcn, ...
                   'gui_OutputFcn',  @periode_OutputFcn, ...
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


% --- Executes just before periode is made visible.
function periode_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to periode (see VARARGIN)

% Choose default command line output for periode
global a;
global b;
global c;
global d;
global e;
global f;
global g;
global h;
global parc;
set(handles.text1,'String',a);

set(handles.text1,'String',b);

set(handles.text1,'String',c);

set(handles.text3,'String',d);

set(handles.text4,'String',e);

set(handles.text5,'String',f);

set(handles.text6,'String',g);

set(handles.text6,'String',h);
set(handles.popupmenu1,'String',string(parc));
set(handles.uipanel4,'Visible','off');
set(handles.uipanel3,'Visible','off');




handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes periode wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = periode_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S;
global c;
global parc_choisi;
global nombre_turbine;
global find_turbine;
a = get(handles.edit1,'String');
b = get(handles.edit2,'String');
c = get(handles.edit3,'String');
S.debut = datenum(a)*3600*24;
S.fin = datenum(b)*3600*24;
[find_turbine,~] = find(strcmp(nombre_turbine(parc_choisi).data,c));

set(handles.uipanel3,'Visible','on');

% --- Executes on button press in pourcentage.
function pourcentage_Callback(hObject, eventdata, handles)
% hObject    handle to pourcentage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S;
global Data_Parc;
global rang_parc;
global parc_choisi;
global Data_Parc_periode;
global rang_nombre_turbine;
global nombre_turbine;
global code_status_periode;
global Matrice_pourcentage_periode;
global code_status_sans_pareil;
global rang_code_status_sans_pareil;
global double_code_status_sans_pareil;
global find_turbine;
global A;

[a,~] = find(Data_Parc(parc_choisi).SECONDE>S.debut);
[b,~] = find(Data_Parc(parc_choisi).SECONDE<S.fin);
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
Data_Parc_periode.SECONDE = Data_Parc(parc_choisi).SECONDE(c,:);


for i = 1 : rang_nombre_turbine(parc_choisi).data
    [rang_turbine(i).data,~] = find(strcmp(Data_Parc_periode.REF_Turbine,nombre_turbine(parc_choisi).data(i)));
    code_status_periode(i).code_status = Data_Parc_periode.CODE_STATUS(rang_turbine(i).data);
    code_status_periode(i).duree = Data_Parc_periode.DUREE(rang_turbine(i).data);
    code_status_periode(i).DEBUT_STATUS = Data_Parc_periode.DEBUT_STATUS(rang_turbine(i).data);
    code_status_periode(i).double_code_status = str2num(char(code_status_periode(i).code_status));
    [code_status_periode(i).rang,~] = size(code_status_periode(i).double_code_status);
end

[~,l] = unique(Data_Parc_periode(parc_choisi).CODE_STATUS,'first');
cd= sort(l);
code_status_sans_pareil = Data_Parc_periode(parc_choisi).CODE_STATUS(cd);
double_code_status_sans_pareil = str2num(char(code_status_sans_pareil));
[rang_code_status_sans_pareil,~] = size(code_status_sans_pareil);
Matrice_pourcentage_periode = zeros(rang_code_status_sans_pareil,rang_nombre_turbine(parc_choisi).data+2);
Matrice_pourcentage_periode(:,1) = double_code_status_sans_pareil;
for i = 1:rang_nombre_turbine(parc_choisi).data
    for j = 1 : rang_code_status_sans_pareil
        for k = 1 : code_status_periode(i).rang
            if(Matrice_pourcentage_periode(j,1)==code_status_periode(i).double_code_status(k,1))
                Matrice_pourcentage_periode(j,i+1) = Matrice_pourcentage_periode(j,i+1)+1;
            end
        end
    end
end

for j = 1 : rang_code_status_sans_pareil
    Matrice_pourcentage_periode(j,end) = sum(Matrice_pourcentage_periode(j,2:end-1));
end

for j = 1 : rang_code_status_sans_pareil
    Matrice_pourcentage_periode(j,2:end-1) = Matrice_pourcentage_periode(j,2:end-1)/Matrice_pourcentage_periode(j,end);
end
% A = sortrows(Matrice_pourcentage_periode,-(rang_nombre_turbine(parc_choisi).data+2));
A = sortrows(Matrice_pourcentage_periode,-(find_turbine+1));
if(rang_code_status_sans_pareil>20)
    figure;
    imagesc(A(1:20,2:rang_nombre_turbine(parc_choisi).data+1));
    colormap(flipud(gray));
    colorbar;
    title('le pourcentage de apparition pour les code status qui sont apparu dans cette periode');
    ylabel('code status defaillance');
    xlabel('turbine');
    set(gca,'Ytick',(1:20));
    set(gca,'YTickLabel',A(1:20,1));
else
    figure;
    imagesc(A(1:rang_code_status_sans_pareil,2:rang_nombre_turbine(parc_choisi).data+1));
    colormap(flipud(gray));
    colorbar;
    title('le pourcentage de apparition pour les code status qui sont apparu dans cette periode');
    ylabel('code status defaillance');
    xlabel('turbine');
    set(gca,'Ytick',(1:rang_code_status_sans_pareil));
    set(gca,'YTickLabel',A(1:rang_code_status_sans_pareil,1));
end
% set(gca,'Xtick',(1:rang_nombre_turbine(parc_choisi)));
% set(gca,'XTickLabel',nombre_turbine(parc_choisi).data(1:rang_nombre_turbine(parc_choisi).data));





% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global parc_choisi;
global val1;
global list;
global Data_Parc;
global rang_nombre_turbine;
global Data_liste_arrets;
global maintenance;
global periode_maintenance;
global nombre_turbine;
global eletrique;
list=get(handles.popupmenu1,'String');
val1 = get(handles.popupmenu1,'Value');
% list = num2cell(list);
% parc_choisi = string(list(val1,:));
parc_choisi = val1;


[num,txt] = xlsread('Liste Arr¨ºts.xlsx');
Data_liste_arrets.REF_TURBINE_VALOREM = txt(2:end,3);
Data_liste_arrets.DEB_ARRET = txt(2:end,4);
Data_liste_arrets.FIN_ARRET = txt(2:end,5);
Data_liste_arrets.FAMILLE_STATUS = txt(2:end,14);
Data_liste_arrets.DUREE_ARRET = num(1:end,6);
Data_liste_arrets.SECONDE_DEB = datenum(Data_liste_arrets.DEB_ARRET)*24*3600;
Data_liste_arrets.SECONDE_FIN = datenum(Data_liste_arrets.FIN_ARRET)*24*3600;

[ko,~] = find(strcmp(txt(:,2),parc_choisi));
Data_liste_arrets.REF_TURBINE_VALOREM = txt(ko,3);
Data_liste_arrets.DEB_ARRET = txt(ko,4);
Data_liste_arrets.FIN_ARRET = txt(ko,5);
Data_liste_arrets.FAMILLE_STATUS = txt(ko,14);
Data_liste_arrets.DUREE_ARRET = num(ko,6);
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
    [g,~] = find(Data_Parc(parc_choisi).SECONDE>=maintenance.SECONDE_DEB(i));
    [h,~] = find(Data_Parc(parc_choisi).SECONDE<=maintenance.SECONDE_FIN(i));
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


set(handles.text15,'String',string(Data_Parc(parc_choisi).DEBUT_STATUS(1)));
set(handles.text17,'String',string(Data_Parc(parc_choisi).DEBUT_STATUS(end)));
set(handles.uipanel4,'Visible','on');






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


% --- Executes on button press in retour.
function retour_Callback(hObject, eventdata, handles)
% hObject    handle to retour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(periode,'Visible','off');
set(change_parc,'Visible','on');



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
