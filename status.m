function varargout = status(varargin)
% STATUS MATLAB code for status.fig
%      STATUS, by itself, creates a new STATUS or raises the existing
%      singleton*.
%
%      H = STATUS returns the handle to a new STATUS or the handle to
%      the existing singleton*.
%
%      STATUS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STATUS.M with the given input arguments.
%
%      STATUS('Property','Value',...) creates a new STATUS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before status_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to status_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help status

% Last Modified by GUIDE v2.5 13-Jun-2018 14:44:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @status_OpeningFcn, ...
                   'gui_OutputFcn',  @status_OutputFcn, ...
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


% --- Executes just before status is made visible.
function status_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to status (see VARARGIN)

% Choose default command line output for status
global nom_status;
set(handles.popupmenu1,'String',nom_status);
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes status wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = status_OutputFcn(hObject, eventdata, handles) 
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
global S;
list=get(handles.popupmenu1,'String');
val1 = get(handles.popupmenu1,'Value');
S.status_code = list{val1};


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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S;
global Data_Parc;
global find_turbine1;
global tous_les_status;
global nombre_turbine;
global f;
global g;
global h;
global parc;
global Data_base_donnee;
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
% find_status = find(strcmp(Data_Parc.FAMILLE_ARRET_CNSTRCTR,S.status_code));
% data_def(:,1) = Data_Parc.CODE_STATUS(find_status,1);
% data_def(:,2) = num2cell(Data_Parc.DUREE(find_status,1));
% [~,cd] = unique(Data_Parc.CODE_STATUS(find_status,1),'first'); 
% j = sort(cd);
% tous_les_codes_status_sans_identique_code = data_def(j,1);
% tous_les_codes_status_sans_identique_duree = data_def(j,2);
% double_tous_les_codes_status_sans_identique = str2num(char(tous_les_codes_status_sans_identique_code));
% %double_tous_les_codes_status_sans_identique_duree = str2num(char(tous_les_codes_status_sans_identique_duree));
% [rang_tous_les_codes_status_sans_identique,~] = size(double_tous_les_codes_status_sans_identique);

h2 = guihandles(main_interface);
f = 'Type de FAMILLE_ARRET_CNSTRCTR choisi :';
f = strcat(f,string(S.status_code));
set(h2.textstatus,'String',f);
g = 'code status defaillance totals :';
g = strcat(g,string(rang_code_status_defaillance1_sans_identique));
set(h2.textcodetotale,'String',g);



S.debut_data = Data_Parc1.DEBUT_STATUS(1,1);
S.fin_data = Data_Parc1.DEBUT_STATUS(end,1);
k = guihandles(main_interface);
h = 'Periode du temps :  ';
h = strcat(h,S.debut_data);
h = strcat(h,'  ид   ');
h = strcat(h,S.fin_data);
set(k.textperiode,'String',h);



set(h2.parametres,'string',' vous pourrez commencer ид analyser');
close('status');
