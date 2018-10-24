function varargout = vent_shaft_properties(varargin)
% VENT_SHAFT_PROPERTIES MATLAB code for vent_shaft_properties.fig
%      VENT_SHAFT_PROPERTIES, by itself, creates a new VENT_SHAFT_PROPERTIES or raises the existing
%      singleton*.
%
%      H = VENT_SHAFT_PROPERTIES returns the handle to a new VENT_SHAFT_PROPERTIES or the handle to
%      the existing singleton*.
%
%      VENT_SHAFT_PROPERTIES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VENT_SHAFT_PROPERTIES.M with the given input arguments.
%
%      VENT_SHAFT_PROPERTIES('Property','Value',...) creates a new VENT_SHAFT_PROPERTIES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before vent_shaft_properties_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to vent_shaft_properties_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help vent_shaft_properties

% Last Modified by GUIDE v2.5 24-Oct-2018 14:28:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @vent_shaft_properties_OpeningFcn, ...
                   'gui_OutputFcn',  @vent_shaft_properties_OutputFcn, ...
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


% --- Executes just before vent_shaft_properties is made visible.
function vent_shaft_properties_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to vent_shaft_properties (see VARARGIN)

% Choose default command line output for vent_shaft_properties
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes vent_shaft_properties wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%Initial values
global SVS

%Section number
vent_sections=SVS.INPUT_GEOMETRY.vent_sections(:,1)';
set(handles.popupmenu1,'String',vent_sections);
set(handles.popupmenu1,'Value',1);

%Segment number
n_seg=SVS.VENT_SECTIONS{1}.n_segments;
seg_list=[1:n_seg]';
set(handles.popupmenu5,'String',num2str(seg_list));
set(handles.popupmenu5,'Value',1);

%Form 5A
c=SVS.VENT_SECTIONS{1}.id_title;
set(handles.edit1,'String',c);

c=SVS.VENT_SECTIONS{1}.section_type;
if isempty(c)==0
    set(handles.popupmenu2,'Value',c);
else
    set(handles.popupmenu2,'Value',1);
end

%Form 5B
c=SVS.VENT_SECTIONS{1}.n_subsegments;
set(handles.edit3,'String',c);

c=SVS.VENT_SECTIONS{1}.grate_free_area;
set(handles.edit4,'String',c);

c=SVS.VENT_SECTIONS{1}.design_max_velocity;
set(handles.edit5,'String',c);

c=SVS.VENT_SECTIONS{1}.wall_surf_temp;
set(handles.edit6,'String',c);

c=SVS.VENT_SECTIONS{1}.initial_dry_bulb_temp;
set(handles.edit7,'String',c);

c=SVS.VENT_SECTIONS{1}.initial_wet_bulb_temp;
set(handles.edit8,'String',c);

%Form 5C
c=SVS.VENT_SECTIONS{1}.fan_type;
if isempty(c)==0
    set(handles.popupmenu3,'Value',c+1);
else
    set(handles.popupmenu3,'Value',1);
end

c=SVS.VENT_SECTIONS{1}.t_switch_on;
set(handles.edit9,'String',c);

c=SVS.VENT_SECTIONS{1}.t_switch_off;
set(handles.edit10,'String',c);

c=SVS.VENT_SECTIONS{1}.direction;
if isempty(c)==0
    
    switch c
        case 0
            set(handles.popupmenu4,'Value',1)
        case -1
            set(handles.popupmenu4,'Value',2)
        case 1
            set(handles.popupmenu4,'Value',3)
    end
else
    set(handles.popupmenu4,'Value',1);
end

%Form 5D
c=SVS.VENT_SECTIONS{1}.segments{1}.lenght;
set(handles.edit11,'String',c);

c=SVS.VENT_SECTIONS{1}.segments{1}.area;
set(handles.edit12,'String',c);

c=SVS.VENT_SECTIONS{1}.segments{1}.head_loss_positive_foward_lim;
set(handles.edit13,'String',c);

c=SVS.VENT_SECTIONS{1}.segments{1}.head_loss_positive_backward_lim;
set(handles.edit14,'String',c);

c=SVS.VENT_SECTIONS{1}.segments{1}.head_loss_negative_foward_lim;
set(handles.edit15,'String',c);

c=SVS.VENT_SECTIONS{1}.segments{1}.head_loss_negative_backward_lim;
set(handles.edit16,'String',c);

% --- Outputs from this function are returned to the command line.
function varargout = vent_shaft_properties_OutputFcn(hObject, eventdata, handles) 
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
m=1;
refresh(n,m,handles)
%Segment number
n_seg=SVS.VENT_SECTIONS{n}.n_segments;
seg_list=[1:n_seg]';
set(handles.popupmenu5,'string',num2str(seg_list));
set(handles.popupmenu5,'Value',1);


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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
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



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
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
n=get(handles.popupmenu1,'Value');
m=get(handles.popupmenu5,'Value');

%Form 5A
val=get(handles.edit1,'String');
SVS.VENT_SECTIONS{n}.id_title=val;

val=get(handles.popupmenu2,'Value');
SVS.VENT_SECTIONS{n}.section_type=val;

%Form 5B
val=get(handles.edit3,'String');
SVS.VENT_SECTIONS{n}.n_subsegments=val;

