function varargout = sharpening(varargin)
% SHARPENING MATLAB code for sharpening.fig
%      SHARPENING, by itself, creates a new SHARPENING or raises the existing
%      singleton*.
%
%      H = SHARPENING returns the handle to a new SHARPENING or the handle to
%      the existing singleton*.
%
%      SHARPENING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHARPENING.M with the given input arguments.
%
%      SHARPENING('Property','Value',...) creates a new SHARPENING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sharpening_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sharpening_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sharpening

% Last Modified by GUIDE v2.5 05-Sep-2019 13:41:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sharpening_OpeningFcn, ...
                   'gui_OutputFcn',  @sharpening_OutputFcn, ...
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


% --- Executes just before sharpening is made visible.
function sharpening_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sharpening (see VARARGIN)

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
guidata(hObject, handles);

% UIWAIT makes sharpening wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sharpening_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in laplacian.
function laplacian_Callback(hObject, eventdata, handles)
% hObject    handle to laplacian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x
i=rgb2gray(x);
[r,c,d]=size(i);
i=im2double(i);
for m=2:r-1
    for n=2:c-1
        for o=1:d
            a(m,n,o)=(0)*i(m-1,n-1,o)+(-1)*i(m-1,n,o)+(0)*i(m-1,n+1,o)+(-1)*i(m,n-1,o)+(4)*i(m,n,o)+(-1)*i(m,n+1,o)+(0)*i(m+1,n-1,o)+(-1)*i(m+1,n,o)+(0)*i(m,n+1,o);
           
        end
    end
end
axes(handles.axes1);
imshow(a);

% --- Executes on button press in gradientfilter.
function gradientfilter_Callback(hObject, eventdata, handles)
% hObject    handle to gradientfilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in canny.
function canny_Callback(hObject, eventdata, handles)
% hObject    handle to canny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%edge detection _ canny
global x
i=rgb2gray(x);
a=edge(i,'canny');
axes(handles.axes1);
imshow(a);

% --- Executes on button press in unsharpmasking.
function unsharpmasking_Callback(hObject, eventdata, handles)
% hObject    handle to unsharpmasking (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x
a=imsharpen(x);
axes(handles.axes1);
imshow(a);

% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imageenhancement


% --- Executes on button press in Prewitt.
function Prewitt_Callback(hObject, eventdata, handles)
% hObject    handle to Prewitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%edge detection _ prewitt operator
global x
i=rgb2gray(x);
[r,c,d]=size(i);
i=im2double(i);
for m=2:r-1
    for n=2:c-1
        for o=1:d
            dfx=(-1)*i(m-1,n-1,o)+(0)*i(m-1,n,o)+(1)*i(m-1,n+1,o)+(-1)*i(m,n-1,o)+(0)*i(m,n,o)+(1)*i(m,n+1,o)+(-1)*i(m+1,n-1,o)+(0)*i(m+1,n,o)+1*i(m,n+1,o);
            dfy=(1)*i(m-1,n-1,o)+(1)*i(m-1,n,o)+(1)*i(m-1,n+1,o)+(0)*i(m,n-1,o)+(0)*i(m,n,o)+(0)*i(m,n+1,o)+(-1)*i(m+1,n-1,o)+(-1)*i(m+1,n,o)+(-1)*i(m,n+1,o);
            a(m,n,o)=sqrt(dfx*dfx+dfy*dfy);
        end
    end
end
axes(handles.axes1);
imshow(a);


% --- Executes on button press in Roberts.
function Roberts_Callback(hObject, eventdata, handles)
% hObject    handle to Roberts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x
i=rgb2gray(x);
b=im2double(i);
[r,c]=size(b);
%a(1:r,1:c)=0;
for m=1:r-1
    for n=1:c-1
        gx=b(m,n)-b(m+1,n+1);
        gy=b(m,n+1)-b(m+1,n);
        a(m,n)=sqrt(gx*gx+gy*gy);
    end
end
axes(handles.axes1);
imshow(a);

% --- Executes on button press in Sobel.
function Sobel_Callback(hObject, eventdata, handles)
% hObject    handle to Sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x
i=rgb2gray(x);
[r,c,d]=size(i);
i=im2double(i);
for m=2:r-1
    for n=2:c-1
        for o=1:d
            dfx=(-1)*i(m-1,n-1,o)+(0)*i(m-1,n,o)+(1)*i(m-1,n+1,o)+(-2)*i(m,n-1,o)+(0)*i(m,n,o)+(2)*i(m,n+1,o)+(-1)*i(m+1,n-1,o)+(0)*i(m+1,n,o)+1*i(m,n+1,o);
            dfy=(-1)*i(m-1,n-1,o)+(-2)*i(m-1,n,o)+(-1)*i(m-1,n+1,o)+(0)*i(m,n-1,o)+(0)*i(m,n,o)+(0)*i(m,n+1,o)+(1)*i(m+1,n-1,o)+(2)*i(m+1,n,o)+1*i(m,n+1,o);
            a(m,n,o)=sqrt(dfx*dfx+dfy*dfy);
        end
    end
end
axes(handles.axes1);
imshow(a);
