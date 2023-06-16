function varargout = final1(varargin)
% FINAL1 MATLAB code for final1.fig
%      FINAL1, by itself, creates a new FINAL1 or raises the existing
%      singleton*.
%
%      H = FINAL1 returns the handle to a new FINAL1 or the handle to
%      the existing singleton*.
%
%      FINAL1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL1.M with the given input arguments.
%
%      FINAL1('Property','Value',...) creates a new FINAL1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before final1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to final1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help final1

% Last Modified by GUIDE v2.5 12-Jan-2018 18:20:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @final1_OpeningFcn, ...
                   'gui_OutputFcn',  @final1_OutputFcn, ...
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


% --- Executes just before final1 is made visible.
function final1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to final1 (see VARARGIN)

% Choose default command line output for final1
handles.output = hObject;
ss=ones(300,300);
axes(handles.axes1);
imshow(ss);
axes(handles.axes2);
imshow(ss);
axes(handles.axes3);
imshow(ss);
axes(handles.axes4);
imshow(ss);
axes(handles.axes5);
imshow(ss);
axes(handles.axes6);
imshow(ss);
axes(handles.axes7);
imshow(ss);
axes(handles.axes8);
imshow(ss);
axes(handles.axes9);
imshow(ss);
axes(handles.axes10);
imshow(ss);
axes(handles.axes11);
imshow(ss);
axes(handles.axes12);
imshow(ss);
axes(handles.axes13);
imshow(ss);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes final1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = final1_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1

%% Read Plain Image

[filename,pathname] = uigetfile('*.jpg;*.tif;*.png;*.jpeg;*.bmp;*.pgm;*.gif','pick an imgae');
file = fullfile(pathname,filename);

   PI = imread(file);

axes(handles.axes1);
imshow(PI);
title('Plain Image');

% Histogram of Plain Image

% Get histValues for each channel
    [yRed, x] = imhist(PI(:,:,1));
    [yGreen, x] = imhist(PI(:,:,2));
    [yBlue, x] = imhist(PI(:,:,3));

    %Plot them together in one plot
    axes(handles.axes12);
    plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');
    title('Histogram of Plain Image');
    

handles.PI=PI;

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2

%% Image Encryption 

PI=handles.PI;

%% RGB Channel Extraction

R=PI(:,:,1);
axes(handles.axes2);
imshow(R);
title('R Channel');
G=PI(:,:,2);
axes(handles.axes3);
imshow(G);
title('G Channel');
B=PI(:,:,3);
axes(handles.axes4);
imshow(B);
title('B Channel');

%% Three Sequence

load TS

axes(handles.axes5);
imshow(uint8(Xr));
title('Sequence Xr');

axes(handles.axes6);
imshow(uint8(Yg));
title('Sequence Yg');

axes(handles.axes7);
imshow(uint8(Zb));
title('Sequence Zb');

%% image encryption using bitxor

X=reshape(Xr,[262144 1]);
R1 = imageProcess(double(R),round(X));
axes(handles.axes8);
imshow(uint8(R1));
title('Encrypted R Channel');
Y=reshape(Yg,[262144 1]);
G1 = imageProcess(double(G),round(Y));
axes(handles.axes9);
imshow(uint8(G1));
title('Encrypted G Channel');
Z=reshape(Zb,[262144 1]);
B1 = imageProcess(double(B),round(Z));
axes(handles.axes10);
imshow(uint8(B1));
title('Encrypted B Channel');




handles.R1=R1;
handles.G1=G1;
handles.B1=B1;


% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
%% Final Cipher Image

R1=handles.R1;
G1=handles.G1;
B1=handles.B1;

F=cat(3,R1,G1,B1);
axes(handles.axes11);
imshow(uint8(F));
title('Final Cipher Image');

% Histogram of Cipher Image

% Get histValues for each channel
    [yRed, x] = imhist(uint8(F(:,:,1)));
    [yGreen, x] = imhist(uint8(F(:,:,2)));
    [yBlue, x] = imhist(uint8(F(:,:,3)));

    %Plot them together in one plot
    axes(handles.axes13);
    plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');
    title('Histogram of Cipher Image');

save('FCI.mat','F');

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
final2