val=get(handles.edit4,'String');
SVS.VENT_SECTIONS{n}.grate_free_area=val;

val=get(handles.edit5,'String');
SVS.VENT_SECTIONS{n}.design_max_velocity=val;

val=get(handles.edit6,'String');
SVS.VENT_SECTIONS{n}.wall_surf_temp=val;

val=get(handles.edit7,'String');
SVS.VENT_SECTIONS{n}.initial_dry_bulb_temp=val;

val=get(handles.edit8,'String');
SVS.VENT_SECTIONS{n}.initial_wet_bulb_temp=val;

val=get(handles.popupmenu3,'Value')-1;
SVS.VENT_SECTIONS{n}.fan_type=val;

val=get(handles.edit9,'String');
SVS.VENT_SECTIONS{n}.t_switch_on=val;

val=get(handles.edit10,'String');
SVS.VENT_SECTIONS{n}.t_switch_off=val;

val=get(handles.popupmenu4,'Value');
switch val
    case 1
        SVS.VENT_SECTIONS{n}.direction=0;
    case 2
        SVS.VENT_SECTIONS{n}.direction=-1;
    case 3
        SVS.VENT_SECTIONS{n}.direction=1;
end

val=get(handles.edit11,'String');
SVS.VENT_SECTIONS{n}.segments{m}.lenght=val;

val=get(handles.edit12,'String');
SVS.VENT_SECTIONS{n}.segments{m}.area=val;

val=get(handles.edit13,'String');
SVS.VENT_SECTIONS{n}.segments{m}.head_loss_positive_foward_lim=val;

val=get(handles.edit14,'String');
SVS.VENT_SECTIONS{n}.segments{m}.head_loss_positive_backward_lim=val;

val=get(handles.edit15,'String');
SVS.VENT_SECTIONS{n}.segments{m}.head_loss_negative_foward_lim=val;

val=get(handles.edit16,'String');
SVS.VENT_SECTIONS{n}.segments{m}.head_loss_negative_backward_lim=val;







% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(vent_shaft_properties)

% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5
global SVS
n=get(handles.popupmenu1,'Value');
m=get(handles.popupmenu5,'Value');
refresh(n,m,handles)
%Segment number
n_seg=SVS.VENT_SECTIONS{n}.n_segments;
seg_list=[1:n_seg]';
set(handles.popupmenu5,'string',num2str(seg_list));
set(handles.popupmenu5,'Value',m);
refresh(n,m,handles)

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



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function refresh(n,m,handles)
    global SVS
    
    %Form 5A
c=SVS.VENT_SECTIONS{n}.id_title;
set(handles.edit1,'String',c);

c=SVS.VENT_SECTIONS{n}.section_type;
if isempty(c)==0
    set(handles.popupmenu2,'Value',c);
else
    set(handles.popupmenu2,'Value',1);
end

%Form 5B
c=SVS.VENT_SECTIONS{n}.n_subsegments;
set(handles.edit3,'String',c);

c=SVS.VENT_SECTIONS{n}.grate_free_area;
set(handles.edit4,'String',c);

c=SVS.VENT_SECTIONS{n}.design_max_velocity;
set(handles.edit5,'String',c);

c=SVS.VENT_SECTIONS{n}.wall_surf_temp;
set(handles.edit6,'String',c);

c=SVS.VENT_SECTIONS{n}.initial_dry_bulb_temp;
set(handles.edit7,'String',c);

c=SVS.VENT_SECTIONS{n}.initial_wet_bulb_temp;
set(handles.edit8,'String',c);

%Form 5C
c=SVS.VENT_SECTIONS{n}.fan_type;
if isempty(c)==0
    set(handles.popupmenu3,'Value',c+1);
else
    set(handles.popupmenu3,'Value',1);
end

c=SVS.VENT_SECTIONS{n}.t_switch_on;
set(handles.edit9,'String',c);

c=SVS.VENT_SECTIONS{n}.t_switch_off;
set(handles.edit10,'String',c);

c=SVS.VENT_SECTIONS{n}.direction;
if isempty(c)==0
    
    switch c
        case 0
            set(handles.popupmenu4,'Value',1)
        case -1
            set(handles.popupmenu4,'Value',2)
        case 1
            set(handles.popupmenu4,'Value',3)
    end
else
    set(handles.popupmenu4,'Value',1);
end

%Form 5D
c=SVS.VENT_SECTIONS{n}.segments{m}.lenght;
set(handles.edit11,'String',c);

c=SVS.VENT_SECTIONS{n}.segments{m}.area;
set(handles.edit12,'String',c);

c=SVS.VENT_SECTIONS{n}.segments{m}.head_loss_positive_foward_lim;
set(handles.edit13,'String',c);

c=SVS.VENT_SECTIONS{n}.segments{m}.head_loss_positive_backward_lim;
set(handles.edit14,'String',c);

c=SVS.VENT_SECTIONS{n}.segments{m}.head_loss_negative_foward_lim;
set(handles.edit15,'String',c);

c=SVS.VENT_SECTIONS{n}.segments{m}.head_loss_negative_backward_lim;
set(handles.edit16,'String',c);
    
