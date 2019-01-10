function varargout = out(varargin)
% OUT MATLAB code for out.fig
%      OUT, by itself, creates a new OUT or raises the existing
%      singleton*.
%
%      H = OUT returns the handle to a new OUT or the handle to
%      the existing singleton*.
%
%      OUT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OUT.M with the given input arguments.
%
%      OUT('Property','Value',...) creates a new OUT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before out_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to out_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help out

% Last Modified by GUIDE v2.5 13-Jul-2018 10:31:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @out_OpeningFcn, ...
                   'gui_OutputFcn',  @out_OutputFcn, ...
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


% --- Executes just before out is made visible.
function out_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to out (see VARARGIN)

% Choose default command line output for out
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes out wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = out_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in oui.
function oui_Callback(hObject, eventdata, handles)
% hObject    handle to oui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(out);
close(change_parc);
close(main_interface);
clear all;


% --- Executes on button press in non.
function non_Callback(hObject, eventdata, handles)
% hObject    handle to non (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(out);
