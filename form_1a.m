function varargout = form_1a(varargin)
% FORM_1A MATLAB code for form_1a.fig
%      FORM_1A, by itself, creates a new FORM_1A or raises the existing
%      singleton*.
%
%      H = FORM_1A returns the handle to a new FORM_1A or the handle to
%      the existing singleton*.
%
%      FORM_1A('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORM_1A.M with the given input arguments.
%
%      FORM_1A('Property','Value',...) creates a new FORM_1A or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before form_1a_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to form_1a_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help form_1a

% Last Modified by GUIDE v2.5 19-Oct-2018 16:23:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @form_1a_OpeningFcn, ...
                   'gui_OutputFcn',  @form_1a_OutputFcn, ...
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


% --- Executes just before form_1a is made visible.
function form_1a_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to form_1a (see VARARGIN)

% Choose default command line output for form_1a
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes form_1a wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global SVS
    if isfield(SVS,'GENERAL_DATA')==1
        if isfield(SVS.GENERAL_DATA,'sys_id')==1
            set(handles.edit1,'string',SVS.GENERAL_DATA.sys_id);
        else
            set(handles.edit1,'string','eg. Buenos Aires RER network');
        end
        if isfield(SVS.GENERAL_DATA,'add_tit')==1
            set(handles.edit2,'string',SVS.GENERAL_DATA.add_tit);
        else
            set(handles.edit2,'string','eg. Caso 1: Analisis de confort');
        end        
    else
        set(handles.edit1,'string','eg. Buenos Aires RER network');
        set(handles.edit2,'string','eg. Caso 1: Analisis de confort');  
    end

% --- Outputs from this function are returned to the command line.
function varargout = form_1a_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global SVS
    SVS.GENERAL_DATA.sys_id  = get(handles.edit1, 'String');
    SVS.GENERAL_DATA.add_tit = get(handles.edit2, 'String');
    close(form_1a);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    close(form_1a);


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
