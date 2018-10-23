function varargout = line_segment_properties(varargin)
% LINE_SEGMENT_PROPERTIES MATLAB code for line_segment_properties.fig
%      LINE_SEGMENT_PROPERTIES, by itself, creates a new LINE_SEGMENT_PROPERTIES or raises the existing
%      singleton*.
%
%      H = LINE_SEGMENT_PROPERTIES returns the handle to a new LINE_SEGMENT_PROPERTIES or the handle to
%      the existing singleton*.
%
%      LINE_SEGMENT_PROPERTIES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LINE_SEGMENT_PROPERTIES.M with the given input arguments.
%
%      LINE_SEGMENT_PROPERTIES('Property','Value',...) creates a new LINE_SEGMENT_PROPERTIES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before line_segment_properties_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to line_segment_properties_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help line_segment_properties

% Last Modified by GUIDE v2.5 23-Oct-2018 15:02:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @line_segment_properties_OpeningFcn, ...
                   'gui_OutputFcn',  @line_segment_properties_OutputFcn, ...
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


% --- Executes just before line_segment_properties is made visible.
function line_segment_properties_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to line_segment_properties (see VARARGIN)

% Choose default command line output for line_segment_properties
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes line_segment_properties wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%Initial values
global SVS

%Section number
line_sections=SVS.INPUT_GEOMETRY.line_sections(:,1)';
set(handles.popupmenu1,'string',line_sections);
set(handles.popupmenu1,'Value',1);

%Segment number
n_seg=SVS.LINE_SECTIONS{1}.n_segments;
seg_list=[1:n_seg]';
set(handles.popupmenu2,'string',num2str(seg_list));
set(handles.popupmenu2,'Value',1);

%Form 3A
c=SVS.LINE_SECTIONS{1}.segments{1}.id_title;
set(handles.edit1,'String',c);


c=SVS.LINE_SECTIONS{1}.segments{1}.line_segment_type;
if isempty(c)==0
    set(handles.popupmenu3,'Value',c);
else
    set(handles.popupmenu3,'Value',1);
end

c=SVS.LINE_SECTIONS{1}.segments{1}.length;
set(handles.edit2,'String',c);

c=SVS.LINE_SECTIONS{1}.segments{1}.cross_section_area;
set(handles.edit3,'String',c);

c=SVS.LINE_SECTIONS{1}.segments{1}.stack_height;
set(handles.edit4,'String',c);

c=SVS.LINE_SECTIONS{1}.segments{1}.fire_segment+1;
if isempty(c)==0
    set(handles.popupmenu4,'Value',c);
else
    set(handles.popupmenu4,'Value',1);
end

c=SVS.LINE_SECTIONS{1}.segments{1}.constant_press_change;
set(handles.edit5,'String',c);

%Form 3B
handles.uitable1.Data=SVS.LINE_SECTIONS{1}.segments{1}.perimeter_roughness_matrix;
handles.uitable1.ColumnWidth={45 45 45 45 45 45 45 45};
handles.uitable1.ColumnEditable=[true,true,true,true,true,true,true,true];

%Form 3C
c=SVS.LINE_SECTIONS{1}.segments{1}.head_loss_positive_foward_lim;
set(handles.edit6,'String',c);

c=SVS.LINE_SECTIONS{1}.segments{1}.head_loss_positive_backward_lim;
set(handles.edit7,'String',c);

c=SVS.LINE_SECTIONS{1}.segments{1}.head_loss_negative_foward_lim;
set(handles.edit8,'String',c);

c=SVS.LINE_SECTIONS{1}.segments{1}.head_loss_negative_backward_lim;
set(handles.edit9,'String',c);

c=SVS.LINE_SECTIONS{1}.segments{1}.wet_wall_surf;
set(handles.edit10,'String',c);

c=SVS.LINE_SECTIONS{1}.segments{1}.n_subsegments;
set(handles.edit11,'String',c);

c=SVS.LINE_SECTIONS{1}.segments{1}.n_steady_heat_sources;
set(handles.edit12,'String',c);

%Form 3D
handles.uitable2.Data=SVS.LINE_SECTIONS{1}.segments{1}.steady_heat_source_prop;
handles.uitable2.ColumnWidth=num2cell(45*ones(1,20));
handles.uitable2.ColumnEditable=true(ones(1,20));

%Form 3E
handles.uitable3.Data=SVS.LINE_SECTIONS{1}.segments{1}.wall_surf_air_prop;
handles.uitable3.ColumnWidth=num2cell(45*ones(1,20));
handles.uitable3.ColumnEditable=true(ones(1,20));

