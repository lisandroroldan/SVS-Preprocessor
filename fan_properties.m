function varargout = fan_properties(varargin)
% FAN_PROPERTIES MATLAB code for fan_properties.fig
%      FAN_PROPERTIES, by itself, creates a new FAN_PROPERTIES or raises the existing
%      singleton*.
%
%      H = FAN_PROPERTIES returns the handle to a new FAN_PROPERTIES or the handle to
%      the existing singleton*.
%
%      FAN_PROPERTIES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FAN_PROPERTIES.M with the given input arguments.
%
%      FAN_PROPERTIES('Property','Value',...) creates a new FAN_PROPERTIES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fan_properties_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fan_properties_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fan_properties

% Last Modified by GUIDE v2.5 29-Oct-2018 11:04:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fan_properties_OpeningFcn, ...
                   'gui_OutputFcn',  @fan_properties_OutputFcn, ...
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


% --- Executes just before fan_properties is made visible.
function fan_properties_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fan_properties (see VARARGIN)

% Choose default command line output for fan_properties
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fan_properties wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global SVS;
global aux;

if isfield(SVS,'FAN_TYPES')==1
    n_fans=size(SVS.FAN_TYPES,2);
    for i=1:n_fans
        fan_id{i}=SVS.FAN_TYPES{i}.fan_identification;
    end  
    set(handles.popupmenu1,'String',fan_id);
else
    set(handles.popupmenu1,'String','Empty');
end
  
if isfield(SVS,'AIR_CURTAINS')==1
    n_fans=size(SVS.AIR_CURTAINS,2);
    for i=1:n_fans
        airc_id{i}=SVS.AIR_CURTAINS{i}.air_curtain_id;
    end  
    set(handles.popupmenu2,'String',airc_id);
else
    set(handles.popupmenu2,'String','Empty');
end
        

% --- Outputs from this function are returned to the command line.
function varargout = fan_properties_OutputFcn(hObject, eventdata, handles) 
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

if isfield(SVS,'FAN_TYPES')==1
    aux=get(handles.popupmenu1,'Value');
    form_7
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(fan_properties)


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
global SVS
global aux
if isfield(SVS,'FAN_TYPES')==0
    aux=1;
    SVS.FAN_TYPES{aux}=fan_class(aux);
else
    aux=size(SVS.FAN_TYPES,2)+1;
    SVS.FAN_TYPES{aux}=fan_class(aux);
end
form_7

if isfield(SVS,'FAN_TYPES')==1
    n_fans=size(SVS.FAN_TYPES,2);
    for i=1:n_fans
        fan_id{i}=SVS.FAN_TYPES{i}.fan_identification;
    end  
    set(handles.popupmenu1,'String',fan_id);
else
    set(handles.popupmenu1,'String','Empty');
end
  


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SVS
global aux
if isfield(SVS,'AIR_CURTAINS')==0
    aux=1;
    SVS.AIR_CURTAINS{aux}=air_curtain_class(aux);
else
    aux=size(SVS.AIR_CURTAINS,2)+1;
    SVS.AIR_CURTAINS{aux}=air_curtain_class(aux);
end
form_7d

if isfield(SVS,'AIR_CURTAINS')==1
    n_fans=size(SVS.AIR_CURTAINS,2);
    for i=1:n_fans
        airc_id{i}=SVS.AIR_CURTAINS{i}.air_curtain_id;
    end  
    set(handles.popupmenu2,'String',airc_id);
else
    set(handles.popupmenu2,'String','Empty');
end

% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


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
global SVS
global aux

if isfield(SVS,'AIR_CURTAINS')==1
    aux=get(handles.popupmenu2,'Value');
    form_7d
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SVS






% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
