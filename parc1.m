function varargout = parc1(varargin)
% PARC MATLAB code for parc.fig
%      PARC, by itself, creates a new PARC1 or raises the existing
%      singleton*.
%
%      H = PARC returns the handle to a new PARC1 or the handle to
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

% Last Modified by GUIDE v2.5 12-Jun-2018 22:17:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @parc1_OpeningFcn, ...
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
function parc1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to parc (see VARARGIN)

% Choose default command line output for parc
% global nombre_parc;
global nombre_parc;
set(handles.popupmenu1,'String',nombre_parc);
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
nombre_parc = unique(Data_base_donnee.Parc);
find_parc = find(strcmp(Data_base_donnee.Parc,S.Parc));
Data_Parc.ID = Data_base_donnee.ID(find_parc,:);
Data_Parc.Constructeur = Data_base_donnee.Constructeur(find_parc,:);
Data_Parc.Modele_Turbine = Data_base_donnee.Modele_Turbine(find_parc,:);
Data_Parc.DEBUT_STATUS = Data_base_donnee.DEBUT_STATUS(find_parc,:);
Data_Parc.FIN_STATUS = Data_base_donnee.FIN_STATUS(find_parc,:);
Data_Parc.DUREE = Data_base_donnee.DUREE(find_parc,:);
Data_Parc.REF_Turbine = Data_base_donnee.REF_Turbine(find_parc,:);
Data_Parc.CODE_STATUS = Data_base_donnee.CODE_STATUS(find_parc,:);
Data_Parc.NOM_STATUS = Data_base_donnee.NOM_STATUS(find_parc,:);
Data_Parc.FAMILLE_ARRET_CNSTRCTR = Data_base_donnee.FAMILLE_ARRET_CNSTRCTR(find_parc,:);
Data_Parc.FAMILLE_ARRET_VALOREM = Data_base_donnee.FAMILLE_ARRET_VALOREM(find_parc,:);
Data_Parc.MAIN_COURANTE = Data_base_donnee.MAIN_COURANTE(find_parc,:);
Data_Parc.GROUPE_DISPO = Data_base_donnee.GROUPE_DISPO(find_parc,:);
Data_Parc.CODE_BRAKING_PRGRM = Data_base_donnee.CODE_BRAKING_PRGRM(find_parc,:);
Data_Parc.NOM_BRAKING_PRGRM = Data_base_donnee.NOM_BRAKING_PRGRM(find_parc,:);
Data_Parc.FAMILLE_CALC_MAIN_COURANTE = Data_base_donnee.FAMILLE_CALC_MAIN_COURANTE(find_parc,:);
Data_Parc.FAMILLE_CALC_AFFECT_DATA_STATUS = Data_base_donnee.FAMILLE_CALC_AFFECT_DATA_STATUS(find_parc,:);
Data_Parc.SECONDE = Data_base_donnee.SECONDE(find_parc,:);
nombre_turbine = unique(Data_Parc.REF_Turbine);
nombre_status = unique(Data_Parc.FAMILLE_ARRET_CNSTRCTR);
[rang_nombre_turbine,~] = size(nombre_turbine);
[rang_nombre_status,~] = size(nombre_status);
h1 = guihandles(change_parc);

t = 'Nom du parc choisi : ';
t = strcat(t,S.Parc);
set(h1.text3,'String',t);

s = 'Nombre turbine totals :';
s = strcat(s,string(rang_nombre_turbine));
set(h1.text4,'String',s);

p = 'Nombre status totals :';
p = strcat(p,string(rang_nombre_status));
set(h1.text5,'String',p);


close('parc1');


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