%Form 3F
c=SVS.LINE_SECTIONS{1}.segments{1}.tunnel_wall_thickness;
set(handles.edit13,'String',c);
c=SVS.LINE_SECTIONS{1}.segments{1}.dist_adjacent;
set(handles.edit14,'String',c);
c=SVS.LINE_SECTIONS{1}.segments{1}.tunnel_wall_cond;
set(handles.edit15,'String',c);
c=SVS.LINE_SECTIONS{1}.segments{1}.tunnel_wall_diff;
set(handles.edit16,'String',c);
c=SVS.LINE_SECTIONS{1}.segments{1}.soil_cond;
set(handles.edit17,'String',c);
c=SVS.LINE_SECTIONS{1}.segments{1}.soil_diff;
set(handles.edit18,'String',c);
c=SVS.LINE_SECTIONS{1}.segments{1}.deep_sink_temp;
set(handles.edit19,'String',c);


c=SVS.LINE_SECTIONS{1}.segments{1}.head_loss_negative_backward_lim;
set(handles.edit9,'String',c);  



% c=SVS.LINE_SECTIONS{1}.segments{1}.head_loss_negative_backward_lim;
% set(handles.edit9,'String',c);

% --- Outputs from this function are returned to the command line.
function varargout = line_segment_properties_OutputFcn(hObject, eventdata, handles) 
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
line_sections=SVS.INPUT_GEOMETRY.line_sections(:,1)';
n=get(handles.popupmenu1,'Value');
n_seg=SVS.LINE_SECTIONS{n}.n_segments;
seg_list=[1:n_seg]';
set(handles.popupmenu2,'string',num2str(seg_list));
set(handles.popupmenu2,'Value',1);

refresh(n,1,handles);

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
n=get(handles.popupmenu1,'Value');
m=get(handles.popupmenu2,'Value');
refresh(n,m,handles);

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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SVS

sec=get(handles.popupmenu1,'Value');
seg=get(handles.popupmenu2,'Value');

val=get(handles.edit1, 'String');
SVS.LINE_SECTIONS{sec}.segments{seg}.id_title=val;

val=get(handles.popupmenu3, 'Value');
SVS.LINE_SECTIONS{sec}.segments{seg}.line_segment_type=val;

val=get(handles.edit2, 'String');
SVS.LINE_SECTIONS{sec}.segments{seg}.length=val;

val=get(handles.edit3, 'String');
SVS.LINE_SECTIONS{sec}.segments{seg}.cross_section_area=val;

val=get(handles.edit4, 'String');
SVS.LINE_SECTIONS{sec}.segments{seg}.stack_height=val;

val=get(handles.popupmenu4, 'Value')-1;
SVS.LINE_SECTIONS{sec}.segments{seg}.fire_segment=val;

val=get(handles.edit5, 'String');
SVS.LINE_SECTIONS{sec}.segments{seg}.constant_press_change=val;

val=get(handles.edit6, 'String');
SVS.LINE_SECTIONS{sec}.segments{seg}.head_loss_positive_foward_lim=val;

val=get(handles.edit7, 'String');
SVS.LINE_SECTIONS{sec}.segments{seg}.head_loss_positive_backward_lim=val;

val=get(handles.edit8, 'String');
SVS.LINE_SECTIONS{sec}.segments{seg}.head_loss_negative_foward_lim=val;

val=get(handles.edit9, 'String');
SVS.LINE_SECTIONS{sec}.segments{seg}.head_loss_negative_backward_lim=val;

val=get(handles.edit10, 'String');
SVS.LINE_SECTIONS{sec}.segments{seg}.wet_wall_surf=val;

val=get(handles.edit11, 'String');
SVS.LINE_SECTIONS{sec}.segments{seg}.n_subsegments=val;

val=get(handles.edit12, 'String');
SVS.LINE_SECTIONS{sec}.segments{seg}.n_steady_heat_sources=val;

val=get(handles.uitable1, 'Data');
SVS.LINE_SECTIONS{sec}.segments{seg}.perimeter_roughness_matrix=val;

val=get(handles.uitable2, 'Data');
SVS.LINE_SECTIONS{sec}.segments{seg}.steady_heat_source_prop=val;

val=get(handles.uitable3, 'Data');
SVS.LINE_SECTIONS{sec}.segments{seg}.wall_surf_air_prop=val;

val=get(handles.edit13, 'String');
SVS.LINE_SECTIONS{sec}.segments{seg}.tunnel_wall_thickness=val;

val=get(handles.edit14, 'String');
SVS.LINE_SECTIONS{sec}.segments{seg}.dist_adjacent=val;

