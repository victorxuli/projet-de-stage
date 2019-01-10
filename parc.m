function varargout = parc(varargin)
% PARC MATLAB code for parc.fig
%      PARC, by itself, creates a new PARC or raises the existing
%      singleton*.
%
%      H = PARC returns the handle to a new PARC or the handle to
%      the existing singleton*.
%
%      PARC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARC.M with the given input arguments.
%
%      PARC('Property','Value',...) creates a new PARC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before parc_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to parc_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help parc

% Last Modified by GUIDE v2.5 17-Jul-2018 15:02:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @parc_OpeningFcn, ...
                   'gui_OutputFcn',  @parc_OutputFcn, ...
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


% --- Executes just before parc is made visible.
function parc_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to parc (see VARARGIN)

% Choose default command line output for parc
% global nombre_parc;
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

% UIWAIT makes parc wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = parc_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data_base_donnee;
global S;
global Data_Parc;
global nombre_turbine;
global c;
global d;
global e;
global parc;
global nombre_status;
global rang_parc;
global rang_nombre_turbine;
global rang_nombre_status;
[rang_parc,~] = size(parc);
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
h = guihandles(main_interface);
c = 'Nom du parc choisi : ';
for i = 1 :rang_parc
    c = strcat(c,parc(i));
    c = strcat(c,",");
end
set(h.textparc,'String',c);

d = 'Nombre turbine totals :';
d = strcat(d,string(nn));
set(h.textturbine,'String',d);

e = 'type de FAMILLE_ARRET_CNSTRCTR totals :';
e = strcat(e,string(k));
set(h.text_status_total,'String',e);

set(h.parametres,'string','parc terminer. en attendant de choisir le status');

close('parc');


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
