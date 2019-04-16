function varargout = sonuc4(varargin)
% SONUC4 MATLAB code for sonuc4.fig
%      SONUC4, by itself, creates a new SONUC4 or raises the existing
%      singleton*.
%
%      H = SONUC4 returns the handle to a new SONUC4 or the handle to
%      the existing singleton*.
%
%      SONUC4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SONUC4.M with the given input arguments.
%
%      SONUC4('Property','Value',...) creates a new SONUC4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sonuc4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sonuc4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sonuc4

% Last Modified by GUIDE v2.5 03-May-2018 13:49:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sonuc4_OpeningFcn, ...
                   'gui_OutputFcn',  @sonuc4_OutputFcn, ...
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


% --- Executes just before sonuc4 is made visible.
function sonuc4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sonuc4 (see VARARGIN)

% Choose default command line output for sonuc4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sonuc4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
sonuc4=evalin('base','KD_sym_sonuc');
sonuc4=num2cell(sonuc4);
set(handles.uitable1,'data',sonuc4);

% --- Outputs from this function are returned to the command line.
function varargout = sonuc4_OutputFcn(hObject, eventdata, handles) 
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
close sonuc4
