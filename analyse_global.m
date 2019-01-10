function varargout = analyse_global(varargin)
% ANALYSE_GLOBAL MATLAB code for analyse_global.fig
%      ANALYSE_GLOBAL, by itself, creates a new ANALYSE_GLOBAL or raises the existing
%      singleton*.
%
%      H = ANALYSE_GLOBAL returns the handle to a new ANALYSE_GLOBAL or the handle to
%      the existing singleton*.
%
%      ANALYSE_GLOBAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANALYSE_GLOBAL.M with the given input arguments.
%
%      ANALYSE_GLOBAL('Property','Value',...) creates a new ANALYSE_GLOBAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before analyse_global_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to analyse_global_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help analyse_global

% Last Modified by GUIDE v2.5 25-Jul-2018 10:28:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @analyse_global_OpeningFcn, ...
                   'gui_OutputFcn',  @analyse_global_OutputFcn, ...
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


% --- Executes just before analyse_global is made visible.
function analyse_global_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to analyse_global (see VARARGIN)

% Choose default command line output for analyse_global
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
set(handles.panel1,'Visible','off');
% Update handles structure
handles.output = hObject;
guidata(hObject, handles);

% UIWAIT makes analyse_global wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = analyse_global_OutputFcn(hObject, eventdata, handles) 
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
global Data_base_donnee
global parc;
global Data_Parc1;
global Matrice_1er;
global rang_code_status_defaillance1_sans_identique;
global double_code_status_defaillance1_sans_identique;
global B;
global rang_double_code_status_defaillance1;
global double_code_status_defaillance1;
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
Matrice_1er = zeros(rang_code_status_defaillance1_sans_identique,2);
Matrice_1er(:,1) = double_code_status_defaillance1_sans_identique;
for i = 1 :rang_code_status_defaillance1_sans_identique
    for j = 1 :rang_double_code_status_defaillance1
        if(Matrice_1er(i,1)==double_code_status_defaillance1(j,1))
            Matrice_1er(i,2) = Matrice_1er(i,2)+1;
        end
    end
end
B = sortrows(Matrice_1er,-2);
figure;
name = B(1:20,1);
name = num2str(name);
name = cellstr(name);
pareto(B(1:20,2),name);
% for i = 1:rang_parc
%     a = strcat(a,parc(i));
%     if(i~=rang_parc)
%         a = strcat(a,', ');
%     end
title('code status defaillance plus frequents ');
xlabel('code status defaillance');
ylabel('nombre occurrence');

% --- Executes on button press in duree.
function duree_Callback(hObject, eventdata, handles)
% hObject    handle to duree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data_base_donnee
global parc;
global Data_Parc1;
global rang_code_status_defaillance1_sans_identique;
global double_code_status_defaillance1_sans_identique;
global rang_double_code_status_defaillance1;
global double_code_status_defaillance1;
global rang_parc;
global v;
global Matrice_2eme;
global duree_status_defaillance;
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
duree_status_defaillance = Data_Parc1.DUREE(v);
Matrice_2eme = zeros(rang_code_status_defaillance1_sans_identique,2);
Matrice_2eme(:,1) = double_code_status_defaillance1_sans_identique;
for i = 1 :rang_code_status_defaillance1_sans_identique
    for j = 1 :rang_double_code_status_defaillance1
        if(Matrice_2eme(i,1)==double_code_status_defaillance1(j,1))
            Matrice_2eme(i,2) = Matrice_2eme(i,2)+duree_status_defaillance(j,1);
        end
    end
end
C = sortrows(Matrice_2eme,-2);
figure;
name = C(1:20,1);
name = num2str(name);
name = cellstr(name);
pareto(C(1:20,2),name);
title('code status defaillance plus long ');
xlabel('code status defaillance');
ylabel('jour');
% --- Executes on button press in ok.
function ok_Callback(hObject, eventdata, handles)
% hObject    handle to ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set (handles.panel1,'Visible','on');




% --- Executes on button press in retour.
function retour_Callback(hObject, eventdata, handles)
% hObject    handle to retour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(analyse_global,'Visible','off');
set(change_parc,'Visible','on');
global a;
global b;
global c;
global d;
global e;
global f;
global g;
global h;
h1 = guihandles(change_parc);
set(h1.text1,'String',a);

set(h1.text2,'String',b);

set(h1.text3,'String',c);

set(h1.text4,'String',d);

set(h1.text5,'String',e);

set(h1.text6,'String',f);

set(h1.text7,'String',g);

