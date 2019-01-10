function varargout = analyse_status(varargin)
% ANALYSE_STATUS MATLAB code for analyse_status.fig
%      ANALYSE_STATUS, by itself, creates a new ANALYSE_STATUS or raises the existing
%      singleton*.
%
%      H = ANALYSE_STATUS returns the handle to a new ANALYSE_STATUS or the handle to
%      the existing singleton*.
%
%      ANALYSE_STATUS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANALYSE_STATUS.M with the given input arguments.
%
%      ANALYSE_STATUS('Property','Value',...) creates a new ANALYSE_STATUS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before analyse_status_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to analyse_status_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help analyse_status

% Last Modified by GUIDE v2.5 25-Jul-2018 10:29:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @analyse_status_OpeningFcn, ...
                   'gui_OutputFcn',  @analyse_status_OutputFcn, ...
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


% --- Executes just before analyse_status is made visible.
function analyse_status_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to analyse_status (see VARARGIN)

% Choose default command line output for analyse_status
global a;
global b;
global c;
global d;
global e;
global f;
global g;
global h;
global double_code_status_defaillance1_sans_identique;
global parc;
set(handles.text1,'String',a);

set(handles.text2,'String',b);

set(handles.text3,'String',c);

set(handles.text4,'String',d);

set(handles.text5,'String',e);

set(handles.text6,'String',f);

set(handles.text7,'String',g);

set(handles.text8,'String',h);
% resultat1 = resultat(Matrice_1er_freq,rang_commun,S,Data_Parc,nombre_mois,rang_rang_commun,code_status,nombre_turbine);
% assignin('base','resultat1',resultat1);
 j = sort(double_code_status_defaillance1_sans_identique);
set(handles.popupmenu1,'String',num2cell(j));
set(handles.popupmenu2,'String',string(parc));
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes analyse_status wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = analyse_status_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in nombre_occurrence.
function nombre_occurrence_Callback(hObject, eventdata, handles)
% hObject    handle to nombre_occurrence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rang_parc;
global Data_Parc;
global nombre_mois;
global rang_code_status_defaillance1_sans_identique;
global double_code_status_defaillance1_sans_identique;
global code_status;
global rang_nombre_turbine;
global code_choisi;
global parc_choisi;
global k;
global Matrice_mois;
global parc;
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
[an,~] = find(code_choisi==double_code_status_defaillance1_sans_identique);
k = [];
for i = 1 : rang_nombre_turbine(parc_choisi).data
    k = [k;Matrice_mois(parc_choisi).turbine(i).data(an+1,2:end-1)];
end

% date = datestr(Matrice_mois.turbine(1).data(1,2:end-1)/(3600*24));
% date(:,12:end) = [];
% date = string(date);
% dates = datestr(Matrice_mois(parc_choisi).turbine(1).data(1,2:end-1)/86400);
figure;
imagesc(k);
colormap(flipud(gray));
colorbar;
t = 'nombre occurrence pour le code status : ';
t = strcat(t,string(code_choisi));
t = strcat(t,parc(parc_choisi));
title(t);
xlabel('mois');
ylabel('numero de turbine');
% set(gca,'Xtick',(1:nombre_mois(parc_choisi).data));
% set(gca,'XTickLabel',date);


% --- Executes on button press in jour.
function jour_Callback(hObject, eventdata, handles)
% hObject    handle to jour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rang_parc;
global Data_Parc;
global nombre_jour;
global rang_code_status_defaillance1_sans_identique;
global double_code_status_defaillance1_sans_identique;
global code_status;
global Matrice_jour;
global rang_nombre_turbine;
global code_choisi;
global parc_choisi;
global k;
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
[an,~] = find(code_choisi==double_code_status_defaillance1_sans_identique);
k = [];
for i = 1 : rang_nombre_turbine(parc_choisi).data
    k = [k;Matrice_jour(parc_choisi).turbine(i).data(an+1,2:end-1)];
