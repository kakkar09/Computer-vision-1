function varargout = imagerestoration(varargin)
% IMAGERESTORATION MATLAB code for imagerestoration.fig
%      IMAGERESTORATION, by itself, creates a new IMAGERESTORATION or raises the existing
%      singleton*.
%
%      H = IMAGERESTORATION returns the handle to a new IMAGERESTORATION or the handle to
%      the existing singleton*.
%
%      IMAGERESTORATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGERESTORATION.M with the given input arguments.
%
%      IMAGERESTORATION('Property','Value',...) creates a new IMAGERESTORATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before imagerestoration_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to imagerestoration_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imagerestoration

% Last Modified by GUIDE v2.5 05-Sep-2019 09:23:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imagerestoration_OpeningFcn, ...
                   'gui_OutputFcn',  @imagerestoration_OutputFcn, ...
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


% --- Executes just before imagerestoration is made visible.
function imagerestoration_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to imagerestoration (see VARARGIN)

% Choose default command line output for imagerestoration
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
guidata(hObject, handles);

% UIWAIT makes imagerestoration wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = imagerestoration_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in gaussiannoise.
function gaussiannoise_Callback(hObject, eventdata, handles)
% hObject    handle to gaussiannoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x
a=imnoise(x,'gaussian',0.2);
b=imgaussfilt(x);
axes(handles.axes2);
imshow(a);
axes(handles.axes5);
imshow(b);


% --- Executes on button press in rayleighnoise.
function rayleighnoise_Callback(hObject, eventdata, handles)
% hObject    handle to rayleighnoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in erlangnoise.
function erlangnoise_Callback(hObject, eventdata, handles)
% hObject    handle to erlangnoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in exponentialnoise.
function exponentialnoise_Callback(hObject, eventdata, handles)
% hObject    handle to exponentialnoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in uniformnoise.
function uniformnoise_Callback(hObject, eventdata, handles)
% hObject    handle to uniformnoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in saltpepper.
function saltpepper_Callback(hObject, eventdata, handles)
% hObject    handle to saltpepper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x
a=imnoise(x,'salt & pepper',0.05);
b=medfilt2(x);
axes(handles.axes2);
imshow(a);
axes(handles.axes5);
imshow(b);


% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guiintro
