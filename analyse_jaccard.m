function varargout = analyse_jaccard(varargin)
% ANALYSE_JACCARD MATLAB code for analyse_jaccard.fig
%      ANALYSE_JACCARD, by itself, creates a new ANALYSE_JACCARD or raises the existing
%      singleton*.
%
%      H = ANALYSE_JACCARD returns the handle to a new ANALYSE_JACCARD or the handle to
%      the existing singleton*.
%
%      ANALYSE_JACCARD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANALYSE_JACCARD.M with the given input arguments.
%
%      ANALYSE_JACCARD('Property','Value',...) creates a new ANALYSE_JACCARD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before analyse_jaccard_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to analyse_jaccard_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help analyse_jaccard

% Last Modified by GUIDE v2.5 30-Jul-2018 09:32:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @analyse_jaccard_OpeningFcn, ...
                   'gui_OutputFcn',  @analyse_jaccard_OutputFcn, ...
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


% --- Executes just before analyse_jaccard is made visible.
function analyse_jaccard_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to analyse_jaccard (see VARARGIN)

% Choose default command line output for analyse_jaccard
global a;
global b;
global c;
global d;
global e;
global f;
global g;
global h;
global parc;
global double_code_status_defaillance1_sans_identique;
set(handles.text1,'String',a);

set(handles.text2,'String',b);

set(handles.text3,'String',c);

set(handles.text4,'String',d);

set(handles.text5,'String',e);

set(handles.text6,'String',f);

set(handles.text7,'String',g);