end
dates = datestr(Matrice_jour(parc_choisi).turbine(i).data(1,2:nombre_jour(parc_choisi).data)/86400);
dates(:,12:20) = [];
figure;
imagesc(k);
colormap(flipud(gray));
colorbar;
t = 'nombre occurrence pour le code status : ';
t = strcat(t,string(code_choisi));
title(t);
xlabel('jour');
ylabel('numero de turbine');









% --- Executes on button press in retour.
function retour_Callback(hObject, eventdata, handles)
% hObject    handle to retour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(analyse_status,'Visible','off');
set(change_parc,'Visible','on');

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global rang_rang_commun;
% global compte;
global code_choisi;
% val=get(handles.popupmenu1,'Value');
% for i = 1:rang_rang_commun
%     if(val ==i)
%         compte = val;
%     end
% end
list=get(handles.popupmenu1,'String');
val1 = get(handles.popupmenu1,'Value');
code_choisi = str2num(list{val1});

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


% --- Executes on button press in choisir_code_status.
function choisir_code_status_Callback(hObject, eventdata, handles)
% hObject    handle to choisir_code_status (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel3,'visible','on');


% --- Executes on button press in seconde.
function seconde_Callback(hObject, eventdata, handles)
% hObject    handle to seconde (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global turbine;
global rang_nb_turbine;
global Data_Parc;
global rang_tous_les_codes_status_sans_identique;
global double_tous_les_codes_status_sans_identique;
global code_status;
global l;
global g;
global pp;
global rang_rang_temps;
global rang_temps1;
global rang_temps2;
global S;
global Matrice1_jour;
%% seconde
find_status = find(strcmp(Data_Parc.FAMILLE_ARRET_CNSTRCTR,S.status_code));
data_def(:,1) = Data_Parc.CODE_STATUS(find_status,1);
data_def(:,2) = num2cell(Data_Parc.DUREE(find_status,1));
[~,cd] = unique(Data_Parc.CODE_STATUS(find_status,1),'first'); 
j = sort(cd);
tous_les_codes_status_sans_identique_code = data_def(j,1);
tous_les_codes_status_sans_identique_duree = data_def(j,2);
double_tous_les_codes_status_sans_identique = str2num(char(tous_les_codes_status_sans_identique_code));
[rang_tous_les_codes_status_sans_identique,~] = size(double_tous_les_codes_status_sans_identique);
for i = 1 : rang_nb_turbine
    compte = 1;
    %j:ÌìÊý
    for p = 1:ceil((Data_Parc.SECONDE(end,1)-Data_Parc.SECONDE(1,1))/(60*60*24))
        jour = zeros(rang_tous_les_codes_status_sans_identique+1,86401);
        jour(2:end,1) = double_tous_les_codes_status_sans_identique;
        %k:ÃëÊý
        for k=1:86400
            jour(1,k+1) = Data_Parc.SECONDE(1,1)+(k-1)+(p-1)*86400;
        end
        [rang_temps1,~] = find(cell2mat(code_status(i).status(:,5))>=jour(1,2));
        [rang_temps2,~] = find(cell2mat(code_status(i).status(:,5))<=jour(1,end));
        rang_temps = intersect(rang_temps1,rang_temps2);
        [rang_rang_temps,~] = size(rang_temps);
        [~,l] = ismember(str2num(char(code_status(i).status(rang_temps,1))),jour(:,1));
        [~,g] = ismember(ceil(cell2mat(code_status(i).status(rang_temps,5))),jour(1,2:end));
        if(~isempty(rang_rang_temps))
            for pp = 1:rang_rang_temps
                jour(l(pp),g(pp)) = 1;
            end
        end
        if(compte==1)
            turbine(i).data=[];
        end
        turbine(i).data = [turbine(i).data,sparse(jour(2:end,2:end))];
        compte = compte+1;
    end
end
global code_choisi;
[r,~] = find(code_choisi==Matrice1_jour(1).data(:,1));
for i = 1 :rang_nb_turbine
    k = [];
    k = [k;turbine(i).data(r-1,1:end-1)];
end
for i = 1 :rang_nb_turbine
    figure;
    imagesc(turbine(i).data(r-1,1:end-1));
    colormap(flipud(gray));
    colorbar;
end
t = 'nombre occurrence pour le code status : ';
t = strcat(t,string(code_choisi));
title(t);
xlabel('seconde');
ylabel('numero de turbine');


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
global parc_choisi;
global val1;
global list;
list=get(handles.popupmenu2,'String');
val1 = get(handles.popupmenu2,'Value');
% list = num2cell(list);
% parc_choisi = string(list(val1,:));
parc_choisi = val1;
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


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global duree_3110;
global super_10mins;
global Matrice_duree_3110;
global matrice_3110;
global s;
global parc;
global rang_parc;
global nombre_jour;
global code_status;
global Matrice_jour;
global rang_nombre_turbine;
global code_choisi;
global val1;
global nombre_turbine;
for p = 1:rang_parc
    [rang_3110,~] = find(Matrice_jour(p).turbine(1).data(:,1) == code_choisi);
    for i = 1:rang_nombre_turbine(p).data
        [~,lie_3110(p).turbine(i).data] = find(Matrice_jour(p).turbine(i).data(rang_3110,2:end)>=1);
        [~,rang_lie_3110(p).turbine(i).data] = size(lie_3110(p).turbine(i).data);
    end
end
for p = 1:rang_parc
    matrice_3110(p).data = zeros(rang_nombre_turbine(p).data,nombre_jour(p).data);
    for i = 1 : rang_nombre_turbine(p).data
        for j = 2 :rang_lie_3110(p).turbine(i).data
            matrice_3110(p).data(i,lie_3110(p).turbine(i).data(1,j)) = 1/(lie_3110(p).turbine(i).data(1,j) - lie_3110(p).turbine(i).data(1,j-1))*24*60;
        end
    end
end


for p = 1:rang_parc
    for i = 1:rang_nombre_turbine(p).data
        [pk(i).data,~] = find(code_status(p).new(i).new(:,1) ==3110);
        duree_3110(p).turbine(i).data(:,1) = code_status(p).new(i).new(pk(i).data,3);
        duree_3110(p).turbine(i).data(:,2) = code_status(p).new(i).new(pk(i).data,2);
        super_10mins(p).turbine(i).data = find(duree_3110(p).turbine(i).data(:,1)>(600/86400));
    end
end

for p = 1:rang_parc
    Matrice_duree_3110(p).data = zeros(rang_nombre_turbine(p).data,nombre_jour(p).data);
    for i = 1:rang_nombre_turbine(p).data
        [m4,~] = size(super_10mins(p).turbine(i).data);
        for j = 1:m4
            a = duree_3110(p).turbine(i).data(super_10mins(p).turbine(i).data(j),2);
            [~,ak] = find(Matrice_jour(p).turbine(i).data(1,2:end)>a);
            Matrice_duree_3110(p).data(i,ak(1)) = 1;
        end
    end
end



for p = 1:rang_parc
    for i = 1:rang_nombre_turbine(p).data
        s(p).data(i,1:nombre_jour(p).data) = Matrice_duree_3110(p).data(i,1:nombre_jour(p).data).*matrice_3110(p).data(i,1:nombre_jour(p).data);
        [~,ss1] = find(s(p).data(i,1:nombre_jour(p).data)==0);
        s(p).data(i,ss1)=nan;
    end
end



figure;
for i = 1:rang_nombre_turbine(val1).data
    dates = datestr(Matrice_jour(val1).turbine(i).data(1,2:nombre_jour(val1).data)/86400);
    dates(:,12:20) = [];
    plot(s(val1).data(i,:),'*');
    hold on
    plot(matrice_3110(val1).data(i,:));
    t = 'la frequence apparition entre 2 fois occurrence : ';
    t = strcat(t,string(code_choisi));
    t = strcat(t,parc(val1));
    title(t);
    xlabel('jour')
    ylabel('la frequence 1/Tduree');
%     legend(string(nombre_turbine(val1).data(1:end,1)));
%     dynamicDateTicks([],[],'dd/mmm/yy');
%     set(gca,'Xtick',(1:nombre_jour(p).data));
%     set(gca,'XTickLabel',dates);
end
