function varargout = change_parc(varargin)
% CHANGE_PARC MATLAB code for change_parc.fig
%      CHANGE_PARC, by itself, creates a new CHANGE_PARC or raises the existing
%      singleton*.
%
%      H = CHANGE_PARC returns the handle to a new CHANGE_PARC or the handle to
%      the existing singleton*.
%
%      CHANGE_PARC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHANGE_PARC.M with the given input arguments.
%
%      CHANGE_PARC('Property','Value',...) creates a new CHANGE_PARC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before change_parc_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to change_parc_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help change_parc

% Last Modified by GUIDE v2.5 26-Jul-2018 09:26:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @change_parc_OpeningFcn, ...
                   'gui_OutputFcn',  @change_parc_OutputFcn, ...
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


% --- Executes just before change_parc is made visible.
function change_parc_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to change_parc (see VARARGIN)

% Choose default command line output for change_parc
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
handles.output = hObject;


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes change_parc wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = change_parc_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Analyse_global.
function Analyse_global_Callback(hObject, eventdata, handles)
% hObject    handle to Analyse_global (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(change_parc,'Visible','off');
run('analyse_global');

% --- Executes on button press in analyse_turbine.
function analyse_turbine_Callback(hObject, eventdata, handles)
% hObject    handle to analyse_turbine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(change_parc,'Visible','off');
run('Analyse_turbine');


% --- Executes on button press in analyse_temps.
function analyse_temps_Callback(hObject, eventdata, handles)
% hObject    handle to analyse_temps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(change_parc,'Visible','off');
run('analyse_status');


% --- Executes on button press in change_parc.
function change_parc_Callback(hObject, eventdata, handles)
% hObject    handle to change_parc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('changement');


% --- Executes on button press in quitter.
function quitter_Callback(hObject, eventdata, handles)
% hObject    handle to quitter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('out');
% set(change_parc,'Visible','off');
% set(main_interface,'Visible','on');


% --- Executes on button press in analyse_jaccard.
function analyse_jaccard_Callback(hObject, eventdata, handles)
% hObject    handle to analyse_jaccard (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(change_parc,'Visible','off');
run('analyse_jaccard');


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(change_parc,'Visible','off');
run('periode');