val=get(handles.edit15, 'String');
SVS.LINE_SECTIONS{sec}.segments{seg}.tunnel_wall_cond=val;

val=get(handles.edit16, 'String');
SVS.LINE_SECTIONS{sec}.segments{seg}.tunnel_wall_diff=val;

val=get(handles.edit17, 'String');
SVS.LINE_SECTIONS{sec}.segments{seg}.soil_cond=val;

val=get(handles.edit18, 'String');
SVS.LINE_SECTIONS{sec}.segments{seg}.soil_diff=val;

val=get(handles.edit19, 'String');
SVS.LINE_SECTIONS{sec}.segments{seg}.deep_sink_temp=val;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(line_segment_properties)

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SVS
sec=get(handles.popupmenu1,'Value');
seg=get(handles.popupmenu2,'Value');

val=get(handles.edit12, 'String');
SVS.LINE_SECTIONS{sec}.segments{seg}.n_steady_heat_sources=val;
form_3d


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
form_3e


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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

function refresh(n,m,handles)
    global SVS

    

    %Form 3A read
    c=SVS.LINE_SECTIONS{n}.segments{m}.id_title;
    set(handles.edit1,'String',c);


    c=SVS.LINE_SECTIONS{n}.segments{m}.line_segment_type;
    if isempty(c)==0
    set(handles.popupmenu3,'Value',c);
    else
    set(handles.popupmenu3,'Value',1);
    end

    c=SVS.LINE_SECTIONS{n}.segments{m}.length;
    set(handles.edit2,'String',c);

    c=SVS.LINE_SECTIONS{n}.segments{m}.cross_section_area;
    set(handles.edit3,'String',c);

    c=SVS.LINE_SECTIONS{n}.segments{m}.stack_height;
    set(handles.edit4,'String',c);

    c=SVS.LINE_SECTIONS{n}.segments{m}.fire_segment+1;
    if isempty(c)==0
    set(handles.popupmenu4,'Value',c);
    else
    set(handles.popupmenu4,'Value',1);
    end

    c=SVS.LINE_SECTIONS{n}.segments{m}.constant_press_change;
    set(handles.edit5,'String',c);
    
    %Form 3B
    c=SVS.LINE_SECTIONS{n}.segments{m}.perimeter_roughness_matrix;
    set(handles.uitable1,'Data',c);

    %Form 3C
    c=SVS.LINE_SECTIONS{n}.segments{m}.head_loss_positive_foward_lim;
    set(handles.edit6,'String',c);

    c=SVS.LINE_SECTIONS{n}.segments{m}.head_loss_positive_backward_lim;
    set(handles.edit7,'String',c);

    c=SVS.LINE_SECTIONS{n}.segments{m}.head_loss_negative_foward_lim;
    set(handles.edit8,'String',c);

    c=SVS.LINE_SECTIONS{n}.segments{m}.head_loss_negative_backward_lim;
    set(handles.edit9,'String',c);

    c=SVS.LINE_SECTIONS{n}.segments{m}.wet_wall_surf;
    set(handles.edit10,'String',c);

    c=SVS.LINE_SECTIONS{n}.segments{m}.n_subsegments;
    set(handles.edit11,'String',c);

    c=SVS.LINE_SECTIONS{n}.segments{m}.n_steady_heat_sources;
    set(handles.edit12,'String',c);
    
    %Form 3D
    c=SVS.LINE_SECTIONS{n}.segments{m}.steady_heat_source_prop;
    set(handles.uitable2,'Data',c);
    
    %Form 3E
    c=SVS.LINE_SECTIONS{n}.segments{m}.wall_surf_air_prop;
    set(handles.uitable3,'Data',c); 
    
    %Form 3F
    c=SVS.LINE_SECTIONS{n}.segments{m}.tunnel_wall_thickness;
    set(handles.edit13,'String',c); 
    
    c=SVS.LINE_SECTIONS{n}.segments{m}.dist_adjacent;
    set(handles.edit14,'String',c); 
    
    c=SVS.LINE_SECTIONS{n}.segments{m}.tunnel_wall_cond;
    set(handles.edit15,'String',c); 
    
    c=SVS.LINE_SECTIONS{n}.segments{m}.tunnel_wall_diff;
    set(handles.edit16,'String',c); 
    
    c=SVS.LINE_SECTIONS{n}.segments{m}.soil_cond;
    set(handles.edit17,'String',c); 

    c=SVS.LINE_SECTIONS{n}.segments{m}.soil_diff;
    set(handles.edit18,'String',c); 
    
    c=SVS.LINE_SECTIONS{n}.segments{m}.deep_sink_temp;
    set(handles.edit19,'String',c); 

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



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
