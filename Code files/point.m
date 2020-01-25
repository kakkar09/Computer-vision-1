function varargout = point(varargin)
% POINT MATLAB code for point.fig
%      POINT, by itself, creates a new POINT or raises the existing
%      singleton*.
%
%      H = POINT returns the handle to a new POINT or the handle to
%      the existing singleton*.
%
%      POINT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POINT.M with the given input arguments.
%
%      POINT('Property','Value',...) creates a new POINT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before point_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to point_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help point

% Last Modified by GUIDE v2.5 02-Sep-2019 14:51:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @point_OpeningFcn, ...
                   'gui_OutputFcn',  @point_OutputFcn, ...
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


% --- Executes just before point is made visible.
function point_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to point (see VARARGIN)
% Choose default command line output for sharpening
handles.output = hObject;
% create an axes that spans the whole gui
ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% import the background image and show it on the axes
bg = imread('back.jpg'); imagesc(bg);
% prevent plotting over the background and turn the axis off
set(ah,'handlevisibility','off','visible','off')
% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');
% Update handles structure
global x
axes(handles.axes1);
imshow(x);
handles.output = hObject;

% Choose default command line output for point
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes point wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = point_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in imgneg.
function imgneg_Callback(hObject, eventdata, handles)
% hObject    handle to imgneg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x

j=255-x(:,:,:);
axes(handles.axes1);
imshow(j);

% --- Executes on button press in binary.
function binary_Callback(hObject, eventdata, handles)
% hObject    handle to binary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;

j=rgb2gray(x);
[r,c]=size(j);
for a=1:r
    for b=1:c
        if j(a,b)<=128
            j(a,b)=0;
        else
            j(a,b)=255;
        end
    end
end
axes(handles.axes1);
imshow(j);

% --- Executes on button press in logtrans.
function logtrans_Callback(hObject, eventdata, handles)
% hObject    handle to logtrans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%z=k*log10(1+p);
global x;
f=x;
g=rgb2gray(f);
c=input('Enter the constant value, c = ');
[M,N]=size(g);
        for f = 1:M
            for y = 1:N
                m=double(g(f,y));
                z(f,y)=c.*log10(1+m); %#ok<AGROW>
            end
        end
        axes(handles.axes1);
imshow(z);



% --- Executes on button press in hist.
function hist_Callback(hObject, eventdata, handles)
% hObject    handle to hist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
eq=histeq(x);
axes(handles.axes1);
imshow(eq);

% --- Executes on button press in affine.
function affine_Callback(hObject, eventdata, handles)
% hObject    handle to affine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
A = x;
tform = affine2d([2 0.33 0; 0 1 0; 0 0 1])
B = imwarp(A,tform);
axes(handles.axes1);
imshow(B);
axis on equal;

% --- Executes on button press in power.
function power_Callback(hObject, eventdata, handles)
% hObject    handle to power (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%z=k*p^r;
global x;
i=x;
i=im2double(i);
k=input('Enter the value of constant: ');
z=input('Enter the value of gamma: ');
[r,c,d]=size(i);
for q=1:r
    for y=1:c
        a(q,y,1)=k*(i(q,y,1)^z);
        a(q,y,2)=k*(i(q,y,2)^z);
        a(q,y,3)=k*(i(q,y,3)^z);
    end
end
axes(handles.axes1);
imshow(a);

% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imageenhancement


% --- Executes on button press in original.
function original_Callback(hObject, eventdata, handles)
% hObject    handle to original (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x
axes(handles.axes1);
imshow(x);


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x
      I = x;
      BrightSliderValue = get(handles.slider1, 'Value');
      I = I + BrightSliderValue ; % to be change
      axes(handles.axes1);
      imshow(I);
      %setappdata(handles.axes1, 'yourVariable', I);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x
      I=x;
      ContrastSliderValue = get(handles.slider2, 'Value');
      I = I - ContrastSliderValue; % to be change
      % I = %change contrast
      axes(handles.axes1);
      imshow(I);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