set(h1.text8,'String',h);



% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global nombre_code_status_choisi;
list=get(handles.popupmenu1,'String');
val1 = get(handles.popupmenu1,'Value');
nombre_code_status_choisi = str2num(list{val1});


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


% --- Executes on button press in ST.
function ST_Callback(hObject, eventdata, handles)
% hObject    handle to ST (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global rang_parc
global periode_jour;
global rang_nombre_turbine;
global rang_code_status_defaillance1_sans_identique;
global nombre_mois;
global Data_Parc;
global code_status;
global parc;
global Matrice_mois;
global double_code_status_defaillance1_sans_identique;
global Matrice_ST;

for p = 1:rang_parc
    periode_jour(p).data = ceil((Data_Parc(p).SECONDE(end,1) - Data_Parc(p).SECONDE(1,1))/(60*60*24));
end


for p = 1:rang_parc
    nombre_mois(p).data = ceil(periode_jour(p).data/30);
    for i = 1 : rang_nombre_turbine(p).data
        Matrice_mois(p).occurence(i).data = zeros(rang_code_status_defaillance1_sans_identique+1,nombre_mois(p).data+2);
        for j = 1 : nombre_mois(p).data
            Matrice_mois(p).occurence(i).data(1,j+1) = Data_Parc(p).SECONDE(1,1)+86400*30*j;
        end
        Matrice_mois(p).occurence(i).data(2:rang_code_status_defaillance1_sans_identique+1,1) = double_code_status_defaillance1_sans_identique;
         for s = 1:rang_code_status_defaillance1_sans_identique   
            for m = 1 : code_status(p).status(i).rang
                if(Matrice_mois(p).occurence(i).data(s+1,1) == code_status(p).new(i).new(m,1))
                    if(code_status(p).new(i).new(m,2)<=Matrice_mois(p).occurence(i).data(1,2))
                        Matrice_mois(p).occurence(i).data(s+1,2) = Matrice_mois(p).occurence(i).data(s+1,2) + 1;
                    else
                        for k = 2:nombre_mois(p).data
                            if(code_status(p).new(i).new(m,2)>Matrice_mois(p).occurence(i).data(1,k)&&code_status(p).new(i).new(m,2)<=Matrice_mois(p).occurence(i).data(1,k+1))
                                Matrice_mois(p).occurence(i).data(s+1,k+1) = Matrice_mois(p).occurence(i).data(s+1,k+1) + 1;
                            end
                        end
                    end
                end
            end
            Matrice_mois(p).occurence(i).data(s+1,end) = sum(Matrice_mois(p).occurence(i).data(s+1,2:end-1));
         end
    end
end
          

for p = 1 : rang_parc
    Matrice_ST(p).data= zeros(rang_nombre_turbine(p).data,nombre_mois(p).data+1);
    for i = 1:rang_nombre_turbine(p).data
        for j = 1:nombre_mois(p).data
            Matrice_ST(p).data(i+1,j+1) = sum(Matrice_mois(p).occurence(i).data(2:end,j+1));
        end
    end
end


% date = datestr(Matrice_mois.turbine(1).data(1,2:end-1)/(3600*24));
% date(:,12:end) = [];
% date = string(date);
for p = 1:rang_parc
    figure;
    imagesc(Matrice_ST(p).data(2:end,2:end));
    colormap(flipud(gray));
    colorbar;   
    xlabel('mois');
    ylabel('numero de turbine');
    r = 'nombre occurrence pour le parc : ';
    r = strcat(r,parc(p));
    title(r);
%     set(gca,'Xtick',(1:nombre_mois(p).data));
%     set(gca,'XTickLabel',date);
end





% --- Executes on button press in Amplitude.
function Amplitude_Callback(hObject, eventdata, handles)
% hObject    handle to Amplitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rang_parc;
global rang_nombre_turbine;
global rang_code_status_defaillance1_sans_identique;
global double_code_status_defaillance1_sans_identique;
global parc;
global Matrice_nb;
global F;
global G;
global C;
global ecart;
global sd;
global code_status;




if(isempty(Matrice_nb))
    ss = 0;
    for p = 1:rang_parc
        ss = ss+rang_nombre_turbine(p).data;
    end
    pp = 0;
    Matrice_nb = zeros(rang_code_status_defaillance1_sans_identique,ss+1);
    Matrice_nb(:,1) = double_code_status_defaillance1_sans_identique;
    for p = 1:rang_parc
        for i = pp+1 : pp+rang_nombre_turbine(p).data
            for j = 1 :rang_code_status_defaillance1_sans_identique
                for k = 1 :code_status(p).status(i-pp).rang
                    if(Matrice_nb(j,1)==str2num(char(code_status(p).status(i-pp).status(k,1))))
                        Matrice_nb(j,i+1) = Matrice_nb(j,i+1)+1;
                    end
                end
            end
        end
        pp = pp + rang_nombre_turbine(p).data;
    end
    
    for i = 1 : rang_code_status_defaillance1_sans_identique
        Matrice_nb(i,ss+2) = sum(Matrice_nb(i,2:ss+1));
    end
    
    [rang_trouver_1,lie_trouver_1] = find(Matrice_nb(:,2:end) ==0);
    [rang_rang_trouver1,~] = size(rang_trouver_1);
    for i = 1 : rang_rang_trouver1
        Matrice_nb(rang_trouver_1(i),lie_trouver_1(i)+1)=1;
    end
end



for p = 1:rang_parc
    m_rang_nombre_turbine(p) = rang_nombre_turbine(p).data;
    cum_rang_nombre_turbine(p) = sum(m_rang_nombre_turbine(1,1:p));
end
global i;
for p = 1:rang_parc
    ecart= zeros(rang_code_status_defaillance1_sans_identique,rang_parc+2);
    sd = zeros(rang_code_status_defaillance1_sans_identique,rang_parc+2);
    ecart(:,1) = double_code_status_defaillance1_sans_identique;
    sd(:,1) = double_code_status_defaillance1_sans_identique;
end



for i = 1:rang_code_status_defaillance1_sans_identique
    ecart(i,2) = (max(Matrice_nb(i,2:cum_rang_nombre_turbine(1)+1)) - min(Matrice_nb(i,2:cum_rang_nombre_turbine(1)+1)))/median(Matrice_nb(i,2:cum_rang_nombre_turbine(1)+1));
    sd(i,2)  = std(Matrice_nb(i,2:cum_rang_nombre_turbine(1)+1))/median(Matrice_nb(i,2:cum_rang_nombre_turbine(1)+1));
%     ecart(i,2) = (max(Matrice_nb(i,2:cum_rang_nombre_turbine(1)+1)) - min(Matrice_nb(i,2:cum_rang_nombre_turbine(1)+1)));
%     sd(i,2)  = std(Matrice_nb(i,2:cum_rang_nombre_turbine(1)+1));
    for p = 2:rang_parc
        ecart(i,p+1) = (max(Matrice_nb(i,cum_rang_nombre_turbine(p-1)+2:cum_rang_nombre_turbine(p)+1)) - min(Matrice_nb(i,cum_rang_nombre_turbine(p-1)+2:cum_rang_nombre_turbine(p)+1)))/median(Matrice_nb(i,cum_rang_nombre_turbine(p-1)+2:cum_rang_nombre_turbine(p)+1));
        sd(i,p+1)  = std(Matrice_nb(i,cum_rang_nombre_turbine(p-1)+2:cum_rang_nombre_turbine(p)+1))/median(Matrice_nb(i,cum_rang_nombre_turbine(p-1)+2:cum_rang_nombre_turbine(p)+1));
%         ecart(i,p+1) = (max(Matrice_nb(i,cum_rang_nombre_turbine(p-1)+2:cum_rang_nombre_turbine(p)+1)) - min(Matrice_nb(i,cum_rang_nombre_turbine(p-1)+2:cum_rang_nombre_turbine(p)+1)));
%         sd(i,p+1)  = std(Matrice_nb(i,cum_rang_nombre_turbine(p-1)+2:cum_rang_nombre_turbine(p)+1));
    end
end

[rang_nan,lie_nan] = find(isnan(ecart(:,2:rang_parc+1)));
[cq,~] = size(rang_nan);
for i = 1:cq
    ecart(rang_nan(i),lie_nan(i)+1) = 0;
end
ecart(rang_nan,lie_nan+1) = 0;

for i = 1:rang_code_status_defaillance1_sans_identique
    ecart(i,end) = max(ecart(i,2:end-1));
    sd(i,end) = max(sd(i,2:end-1));
end

F = sortrows(ecart,-(rang_parc+2));
G = sortrows(ecart,-(rang_parc+2));

figure;
imagesc(F(1:20,2:rang_parc+1));
colormap(flipud(gray));
colorbar;
title('(Max - Min)/median');
ylabel('code status defaillance');
xlabel('parc');
set(gca,'Ytick',(1:20));
set(gca,'YTickLabel',F(1:20,1));
set(gca,'Xtick',(1:rang_parc));
set(gca,'XTickLabel',parc(:,1));

figure
for i = 1:20
    plot(F(i,2:end-1));
    title('(Max - Min)/median');
    ylabel('code status defaillance');
    xlabel('parc');
    set(gca,'Xtick',(1:rang_parc));
    set(gca,'XTickLabel',parc(:,1));
    hold on;
end
legend(num2str(F(1:20,1)));

% --- Executes on button press in ecart_type.
function ecart_type_Callback(hObject, eventdata, handles)
% hObject    handle to ecart_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rang_parc;
global rang_nombre_turbine;
global rang_code_status_defaillance1_sans_identique;
global double_code_status_defaillance1_sans_identique;
global parc;
global Matrice_nb;
global F;
global G;
global code_status;


if(isempty(Matrice_nb))
    ss = 0;
    for p = 1:rang_parc
        ss = ss+rang_nombre_turbine(p).data;
    end
    pp = 0;
    Matrice_nb = zeros(rang_code_status_defaillance1_sans_identique,ss+1);
    Matrice_nb(:,1) = double_code_status_defaillance1_sans_identique;
    for p = 1:rang_parc
        for i = pp+1 : pp+rang_nombre_turbine(p).data
            for j = 1 :rang_code_status_defaillance1_sans_identique
                for k = 1 :code_status(p).status(i-pp).rang
                    if(Matrice_nb(j,1)==str2num(char(code_status(p).status(i-pp).status(k,1))))
                        Matrice_nb(j,i+1) = Matrice_nb(j,i+1)+1;
                    end
                end
                %            Matrice_nb(j,i+1) = Matrice_nb(j,i+1)/periode_jour(p).data;
            end
        end
        pp = pp + rang_nombre_turbine(p).data;
    end
    
    for i = 1 : rang_code_status_defaillance1_sans_identique
        Matrice_nb(i,ss+2) = sum(Matrice_nb(i,2:ss+1));
    end
    
    [rang_trouver_1,lie_trouver_1] = find(Matrice_nb(:,2:end) ==0);
    [rang_rang_trouver1,~] = size(rang_trouver_1);
    for i = 1 : rang_rang_trouver1
        Matrice_nb(rang_trouver_1(i),lie_trouver_1(i)+1)=1;
    end
end

for p = 1:rang_parc
    m_rang_nombre_turbine(p) = rang_nombre_turbine(p).data;
    cum_rang_nombre_turbine(p) = sum(m_rang_nombre_turbine(1,1:p));
end
global i;
for p = 1:rang_parc
    ecart= zeros(rang_code_status_defaillance1_sans_identique,rang_parc+2);
    sd = zeros(rang_code_status_defaillance1_sans_identique,rang_parc+2);
    ecart(:,1) = double_code_status_defaillance1_sans_identique;
    sd(:,1) = double_code_status_defaillance1_sans_identique;
end



for i = 1:rang_code_status_defaillance1_sans_identique
    ecart(i,2) = max(Matrice_nb(i,2:cum_rang_nombre_turbine(1)+1)) - min(Matrice_nb(i,2:cum_rang_nombre_turbine(1)+1));
    sd(i,2)  = std(Matrice_nb(i,2:cum_rang_nombre_turbine(1)+1));
    for p = 2:rang_parc
        ecart(i,p+1) = max(Matrice_nb(i,cum_rang_nombre_turbine(p-1)+2:cum_rang_nombre_turbine(p)+1)) - min(Matrice_nb(i,cum_rang_nombre_turbine(p-1)+2:cum_rang_nombre_turbine(p)+1));
        sd(i,p+1)  = std(Matrice_nb(i,cum_rang_nombre_turbine(p-1)+2:cum_rang_nombre_turbine(p)+1));
    end
end

for i = 1:rang_code_status_defaillance1_sans_identique
    ecart(i,end) = sum(ecart(i,2:end-1));
    sd(i,end) = sum(sd(i,2:end-1));
end

F = sortrows(ecart,-(rang_parc+2));
G = sortrows(ecart,-(rang_parc+2));


figure;
imagesc(G(1:20,2:rang_parc+1));
colormap(flipud(gray));
colorbar;
title('Ecart type');
ylabel('code status defaillance');
xlabel('parc');
set(gca,'Ytick',(1:20));
set(gca,'YTickLabel',G(1:20,1));
set(gca,'Xtick',(1:rang_parc));
set(gca,'XTickLabel',parc(:,1));
