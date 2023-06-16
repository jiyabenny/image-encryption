function varargout = final2(varargin)
% FINAL2 MATLAB code for final2.fig
%      FINAL2, by itself, creates a new FINAL2 or raises the existing
%      singleton*.
%
%      H = FINAL2 returns the handle to a new FINAL2 or the handle to
%      the existing singleton*.
%
%      FINAL2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL2.M with the given input arguments.
%
%      FINAL2('Property','Value',...) creates a new FINAL2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before final2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to final2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help final2

% Last Modified by GUIDE v2.5 12-Jan-2018 18:34:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @final2_OpeningFcn, ...
                   'gui_OutputFcn',  @final2_OutputFcn, ...
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


% --- Executes just before final2 is made visible.
function final2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to final2 (see VARARGIN)

% Choose default command line output for final2
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
axes(handles.axes14);
imshow(ss);
axes(handles.axes15);
imshow(ss);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes final2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = final2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1

%% Decryption side

load FCI
axes(handles.axes1);
imshow(uint8(F));
title('Cipher Image');

load initialvalues

set(handles.edit1,'string',xo);
set(handles.edit2,'string',yo);
set(handles.edit3,'string',zo);
set(handles.edit4,'string',c);
set(handles.edit5,'string',no);

handles.F=F;

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2

%% Decryption

F=handles.F;

%% RGB Channel Extraction in Cipher Image

R=F(:,:,1);
axes(handles.axes2);
imshow(uint8(R));
title('R Channel');
G=F(:,:,2);
axes(handles.axes3);
imshow(uint8(G));
title('G Channel');
B=F(:,:,3);
axes(handles.axes4);
imshow(uint8(B));
title('B Channel');

%% Three Sequence Generation

load initialvalues

h=0.008911;         %% It is given in base paper

%% Chotic State

a=10; 
b=40;
d=4;

t1=yo-xo;
XX=(xo+((h.*a)*t1))/100;
t2=b-zo;
YY=(yo+((h.*xo)*t2))/100;
t3=(c.*zo)+(d.*xo^2);
ZZ=(zo+(h*t3))/100;

X=XX+X1;   
Y=YY+X1;
Z=ZZ+X1;

alpha = 0.95; % signal gain 
 
 Xr=alpha*X;
 axes(handles.axes8);
 imshow(uint8(Xr));
 title('Sequence Xr');
 
 Yg=alpha*Y;
 axes(handles.axes9);
 imshow(uint8(Yg));
 title('Sequence Yg');
 
 Zb=alpha*Z;
 axes(handles.axes10);
 imshow(uint8(Zb));
 title('Sequence Zb');
 
 
 %% Decryption using bitxor
 
X1=reshape(Xr,[262144 1]);
R1 = imageProcess(double(R),round(X1));
axes(handles.axes11);
imshow(uint8(R1));
title('Decrypted R Channel');
Y1=reshape(Yg,[262144 1]);
G1 = imageProcess(double(G),round(Y1));
axes(handles.axes12);
imshow(uint8(G1));
title('Decrypted G Channel');
Z1=reshape(Zb,[262144 1]);
B1 = imageProcess(double(B),round(Z1));
axes(handles.axes13);
imshow(uint8(B1));
title('Decrypted B Channel');
 
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
%% Final Reconstructed Image

R1=handles.R1;
G1=handles.G1;
B1=handles.B1;

RPI=cat(3,R1,G1,B1);
axes(handles.axes14);
imshow(uint8(RPI));
title('Reconstructed Plain Image');

% Histogram of Reconstructed Plain Image

% Get histValues for each channel
    [yRed, x] = imhist(uint8(RPI(:,:,1)));
    [yGreen, x] = imhist(uint8(RPI(:,:,2)));
    [yBlue, x] = imhist(uint8(RPI(:,:,3)));

    %Plot them together in one plot
    axes(handles.axes15);
    plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');
    title('Histogram of Reconstructed Plain Image');

% Update handles structure
guidata(hObject, handles);


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
