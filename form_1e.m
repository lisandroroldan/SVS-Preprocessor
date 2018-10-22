function varargout = form_1e(varargin)
% FORM_1E MATLAB code for form_1e.fig
%      FORM_1E, by itself, creates a new FORM_1E or raises the existing
%      singleton*.
%
%      H = FORM_1E returns the handle to a new FORM_1E or the handle to
%      the existing singleton*.
%
%      FORM_1E('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORM_1E.M with the given input arguments.
%
%      FORM_1E('Property','Value',...) creates a new FORM_1E or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before form_1e_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to form_1e_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help form_1e

% Last Modified by GUIDE v2.5 22-Oct-2018 13:47:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @form_1e_OpeningFcn, ...
                   'gui_OutputFcn',  @form_1e_OutputFcn, ...
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


% --- Executes just before form_1e is made visible.
function form_1e_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to form_1e (see VARARGIN)

% Choose default command line output for form_1e
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes form_1e wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global SVS

if isfield(SVS,'GENERAL_DATA')==1
    if isfield(SVS.GENERAL_DATA,'fan_stop_wmill_option')==1
        c=SVS.GENERAL_DATA.fan_stop_wmill_option;
        set(handles.popupmenu1,'Value',c);
    end
    if isfield(SVS.GENERAL_DATA,'init_file_wr_opt')==1
        c=SVS.GENERAL_DATA.init_file_wr_opt+1;
        set(handles.popupmenu2,'Value',c);
    end    
    if isfield(SVS.GENERAL_DATA,'init_file_rd_opt')==1
        c=SVS.GENERAL_DATA.init_file_rd_opt+1;
        set(handles.popupmenu3,'Value',c);
    end    
end


% --- Outputs from this function are returned to the command line.
function varargout = form_1e_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global SVS
    val=get(handles.popupmenu1, 'Value');
    SVS.GENERAL_DATA.fan_stop_wmill_option=val;
    val=get(handles.popupmenu2, 'Value');
    SVS.GENERAL_DATA.init_file_wr_opt=val-1;
    val=get(handles.popupmenu3, 'Value');
    SVS.GENERAL_DATA.init_file_rd_opt=val-1;
close(form_1e)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(form_1e)
