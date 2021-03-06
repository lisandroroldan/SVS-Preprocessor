function varargout = node_properties_gui(varargin)
% NODE_PROPERTIES_GUI MATLAB code for node_properties_gui.fig
%      NODE_PROPERTIES_GUI, by itself, creates a new NODE_PROPERTIES_GUI or raises the existing
%      singleton*.
%
%      H = NODE_PROPERTIES_GUI returns the handle to a new NODE_PROPERTIES_GUI or the handle to
%      the existing singleton*.
%
%      NODE_PROPERTIES_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NODE_PROPERTIES_GUI.M with the given input arguments.
%
%      NODE_PROPERTIES_GUI('Property','Value',...) creates a new NODE_PROPERTIES_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before node_properties_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to node_properties_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help node_properties_gui

% Last Modified by GUIDE v2.5 25-Oct-2018 12:17:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @node_properties_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @node_properties_gui_OutputFcn, ...
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


% --- Executes just before node_properties_gui is made visible.
function node_properties_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to node_properties_gui (see VARARGIN)

% Choose default command line output for node_properties_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes node_properties_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%Initial values
global SVS

%Section number
nodes=SVS.INPUT_GEOMETRY.nodes(:,1)';
set(handles.popupmenu1,'string',nodes);
set(handles.popupmenu1,'Value',1);

c=SVS.NODES{1}.aerodynamic_type+1;
if isempty(c)==0
    set(handles.popupmenu2,'Value',c);
else
    set(handles.popupmenu2,'Value',1);
end

c=SVS.NODES{1}.thermodynamic_type;
if isempty(c)==0
    set(handles.popupmenu3,'Value',c);
else
    set(handles.popupmenu3,'Value',1);
end

SVS.NODES{1}.node_prop=node_prop_class_def(1);

% --- Outputs from this function are returned to the command line.
function varargout = node_properties_gui_OutputFcn(hObject, eventdata, handles) 
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
global SVS
n=get(handles.popupmenu1,'Value');

c=SVS.NODES{n}.aerodynamic_type+1;
    if isempty(c)==0
    set(handles.popupmenu2,'Value',c);
    else
    set(handles.popupmenu2,'Value',1);
    end
c=SVS.NODES{n}.thermodynamic_type;
    if isempty(c)==0
    set(handles.popupmenu3,'Value',c);
    else
    set(handles.popupmenu3,'Value',1);
    end


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


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
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
n=get(handles.popupmenu1,'Value');

val=get(handles.popupmenu2,'Value')-1;
SVS.NODES{n}.aerodynamic_type=val;

val=get(handles.popupmenu3,'Value');
SVS.NODES{n}.thermodynamic_type=val;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(node_properties_gui)

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SVS
global aux
n=get(handles.popupmenu1,'Value');
aerodynamic_type=get(handles.popupmenu2,'Value')-1;

if aerodynamic_type~=SVS.NODES{n}.aerodynamic_type;
    SVS.NODES{n}.aerodynamic_type=aerodynamic_type;
    SVS.NODES{n}.node_prop=node_prop_class_def(aerodynamic_type);
end
    
aux=n;
edit_prop(aerodynamic_type);



function edit_prop(i)

    switch i
        case 0
        case 1
            form_6c
        case 2
            form_6d
        case 3
            form_6e
        case 4
            form_6f
        case 5
            form_6g
        case 6
            form_6i
        case 7
        case 8
            form_6j
    end
            
function edit_prop_thermo(i)

    switch i
        case 1
        case 2
            form_6h
        case 3
            form_6b
    end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global SVS
global aux
n=get(handles.popupmenu1,'Value');
thermodynamic_type=get(handles.popupmenu3,'Value');

if thermodynamic_type~=SVS.NODES{n}.thermodynamic_type;
    SVS.NODES{n}.thermodynamic_type=thermodynamic_type;
    SVS.NODES{n}.node_prop_thermo=node_prop_thermo_class_def(thermodynamic_type);
end
    
aux=n;
edit_prop_thermo(thermodynamic_type);
