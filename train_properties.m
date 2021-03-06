function varargout = train_properties(varargin)
% TRAIN_PROPERTIES MATLAB code for train_properties.fig
%      TRAIN_PROPERTIES, by itself, creates a new TRAIN_PROPERTIES or raises the existing
%      singleton*.
%
%      H = TRAIN_PROPERTIES returns the handle to a new TRAIN_PROPERTIES or the handle to
%      the existing singleton*.
%
%      TRAIN_PROPERTIES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRAIN_PROPERTIES.M with the given input arguments.
%
%      TRAIN_PROPERTIES('Property','Value',...) creates a new TRAIN_PROPERTIES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before train_properties_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to train_properties_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help train_properties

% Last Modified by GUIDE v2.5 31-Oct-2018 17:06:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @train_properties_OpeningFcn, ...
                   'gui_OutputFcn',  @train_properties_OutputFcn, ...
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


% --- Executes just before train_properties is made visible.
function train_properties_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to train_properties (see VARARGIN)

% Choose default command line output for train_properties
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes train_properties wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global SVS;
global aux;

if isfield(SVS,'TRAIN_DATA')==1
    n_trains=size(SVS.TRAIN_DATA,2);
    for i=1:n_trains
        train_id{i}=SVS.TRAIN_DATA{i}.train_id;
    end  
    set(handles.popupmenu1,'String',train_id);
else
    set(handles.popupmenu1,'String','Empty');
end


% --- Outputs from this function are returned to the command line.
function varargout = train_properties_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SVS
global aux

if isfield(SVS,'TRAIN_DATA')==1
    aux=get(handles.popupmenu1,'Value');
    form_9
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SVS
global aux
if isfield(SVS,'TRAIN_DATA')==0
    aux=1;
    SVS.TRAIN_DATA{aux}=train_class(aux);
else
    aux=size(SVS.TRAIN_DATA,2)+1;
    SVS.TRAIN_DATA{aux}=train_class(aux);
end
form_9

if isfield(SVS,'TRAIN_DATA')==1
    n_trains=size(SVS.TRAIN_DATA,2);
    for i=1:n_trains
        train_id{i}=SVS.TRAIN_DATA{i}.train_id;
    end  
    set(handles.popupmenu1,'String',train_id);
else
    set(handles.popupmenu1,'String','Empty');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(form_9)
