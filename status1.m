function varargout = status1(varargin)
% STATUS1 MATLAB code for status1.fig
%      STATUS1, by itself, creates a new STATUS1 or raises the existing
%      singleton*.
%
%      H = STATUS1 returns the handle to a new STATUS1 or the handle to
%      the existing singleton*.
%
%      STATUS1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STATUS1.M with the given input arguments.
%
%      STATUS1('Property','Value',...) creates a new STATUS1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before status1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to status1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help status1

% Last Modified by GUIDE v2.5 22-Jun-2018 11:17:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @status1_OpeningFcn, ...
                   'gui_OutputFcn',  @status1_OutputFcn, ...
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


% --- Executes just before status1 is made visible.
function status1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to status1 (see VARARGIN)

% Choose default command line output for status1
global nom_status;
set(handles.popupmenu1,'String',nom_status);
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes status1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = status1_OutputFcn(hObject, eventdata, handles) 
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
%find_status = find(strcmp(Data_base_donnee.FAMILLE_ARRET_CNSTRCTR,S.status_code));

[find_turbine1,tous_les_status] = separer_status_turbine(Data_Parc);

nombre_turbine = unique(Data_Parc.REF_Turbine);
[rang_nb_turbine,~] = size(nombre_turbine);
S.Nombre_turbine = rang_nb_turbine;

find_status = find(strcmp(Data_Parc.FAMILLE_ARRET_CNSTRCTR,S.status_code));
data_def(:,1) = Data_Parc.CODE_STATUS(find_status,1);
data_def(:,2) = num2cell(Data_Parc.DUREE(find_status,1));
[~,cd] = unique(Data_Parc.CODE_STATUS(find_status,1),'first'); 
j = sort(cd);
tous_les_codes_status_sans_identique_code = data_def(j,1);
tous_les_codes_status_sans_identique_duree = data_def(j,2);
double_tous_les_codes_status_sans_identique = str2num(char(tous_les_codes_status_sans_identique_code));
%double_tous_les_codes_status_sans_identique_duree = str2num(char(tous_les_codes_status_sans_identique_duree));
[rang_tous_les_codes_status_sans_identique,~] = size(double_tous_les_codes_status_sans_identique);

h2 = guihandles(change_parc);
t = 'Status choisi :';
t = strcat(t,string(S.status_code));
set(h2.text6,'String',t);

close('status1');
