function varargout = form_1d(varargin)
% FORM_1D MATLAB code for form_1d.fig
%      FORM_1D, by itself, creates a new FORM_1D or raises the existing
%      singleton*.
%
%      H = FORM_1D returns the handle to a new FORM_1D or the handle to
%      the existing singleton*.
%
%      FORM_1D('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORM_1D.M with the given input arguments.
%
%      FORM_1D('Property','Value',...) creates a new FORM_1D or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before form_1d_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to form_1d_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help form_1d

% Last Modified by GUIDE v2.5 22-Oct-2018 11:41:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @form_1d_OpeningFcn, ...
                   'gui_OutputFcn',  @form_1d_OutputFcn, ...
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


% --- Executes just before form_1d is made visible.
function form_1d_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to form_1d (see VARARGIN)

% Choose default command line output for form_1d
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes form_1d wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global SVS

set(handles.text10,'String',num2str(SVS.GENERAL_DATA.n_line_segments));
set(handles.text11,'String',num2str(SVS.GENERAL_DATA.n_sections));
set(handles.text12,'String',num2str(SVS.GENERAL_DATA.n_vents));
set(handles.text13,'String',num2str(SVS.GENERAL_DATA.n_nodes));
set(handles.text14,'String',num2str(SVS.GENERAL_DATA.n_br_junct));

% --- Outputs from this function are returned to the command line.
function varargout = form_1d_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(form_1d)


% --- Executes during object creation, after setting all properties.
function text10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