set(handles.text8,'String',h);
% c = sortrows(Matrice_1er_freq,-2);
% set(handles.popupmenu2,'String',string(c(1:20,1)));
set(handles.popupmenu3,'String',string(parc));
j = sort(double_code_status_defaillance1_sans_identique);
set(handles.popupmenu2,'String',num2cell(j));

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes analyse_jaccard wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = analyse_jaccard_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in index_code.
function index_code_Callback(hObject, eventdata, handles)
% hObject    handle to index_code (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Matrice_Jaccard_code;
global nombre_turbine;
global Data_Parc;
global nombre_jour;
global code_choisi;
global parc_choisi
global rang_parc;
global Matrice_jour;
global rang_nombre_turbine;
% Data_Parc = Data_Parc(parc_choisi);




for p = 1:rang_parc
    dt = ceil((Data_Parc(p).SECONDE(end,1)-Data_Parc(p).SECONDE(1,1))/(3600*24));
    nombre_jour(p).data = dt;
end

[rang_code,~] = find(Matrice_jour(parc_choisi).turbine(1).data(:,1)==code_choisi);
Matrice_code = zeros(rang_nombre_turbine(parc_choisi).data,nombre_jour(parc_choisi).data);
for i = 1:rang_nombre_turbine(parc_choisi).data
    Matrice_code(i,:) = Matrice_jour(parc_choisi).turbine(i).data(rang_code,2:nombre_jour(parc_choisi).data +1);
end


%% %%%%%

Jaccard_index1=0;
Jaccard_index2=0;

Matrice_Jaccard_code = zeros(rang_nombre_turbine(parc_choisi).data+1,rang_nombre_turbine(parc_choisi).data+1);
Matrice_Jaccard_code(1,1) = code_choisi;
            



for i = 1 :rang_nombre_turbine(parc_choisi).data
    for j = 1 :rang_nombre_turbine(parc_choisi).data
        for m = 1 : nombre_jour(parc_choisi).data
            if(Matrice_code(i,m)>=1&&Matrice_code(j,m)>=1)
                Jaccard_index1 = Jaccard_index1+1;
            end
            if(Matrice_code(i,m)>=1 || Matrice_code(j,m)>=1)
                Jaccard_index2 = Jaccard_index2+1;
            end
            Matrice_Jaccard_code(i+1,j+1) = Jaccard_index1/Jaccard_index2;
        end
        Jaccard_index1=0;
        Jaccard_index2=0;
    end
end

figure;
subplot(211);
imagesc(Matrice_Jaccard_code(2:end,2:end));
colormap(flipud(gray));
colorbar;
t = 'index jaccard entre turbine pour code status :';
t = strcat(t,string(code_choisi));
title(t);
set(gca,'Ytick',(1:rang_nombre_turbine(parc_choisi).data));
set(gca,'YTickLabel',nombre_turbine(parc_choisi).data(1:end,1));
set(gca,'Xtick',(1:rang_nombre_turbine(parc_choisi).data));
set(gca,'XTickLabel',nombre_turbine(parc_choisi).data(1:end,1));
subplot(212);
imagesc(Matrice_code(1:end,1:end));
colormap(flipud(gray));
colorbar;
xlabel('jour');
set(gca,'Ytick',(1:rang_nombre_turbine(parc_choisi).data));
set(gca,'YTickLabel',nombre_turbine(parc_choisi).data(1:end,1));

% --- Executes on button press in index_turbine.
function index_turbine_Callback(hObject, eventdata, handles)
% hObject    handle to index_turbine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Matrice_Jaccard_turbine;
global rang_code_status_defaillance1_sans_identique;
global double_code_status_defaillance1_sans_identique;
global rang_nombre_turbine;
global parc_choisi;
global nombre_jour
global Matrice_jour;


global Matrice_nombre_par_parc;
Matrice_nombre_par_parc = zeros(rang_code_status_defaillance1_sans_identique,2);
Matrice_nombre_par_parc(:,1) = double_code_status_defaillance1_sans_identique;
for i = 1 :rang_nombre_turbine(parc_choisi).data
    for j = 1 : rang_code_status_defaillance1_sans_identique
        Matrice_nombre_par_parc(j,2) = Matrice_nombre_par_parc(j,2) + Matrice_jour(parc_choisi).turbine(i).data(j+1,end);
    end
end

global s;
s = sortrows(Matrice_nombre_par_parc,-2);

[~,ann1] = ismember(double_code_status_defaillance1_sans_identique,s(1:20,1));
[ann2,~] = find(ann1==0);
ann1(ann2) = [];
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


Jaccard_index1 = 0;
Jaccard_index2 = 0;



for i = 1 :rang_nombre_turbine(parc_choisi).data
    Matrice_Jaccard_turbine(i).data = zeros(20+1,20+1);
    Matrice_Jaccard_turbine(i).data(2:end,1) = s(1:20,1);
    Matrice_Jaccard_turbine(i).data(1,2:end) =  s(1:20,1)';
    for j = 1 : 20
        for k = 1 : 20
            for m = 1 :nombre_jour(parc_choisi).data
                if(Matrice_jour(parc_choisi).turbine(i).data(ann1(j)+1,m+1)>=1 && Matrice_jour(parc_choisi).turbine(i).data(ann1(k)+1,m+1)>=1)
                    Jaccard_index1 = Jaccard_index1+1;
                end
                if(Matrice_jour(parc_choisi).turbine(i).data(ann1(j)+1,m+1)>=1 || Matrice_jour(parc_choisi).turbine(i).data(ann1(k)+1,m+1)>=1)
                    Jaccard_index2 = Jaccard_index2+1;
                end
                Matrice_Jaccard_turbine(i).data(j+1,k+1) = Jaccard_index1/Jaccard_index2;
            end
            Jaccard_index1=0;
            Jaccard_index2=0;
        end
    end
end


for i = 1:rang_nombre_turbine(parc_choisi).data
    figure;
    t = 'index Jaccard entre les codes status pour turbine:  ';
    t = strcat(t,string(i));
    subplot(211);
    imagesc(Matrice_Jaccard_turbine(i).data(2:end,2:end));
    colormap(flipud(jet))
    colorbar;
    title(t);
    xlabel('20 codes status defaillance plus frequents');
    ylabel('20 codes status defaillance plus frequents');
    set(gca,'Ytick',(1:20));
    set(gca,'YTickLabel',Matrice_Jaccard_turbine(i).data(2:end,1));
    set(gca,'Xtick',(1:20));
    set(gca,'XTickLabel',Matrice_Jaccard_turbine(i).data(2:end,1));
    subplot(212)
%     imagesc(A(i).data(1:20,2:end-1));
    imagesc(Matrice_jour(parc_choisi).turbine(i).data(ann1+1,2:end-1));
    colormap(flipud(gray))
    colorbar;
    title('nombre occurrence de 20 code status plus frequent');
% %     xlabel('temps unite mois');
    xlabel('jour');
%     ylabel('20 codes status defaillance plus frequents');
    set(gca,'Ytick',(1:20));
    set(gca,'YTickLabel',Matrice_Jaccard_turbine(i).data(2:21,1));
end

% --- Executes on button press in retour.
function retour_Callback(hObject, eventdata, handles)
% hObject    handle to retour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(analyse_jaccard,'Visible','off');
set(change_parc,'Visible','on');


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
global code_choisi;
list=get(handles.popupmenu2,'String');
val1 = get(handles.popupmenu2,'Value');
code_choisi = str2num(list{val1});




% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3
global parc_choisi;
global val1;
global list;
list=get(handles.popupmenu3,'String');
val1 = get(handles.popupmenu3,'Value');
% list = num2cell(list);
% parc_choisi = string(list(val1,:));
parc_choisi = val1;

% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
