function varargout = Z_input(varargin)
% Z_INPUT MATLAB code for Z_input.fig
%      Z_INPUT, by itself, creates a new Z_INPUT or raises the existing
%      singleton*.
%
%      H = Z_INPUT returns the handle to a new Z_INPUT or the handle to
%      the existing singleton*.
%
%      Z_INPUT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Z_INPUT.M with the given input arguments.
%
%      Z_INPUT('Property','Value',...) creates a new Z_INPUT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Z_input_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Z_input_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Z_input

% Last Modified by GUIDE v2.5 30-Apr-2018 13:11:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Z_input_OpeningFcn, ...
                   'gui_OutputFcn',  @Z_input_OutputFcn, ...
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


% --- Executes just before Z_input is made visible.
function Z_input_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Z_input (see VARARGIN)

% Choose default command line output for Z_input
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Z_input wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Z_input_OutputFcn(hObject, eventdata, handles) 
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
Zdatacell= get(handles.uitable1,'Data');
for i=1:80  % number of busses
    for j=1:4   
        Zdatavalue=cell2mat(Zdatacell(i,j));
        TF = isempty(Zdatavalue);
        if TF==1 
            Zdatavalue='0'
        end
        class(Zdatavalue);
        if class(Zdatavalue)=='char   '
            Zdata(i,j)=str2double(Zdatavalue);
        else
         Zdata(i,j)=(Zdatavalue)
        end;
    end
end
uisave('Zdata')

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A=uigetfile('*.mat')
load(A);
Zdata=num2cell(Zdata);
assignin('base','Zdata',Zdata);
set(handles.uitable1,'data',Zdata);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Zdatacell= get(handles.uitable1,'Data');
for i=1:80  % number of busses
    for j=1:4   
        Zdatavalue=cell2mat(Zdatacell(i,j));
        TF = isempty(Zdatavalue);
        if TF==1 
            Zdatavalue='0'
        end
        class(Zdatavalue);
        if class(Zdatavalue)=='char  '
            Zdata(i,j)=str2double(Zdatavalue);
        else
         Zdata(i,j)=(Zdatavalue);
        end
    end
end

assignin('base','Zdata',Zdata);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Zdata = evalin('base','Zdata');

fb = Zdata(:,1);             % From bus number...
tb = Zdata(:,2);             % To bus number...

x12 = Zdata(:,3);              % Reactance, X...
x0 = Zdata(:,4);              % Reactance, X...

z12 = i*x12;                    % z matrix...
z0 =  i*x0;                    % z matrix...

y12 = 1./z12;                       % To get inverse of each element...
y0 = 1./z0;                       % To get inverse of each element...

nbus=evalin('base','nbus');

Y12 = zeros(nbus,nbus);
Y0 = zeros(nbus,nbus);

% Formation of the Off Diagonal Elements...
 for k = 1:80
    
     if fb(k)==0 
         fb(k)=80;
     end
     if tb(k)==0 
         tb(k)=80;
     end
     
     Y12(fb(k),tb(k)) =  - y12(k);
     Y12(tb(k),fb(k)) = Y12(fb(k),tb(k));
     
   
     Y0(fb(k),tb(k)) =  - y0(k);
     Y0(tb(k),fb(k)) = Y0(fb(k),tb(k));
     
 end
 
 % Formation of Diagonal Elements....
 for m = 1:nbus
     for n = 1:80
         if fb(n)==0 
         fb(n)=80;
     end
     if tb(n)==0 
         tb(n)=80;
     end
         if fb(n) == m
                      
             Y12(m,m) = (Y12(m,m) + y12(n));
              Y0(m,m) = (Y0(m,m) + y0(n));
             
         elseif tb(n) == m
             Y12(m,m) = (Y12(m,m) + y12(n));
              Y0(m,m) = (Y0(m,m) + y0(n));
           
         end
     end
 end
 
 for p=1:nbus
     for k=1:nbus
     Y_12(p,k)=Y12(p,k);
     Y_0(p,k)=Y0(p,k);
     end
 end
 
Z12=inv(Y_12);
Z0=inv(Y_0);

 assignin('base','Y12',Y12);
 assignin('base','Y0',Y0);
 assignin('base','Z12',Z12);
 assignin('base','Z0',Z0);
 
V=evalin('base','V');
Zf=evalin('base','KD_empedans');

Vbase=evalin('base','Vbase'); % base voltage KV
Sbase=evalin('base','Sbase') ;% Base S MVA

Ibase = Sbase*10e6/(sqrt(3)*Vbase*1e3);



for n=1:nbus
IKD_sym(n)=V(n)/(Z12(n,n)+Zf);    
IKD_sym_mag(n)=abs(IKD_sym(n));

IKD_faz_toprak(n)= 3*V(n)/(2*Z12(n,n)+Z0(n,n)+3*Zf);  % dengesiz ariza tipi 1
IKD_faz_toprak_mag(n)=abs(IKD_faz_toprak(n));

IKD_faz_faz(n)=-1*i*sqrt(3)*(V(n)/(2*Z12(n,n)+Zf));   % dengesiz ariza tipi 2
IKD_faz_faz_mag(n)=abs(IKD_faz_faz(n));
IKD_2faz_toprak_1(n)=V(n)/(Z12(n,n)+((Z12(n,n)*(Z0(n,n)+3*Zf))/(Z12(n,n)+Z0(n,n)+3*Zf)));

aragecis(n)=(Z12(n,n).*IKD_2faz_toprak_1(n));
IKD_2faz_toprak_0(n)=(V(n)-aragecis(n))/(Z0(n,n)+3*Zf);

IKD_2faz_toprak(n)=3*IKD_2faz_toprak_0(n);  % dengesiz ariza tipi 3
IKD_2faz_toprak_mag(n)=abs(IKD_2faz_toprak(n));

max_akim(n)=max(IKD_sym(n),max(abs(IKD_faz_toprak(n)),max(abs(IKD_faz_faz(n)),abs(IKD_2faz_toprak(n)))));

max_akim_amp(n)=abs(max_akim(n))*Ibase;  %Amper

SC_capacity_pu(n)=abs(V(n)*max_akim(n)*sqrt(3)) ;% pu
SC_capacity(n)=SC_capacity_pu(n)*Sbase ; % MVA


end

KD_sonuc=[IKD_sym_mag; IKD_faz_toprak_mag; IKD_faz_faz_mag; IKD_2faz_toprak_mag;max_akim;max_akim_amp;SC_capacity ];
KD_sonuc=transpose(KD_sonuc);
 

 assignin('base','IKD_faz_toprak',IKD_faz_toprak);
 assignin('base','IKD_faz_faz',IKD_faz_faz);
 assignin('base','IKD_2faz_toprak',IKD_2faz_toprak);
 assignin('base','max_akim',max_akim);
 assignin('base','IKD_sym',IKD_sym);
 assignin('base','max_akim_amp',max_akim_amp);
 assignin('base','SC_capacity',SC_capacity);
 assignin('base','KD_sonuc',KD_sonuc);
 
 sonuc2
 


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Z_input
