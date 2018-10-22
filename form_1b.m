function varargout = form_1b(varargin)
% FORM_1B MATLAB code for form_1b.fig
%      FORM_1B, by itself, creates a new FORM_1B or raises the existing
%      singleton*.
%
%      H = FORM_1B returns the handle to a new FORM_1B or the handle to
%      the existing singleton*.
%
%      FORM_1B('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORM_1B.M with the given input arguments.
%
%      FORM_1B('Property','Value',...) creates a new FORM_1B or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before form_1b_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to form_1b_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help form_1b

% Last Modified by GUIDE v2.5 22-Oct-2018 08:27:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @form_1b_OpeningFcn, ...
                   'gui_OutputFcn',  @form_1b_OutputFcn, ...
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


% --- Executes just before form_1b is made visible.
function form_1b_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to form_1b (see VARARGIN)

% Choose default command line output for form_1b
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes form_1b wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global SVS


months=[1:12]';
set(handles.popupmenu2,'string',months);
yearz=[2000:2100]';
set(handles.popupmenu3,'string',yearz);
hours=[0:23]';
set(handles.popupmenu4,'string',hours);
minutes=[0:59]';
set(handles.popupmenu5,'string',minutes);

if isfield(SVS,'GENERAL_DATA')==1
    if isfield(SVS.GENERAL_DATA,'design_year')==1
        c=SVS.GENERAL_DATA.design_year-min(yearz)+1;
        set(handles.popupmenu3,'Value',c);
    else
        c=year(datetime('today'))-min(yearz)+1;
        set(handles.popupmenu3,'Value',c);
    end
    if isfield(SVS.GENERAL_DATA,'design_month')==1
        c=SVS.GENERAL_DATA.design_month-min(months)+1;
        set(handles.popupmenu2,'Value',c);
    else
        c=month(datetime('today'))-min(months)+1;
        set(handles.popupmenu2,'Value',c);
    end
    if isfield(SVS.GENERAL_DATA,'design_hour')==1
        hora=SVS.GENERAL_DATA.design_hour;
        c=str2num(hora(1:2))+1;
        set(handles.popupmenu4,'Value',c);
        c=str2num(hora(3:4))+1;
        set(handles.popupmenu5,'Value',c);
    else
        cl=clock;
        c=cl(4)+1;
        set(handles.popupmenu4,'Value',c);
        c=cl(5)+1;
        set(handles.popupmenu5,'Value',c);
    end
    
    
else
    c=year(datetime('today'))-min(yearz)+1;
    set(handles.popupmenu3,'Value',c);
    c=month(datetime('today'))-min(months)+1;
    set(handles.popupmenu2,'Value',c);
    cl=clock;
    c=cl(4)+1;
    set(handles.popupmenu4,'Value',c);
    c=cl(5)+1;
    set(handles.popupmenu5,'Value',c);
end





% --- Outputs from this function are returned to the command line.
function varargout = form_1b_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global SVS
    months=[1:12]';
    yearz=[2000:2100]';
    hours=[0:23]';
    minutes=[0:59]';
    
    val=get(handles.popupmenu2, 'Value');
    SVS.GENERAL_DATA.design_month  = months(val);
    
    val=get(handles.popupmenu3, 'Value');
    SVS.GENERAL_DATA.design_year  = yearz(val);
    
    val=get(handles.popupmenu4, 'Value');
    
    if length(num2str(hours(val)))==1 
        h=strpad(num2str(hours(val)),2,'pre','0');
    else
        h=num2str(hours(val));
    end
    
    val=get(handles.popupmenu5, 'Value');
    if length(num2str(minutes(val)))==1 
        m=strpad(num2str(minutes(val)),2,'pre','0');
    else
        m=num2str(minutes(val));
    end

    SVS.GENERAL_DATA.design_hour  = [h,m];
    close(form_1b);





% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(form_1b);
