function varargout = form_6h(varargin)
% FORM_6H MATLAB code for form_6h.fig
%      FORM_6H, by itself, creates a new FORM_6H or raises the existing
%      singleton*.
%
%      H = FORM_6H returns the handle to a new FORM_6H or the handle to
%      the existing singleton*.
%
%      FORM_6H('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORM_6H.M with the given input arguments.
%
%      FORM_6H('Property','Value',...) creates a new FORM_6H or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before form_6h_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to form_6h_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help form_6h

% Last Modified by GUIDE v2.5 25-Oct-2018 15:42:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @form_6h_OpeningFcn, ...
                   'gui_OutputFcn',  @form_6h_OutputFcn, ...
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


% --- Executes just before form_6h is made visible.
function form_6h_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to form_6h (see VARARGIN)

% Choose default command line output for form_6h
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes form_6h wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global SVS
global aux

 I = imread('img/node_thermo_type2.png');
 axes(handles.axes1);
 imshow(I);
 
%Branches
branches=SVS.NODES{aux}.branches;

set(handles.popupmenu1,'String',branches);
set(handles.popupmenu2,'String',branches);
set(handles.popupmenu3,'String',branches);
set(handles.popupmenu4,'String',branches);
set(handles.popupmenu5,'String',branches);

c=SVS.NODES{aux}.node_prop_thermo.branches_a;
if isempty(c)==0
    c=SVS.NODES{aux}.node_prop_thermo.branches_a(1);
    set(handles.popupmenu1,'Value',c);
else
    set(handles.popupmenu1,'Value',1);
end

c=SVS.NODES{aux}.node_prop_thermo.branches_a;
if isempty(c)==0
    c=SVS.NODES{aux}.node_prop_thermo.branches_a(2);
    set(handles.popupmenu2,'Value',c);
else
    set(handles.popupmenu2,'Value',1);
end

c=SVS.NODES{aux}.node_prop_thermo.branch_b;
if isempty(c)==0
    set(handles.popupmenu3,'Value',c);
else
    set(handles.popupmenu3,'Value',1);
end

c=SVS.NODES{aux}.node_prop_thermo.branches_c;
if isempty(c)==0
    c=SVS.NODES{aux}.node_prop_thermo.branches_c(1);
    set(handles.popupmenu4,'Value',c);
else
    set(handles.popupmenu4,'Value',1);
end

c=SVS.NODES{aux}.node_prop_thermo.branches_c;
if isempty(c)==0
    c=SVS.NODES{aux}.node_prop_thermo.branches_c(2);
    set(handles.popupmenu5,'Value',c);
else
    set(handles.popupmenu5,'Value',1);
end




% --- Outputs from this function are returned to the command line.
function varargout = form_6h_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
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

branches_a=zeros(2,1);
branches_c=zeros(2,1);

branches_a(1)=get(handles.popupmenu1,'Value');
branches_a(2)=get(handles.popupmenu2,'Value');
branch_b=get(handles.popupmenu3,'Value');
branches_c(1)=get(handles.popupmenu4,'Value');
branches_c(2)=get(handles.popupmenu5,'Value');

SVS.NODES{aux}.node_prop_thermo.branches_a=branches_a;
SVS.NODES{aux}.node_prop_thermo.branch_b=branch_b;
SVS.NODES{aux}.node_prop_thermo.branches_c=branches_c;

close(form_6h)




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(form_6h);


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
