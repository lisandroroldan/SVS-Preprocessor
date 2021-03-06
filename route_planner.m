function varargout = route_planner(varargin)
% ROUTE_PLANNER MATLAB code for route_planner.fig
%      ROUTE_PLANNER, by itself, creates a new ROUTE_PLANNER or raises the existing
%      singleton*.
%
%      H = ROUTE_PLANNER returns the handle to a new ROUTE_PLANNER or the handle to
%      the existing singleton*.
%
%      ROUTE_PLANNER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROUTE_PLANNER.M with the given input arguments.
%
%      ROUTE_PLANNER('Property','Value',...) creates a new ROUTE_PLANNER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before route_planner_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to route_planner_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help route_planner

% Last Modified by GUIDE v2.5 01-Nov-2018 09:12:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @route_planner_OpeningFcn, ...
                   'gui_OutputFcn',  @route_planner_OutputFcn, ...
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


% --- Executes just before route_planner is made visible.
function route_planner_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to route_planner (see VARARGIN)

% Choose default command line output for route_planner
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes route_planner wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global SVS

%Form 9G
handles.uitable1.ColumnWidth={'auto'};
handles.uitable1.ColumnEditable=logical([1]);
handles.uitable1.Data=cell(7,1);

axes(handles.axes1);  
colors=0;
plot_network(SVS.INPUT_GEOMETRY.nodes,SVS.INPUT_GEOMETRY.line_sections,SVS.INPUT_GEOMETRY.vent_sections,colors)




% --- Outputs from this function are returned to the command line.
function varargout = route_planner_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
global SVS
sec=get(handles.uitable1,'Data');

v=find(~cellfun(@isempty,sec));


for i=1:length(v)
    sections(i)=str2double(sec(v(i)));
end

axes(handles.axes1);  
color_plot_sections(sections);

c=0;
for i=1:length(sections)
    for j=1:size(SVS.LINE_SECTIONS,2)
        if SVS.LINE_SECTIONS{j}.id_n == sections(i)
            for k=1:size(SVS.LINE_SECTIONS{j}.segments,2)
                c=c+1;
                segment_length{c}=SVS.LINE_SECTIONS{j}.segments{k}.length;
            end
        end
    end
end

segment_length;

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


function color_plot_sections(secs)
global SVS
    secs_total=SVS.INPUT_GEOMETRY.line_sections(:,1);
    
    for i=1:length(secs_total)

        m=find(SVS.INPUT_GEOMETRY.line_sections(:,1)==secs_total(i));
        
        n1=SVS.INPUT_GEOMETRY.line_sections(m,2);
        n2=SVS.INPUT_GEOMETRY.line_sections(m,3);
        m1=find(SVS.INPUT_GEOMETRY.nodes(:,1)==n1);
        m2=find(SVS.INPUT_GEOMETRY.nodes(:,1)==n2);

        x1=SVS.INPUT_GEOMETRY.nodes(m1,2);
        x2=SVS.INPUT_GEOMETRY.nodes(m2,2);
        y1=SVS.INPUT_GEOMETRY.nodes(m1,3);
        y2=SVS.INPUT_GEOMETRY.nodes(m2,3);
        z1=SVS.INPUT_GEOMETRY.nodes(m1,4);
        z2=SVS.INPUT_GEOMETRY.nodes(m2,4);

        h5=plot3([x1 x2],[y1 y2],[z1 z2],'k','LineWidth',2);

        
    end



    for i=1:length(secs)

        m=find(SVS.INPUT_GEOMETRY.line_sections(:,1)==secs(i));
        
        n1=SVS.INPUT_GEOMETRY.line_sections(m,2);
        n2=SVS.INPUT_GEOMETRY.line_sections(m,3);
        m1=find(SVS.INPUT_GEOMETRY.nodes(:,1)==n1);
        m2=find(SVS.INPUT_GEOMETRY.nodes(:,1)==n2);

        x1=SVS.INPUT_GEOMETRY.nodes(m1,2);
        x2=SVS.INPUT_GEOMETRY.nodes(m2,2);
        y1=SVS.INPUT_GEOMETRY.nodes(m1,3);
        y2=SVS.INPUT_GEOMETRY.nodes(m2,3);
        z1=SVS.INPUT_GEOMETRY.nodes(m1,4);
        z2=SVS.INPUT_GEOMETRY.nodes(m2,4);

        h5=plot3([x1 x2],[y1 y2],[z1 z2],'r','LineWidth',2);

        
    end


    
