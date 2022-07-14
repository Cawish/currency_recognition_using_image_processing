function varargout = MY(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MY_OpeningFcn, ...
                   'gui_OutputFcn',  @MY_OutputFcn, ...
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


function MY_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
function varargout = MY_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function selectf_Callback(hObject, eventdata, handles)
[imname,impath]=uigetfile({'*.jpg;*.png'});
img=imread([impath,'/',imname]);
im=imresize(img,[128 128]);
 Rchannel=im(:,:,1);
 Bchannel=im(:,:,2);
 Gchannel=im(:,:,3);
 Rchannel=medfilt2(Rchannel);
 Gchannel=medfilt2(Gchannel);
 Bchannel=medfilt2(Bchannel);
 %restore channels
 rgbim(:,:,1)=Rchannel;
 rgbim(:,:,2)=Gchannel;
 rgbim(:,:,3)=Bchannel;
axes(handles.axes3);
imshow(rgb2gray(img));
axes(handles.axes4);
imshow(DetectedEdges(img));
fettt=totalfeature(rgbim);
load data;

k=length(my_database);
disp(k);
for j=1:k
    D(j)=dist(fettt',my_database(1,j).feature);
  
end
[value,index]=min(D);
if value<2000
   CurrencyName=my_database(index).unnamed;
     CurrencyCountry=my_database(index).unnamed1;
   fprintf('Currency Recognized : ');
   disp(CurrencyName);
   path=pwd;
   notesPath=strcat(path,"\currenynotes")
   flagPath=strcat(path,"\currenyf")
    switch index
        case 1
            axes(handles.axes1);
            imshow(notesPath + '\australiandollar.jpg');
            axes(handles.axes2);
            imshow(flagPath + '\australiaf.jpg');
            case 2
                axes(handles.axes1);
            imshow(notesPath + '\danish krone.jpg');
            axes(handles.axes2);
            imshow(flagPath + '\Denmarkf.jpg');
            case 3
                axes(handles.axes1);
            imshow(notesPath + '\dollar.jpg');
            axes(handles.axes2);
            imshow(flagPath + '\usaf.jpg');
            case 4
                axes(handles.axes1);
            imshow(notesPath + '\egyptian pound.jpg');
            axes(handles.axes2);
            imshow(flagPath + '\egypt.jpg');
            case 5
                axes(handles.axes1);
            imshow(notesPath + '\france euro.jpg');
            axes(handles.axes2);
            imshow(flagPath + '\francef.jpg');
            case 6
                axes(handles.axes1);
            imshow(notesPath + '\Iceland_Currency_krona.jpg');
            axes(handles.axes2);
            imshow(flagPath + '\Icelandf.jpg');
            case 7
                axes(handles.axes1);
            imshow(notesPath + '\indianrupee.jpg');
            axes(handles.axes2);
            imshow(flagPath + '\indiaf.jpg');
            case 8
                axes(handles.axes1);
            imshow(notesPath + '\indonesia.jpg');
            axes(handles.axes2);
            imshow(flagPath + '\indonesiaf.jpg');
            case 9
                axes(handles.axes1);
            imshow(notesPath + '\iran.jpg');
            axes(handles.axes2);
            imshow(flagPath + '\iranf.jpg');
            case 10
            axes(handles.axes1);
            imshow(notesPath + '\korea.jpg');
            axes(handles.axes2);
            imshow(flagPath + '\koreaf.jpg');
            case 11
                axes(handles.axes1);
            imshow(notesPath + '\malaysia.jpg');
            axes(handles.axes2);
            imshow(flagPath + '\malaysiaf.jpg');
            case 12
                axes(handles.axes1);
            imshow(notesPath + '\yen.jpg');
            axes(handles.axes2);
            imshow(flagPath + '\chinaf.jpg');
            case 13
                axes(handles.axes1);
            imshow(notesPath + '\russia rouble.jpg');
            axes(handles.axes2);
            imshow(flagPath + '\russiaf.jpg');
            case 14
                axes(handles.axes1);
            imshow(notesPath + '\saud-arabia1.jpg');
            axes(handles.axes2);
            imshow(flagPath + '\saudif.jpg');
            case 15
                axes(handles.axes1);
            imshow(notesPath + '\soth africa.jpg');
            axes(handles.axes2);
            imshow(flagPath + '\africaf.jpg');
            case 16
                axes(handles.axes1);
            imshow(notesPath + '\Switzerland 1000 Franken.jpg');
            axes(handles.axes2);
            imshow(flagPath + '\sf.jpg');
            case 17
                axes(handles.axes1);
            imshow(notesPath + '\turkey.jpg');
            axes(handles.axes2);
            imshow(flagPath + '\turkeyf.jpg');
            case 18
                axes(handles.axes1);
            imshow(notesPath + '\Sierra 1000.jpg');
            axes(handles.axes2);
            imshow(flagPath + '\sierraf.jpg');
            case 19
                axes(handles.axes1);
            imshow(notesPath + '\Sierra 500.jpg');
            axes(handles.axes2);
            imshow(flagPath + '\sierraf.jpg');
            case 20
                axes(handles.axes1);
            imshow(notesPath + '\Sierra 10000.jpg');
            axes(handles.axes2);
            imshow(flagPath + '\sierraf.jpg');
            case 21
                axes(handles.axes1);
            imshow(notesPath + '\Sierra 100.jpg');
            axes(handles.axes2);
            imshow(flagPath + '\sierraf.jpg');
            case 22
            axes(handles.axes1);
            imshow(notesPath + '\Sierra 2000.jpg');
            axes(handles.axes2);
            imshow(flagPath + '\sierraf.jpg');
    end
       
else
  CurrencyName='invalid currency';
  CurrencyCountry='x';
  axes(handles.axes1);
  imshow(notesPath + '\download.jpg');
  axes(handles.axes2);
   imshow(notesPath + '\download.jpg');
    disp('no matches found');
end

set(handles.text1,'String',CurrencyName);
set(handles.text2,'String',CurrencyCountry);
function display_Callback(hObject, eventdata, handles)



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
