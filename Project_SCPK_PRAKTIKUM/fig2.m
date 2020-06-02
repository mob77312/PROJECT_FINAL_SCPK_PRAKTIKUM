function varargout = fig2(varargin)
% FIG2 MATLAB code for fig2.fig
%      FIG2, by itself, creates a new FIG2 or raises the existing
%      singleton*.
%
%      H = FIG2 returns the handle to a new FIG2 or the handle to
%      the existing singleton*.
%
%      FIG2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIG2.M with the given input arguments.
%
%      FIG2('Property','Value',...) creates a new FIG2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fig2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fig2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fig2

% Last Modified by GUIDE v2.5 31-May-2020 20:11:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fig2_OpeningFcn, ...
                   'gui_OutputFcn',  @fig2_OutputFcn, ...
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


% --- Executes just before fig2 is made visible.
function fig2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fig2 (see VARARGIN)
global p;
global r;
p.Mydata = [];
r.Mydata = [];
global s;
global z;
s.Mydata = [];
z.Mydata = [];
set(handles.uipanel1,'visible','off');
set(handles.uipanel2,'visible','off');
set(handles.uipanel3,'visible','off');
set(handles.uipanel4,'visible','off');
set(handles.uipanel20,'visible','on');

% Choose default command line output for fig2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fig2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fig2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Data.
function Data_Callback(hObject, eventdata, handles)
% hObject    handle to Data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'visible','on');
set(handles.uipanel2,'visible','off');
set(handles.uipanel3,'visible','off');
set(handles.uipanel4,'visible','off');
set(handles.uipanel20,'visible','off');

% --- Executes on button press in atribut.
function atribut_Callback(hObject, eventdata, handles)
% hObject    handle to atribut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'visible','off');
set(handles.uipanel2,'visible','on');
set(handles.uipanel3,'visible','off');
set(handles.uipanel4,'visible','off');
set(handles.uipanel20,'visible','off');

% --- Executes on button press in kriteria.
function kriteria_Callback(hObject, eventdata, handles)
% hObject    handle to kriteria (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'visible','off');
set(handles.uipanel2,'visible','off');
set(handles.uipanel3,'visible','on');
set(handles.uipanel4,'visible','off');
set(handles.uipanel20,'visible','off');

% --- Executes on button press in hasil.
function hasil_Callback(hObject, eventdata, handles)
% hObject    handle to hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'visible','off');
set(handles.uipanel2,'visible','off');
set(handles.uipanel3,'visible','off');
set(handles.uipanel4,'visible','on');
set(handles.uipanel20,'visible','off');
data1=get(handles.uitable1,'data');
data2=get(handles.uitable7,'data');
data3=get(handles.uitable8,'data');
jalan1= get(handles.edit50,'string');
jalan2= get(handles.edit51,'string');
jalan3= get(handles.edit52,'string');
jalan4= get(handles.edit53,'string');
[m n]=size (data1); %matriks m x n dengan ukuran sebanyak variabel x (input)
R=zeros (m,n); %membuat matriks R, yang merupakan matriks kosong
Y=zeros (m,n); %membuat matriks Y, yang merupakan titik kosong
for j=1:n,
    if isequal(data1,1), %statement untuk kriteria dengan atribut keuntungan
        R(:,j)=data1(:,j)./max(data1(:,j));
    else
        R(:,j)=min(data1(:,j))./data1(:,j);
    end;
    set(handles.uitable10,'Data',R);  
end;

for i=1:m,
 V(i)= sum(data3.*R(i,:));
 set(handles.uitable11,'Data',V);
  [nilai,urutan]=max(V);
 set(handles.text12,'string',(nilai));
   if(urutan == 1)
    hasil1=jalan1';
    a=handles.im1;
    axes(handles.axes5); % memasukkan nilai variabel pada axis
    imshow(a); % menampilkan image hasil browse
elseif (urutan == 2)
    hasil1=jalan2;
    a=handles.im2;
    axes(handles.axes5); % memasukkan nilai variabel pada axis
    imshow(a); % menampilkan image hasil browse
elseif (urutan == 3)
    hasil1=jalan3;
    a=handles.im3;
    axes(handles.axes2); % memasukkan nilai variabel pada axis
    imshow(a); % menampilkan image hasil browse
elseif (urutan == 4)
    hasil1=jalan4; 
    a=handles.im4;
    axes(handles.axes5); % memasukkan nilai variabel pada axis
    imshow(a); % menampilkan image hasil browse
   end;
    set(handles.text14,'string',(urutan)); 
   set(handles.text31,'string',(hasil1)); 
end;

% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text12,'string','');
set(handles.text14,'string','');
set(handles.text31,'string','');
set(handles.uitable1, 'Data', {})
set(handles.uitable7, 'Data', {})
set(handles.uitable8, 'Data', {})
set(handles.uitable10, 'Data', {})
set(handles.uitable11, 'Data', {})
clc;

% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;

% --- Executes on button press in file.
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname]= uigetfile({'*.xlsx';},'buka_data');
fullpathname = strcat(pathname, filename);
data = xlsread(fullpathname);
set(handles.uitable1,'Data',data);

% --- Executes on button press in Masukan.
function Masukan_Callback(hObject, eventdata, handles)
% hObject    handle to Masukan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global p;
edit1= get(handles.edit1,'string');
edit2= get(handles.edit2,'string');
edit3= get(handles.edit3,'string');
edit4= get(handles.edit4,'string');
edit5= get(handles.edit5,'string');
edit6= get(handles.edit6,'string');

p.Mydata = [p.Mydata;[{edit1} {edit2} {edit3} {edit4} {edit5} {edit6}]];
set(handles.uitable1,'Data',p.Mydata);

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname]= uigetfile({'*.xlsx';},'buka_data');
fullpathname = strcat(pathname, filename);
data = xlsread(fullpathname);
set(handles.uitable7,'Data',data);

% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r;
edit26= get(handles.edit26,'string');
edit27= get(handles.edit27,'string');
edit28= get(handles.edit28,'string');
edit29= get(handles.edit29,'string');
edit30= get(handles.edit30,'string');
edit31= get(handles.edit31,'string');

r.Mydata = [r.Mydata;[{edit26} {edit27} {edit28} {edit29} {edit30} {edit31}]];
set(handles.uitable7,'Data',r.Mydata);



% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname]= uigetfile({'*.xlsx';},'buka_data');
fullpathname = strcat(pathname, filename);
data = xlsread(fullpathname);
set(handles.uitable8,'Data',data);


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s;
edit26= get(handles.edit26,'string');
edit27= get(handles.edit27,'string');
edit28= get(handles.edit28,'string');
edit29= get(handles.edit29,'string');
edit30= get(handles.edit30,'string');
edit31= get(handles.edit31,'string');

s.Mydata = [s.Mydata;[{edit26} {edit27} {edit28} {edit29} {edit30} {edit31}]];
set(handles.uitable8,'Data',s.Mydata);


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1,'visible','off');
set(handles.uipanel2,'visible','off');
set(handles.uipanel3,'visible','off');
set(handles.uipanel4,'visible','off');
set(handles.uipanel20,'visible','on');

function edit50_Callback(hObject, eventdata, handles)
% hObject    handle to edit50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit50 as text
%        str2double(get(hObject,'String')) returns contents of edit50 as a double


% --- Executes during object creation, after setting all properties.
function edit50_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit51_Callback(hObject, eventdata, handles)
% hObject    handle to edit51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit51 as text
%        str2double(get(hObject,'String')) returns contents of edit51 as a double


% --- Executes during object creation, after setting all properties.
function edit51_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit52_Callback(hObject, eventdata, handles)
% hObject    handle to edit52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit52 as text
%        str2double(get(hObject,'String')) returns contents of edit52 as a double


% --- Executes during object creation, after setting all properties.
function edit52_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit53_Callback(hObject, eventdata, handles)
% hObject    handle to edit53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit53 as text
%        str2double(get(hObject,'String')) returns contents of edit53 as a double


% --- Executes during object creation, after setting all properties.
function edit53_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName]=uigetfile({'*.jpg';'*.jpeg'},'Select Image file');
im1 = imread([PathName,FileName]);
handles.im1=im1; % menyimpan nilai variabel
guidata(hObject,handles); % instruksi simpan object
axes(handles.axes1); % memasukkan nilai variabel pada axis
imshow(im1); % menampilkan image hasil browse

% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName]=uigetfile({'*.jpg';'*.jpeg'},'Select Image file');
im2 = imread([PathName,FileName]);
handles.im2=im2; % menyimpan nilai variabel
guidata(hObject,handles); % instruksi simpan object
axes(handles.axes2); % memasukkan nilai variabel pada axis
imshow(im2); % menampilkan image hasil browse

% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName]=uigetfile({'*.jpg';'*.jpeg'},'Select Image file');
im3 = imread([PathName,FileName]);
handles.im3=im3; % menyimpan nilai variabel
guidata(hObject,handles); % instruksi simpan object
axes(handles.axes3); % memasukkan nilai variabel pada axis
imshow(im3); % menampilkan image hasil browse

% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName]=uigetfile({'*.jpg';'*.jpeg'},'Select Image file');
im4 = imread([PathName,FileName]);
handles.im4=im4; % menyimpan nilai variabel
guidata(hObject,handles); % instruksi simpan object
axes(handles.axes4); % memasukkan nilai variabel pada axis
imshow(im4); % menampilkan image hasil browse
