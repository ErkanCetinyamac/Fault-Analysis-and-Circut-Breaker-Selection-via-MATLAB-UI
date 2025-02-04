function varargout = sonuc3(varargin)
% SONUC3 MATLAB code for sonuc3.fig
%      SONUC3, by itself, creates a new SONUC3 or raises the existing
%      singleton*.
%
%      H = SONUC3 returns the handle to a new SONUC3 or the handle to
%      the existing singleton*.
%
%      SONUC3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SONUC3.M with the given input arguments.
%
%      SONUC3('Property','Value',...) creates a new SONUC3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sonuc3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sonuc3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sonuc3

% Last Modified by GUIDE v2.5 01-May-2018 08:00:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sonuc3_OpeningFcn, ...
                   'gui_OutputFcn',  @sonuc3_OutputFcn, ...
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


% --- Executes just before sonuc3 is made visible.
function sonuc3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sonuc3 (see VARARGIN)

% Choose default command line output for sonuc3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sonuc3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sonuc3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function uitable2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
