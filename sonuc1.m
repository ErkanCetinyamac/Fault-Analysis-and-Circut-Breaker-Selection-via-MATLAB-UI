function varargout = sonuc1(varargin)
% SONUC1 MATLAB code for sonuc1.fig
%      SONUC1, by itself, creates a new SONUC1 or raises the existing
%      singleton*.
%
%      H = SONUC1 returns the handle to a new SONUC1 or the handle to
%      the existing singleton*.
%
%      SONUC1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SONUC1.M with the given input arguments.
%
%      SONUC1('Property','Value',...) creates a new SONUC1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sonuc1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sonuc1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sonuc1

% Last Modified by GUIDE v2.5 03-May-2018 13:15:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sonuc1_OpeningFcn, ...
                   'gui_OutputFcn',  @sonuc1_OutputFcn, ...
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


% --- Executes just before sonuc1 is made visible.
function sonuc1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sonuc1 (see VARARGIN)

% Choose default command line output for sonuc1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sonuc1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

sonuc1=evalin('base','sonuc1_data');
sonuc1=num2cell(sonuc1);
set(handles.uitable1,'data',sonuc1);

sonuc2=evalin('base','sonuc2_data');
sonuc2=num2cell(sonuc2);
set(handles.uitable2,'data',sonuc2);


% --- Outputs from this function are returned to the command line.
function varargout = sonuc1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function uitable2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
