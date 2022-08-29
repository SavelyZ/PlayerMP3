unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bass, StdCtrls, ExtCtrls, Buttons, Menus, jpeg, ID3v2, ID3v1, MpegAudio,
  {Unit3, Unit2,}audiogenie3, Mask,osc_vis,spectrum_vis,CommonTypes,
  ComCtrls;


type
{  
  Byte 1-3 = ID 'TAG'
  Byte 4-33 = Titel / Title
  Byte 34-63 = Artist
  Byte 64-93 = Album
  Byte 94-97 = Jahr / Year
  Byte 98-127 = Kommentar / Comment
  Byte 128 = Genre  
}
 TTag = record
    ID: string[3];
    Titel: string[30];  
    Artist: string[30];  
    Album: string[30];
    Year: string[4];
    Comment: string[30];
    Genre: Byte;
  end;
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    ScrollBar1: TScrollBar;
    Timer1: TTimer;
    ScrollBar2: TScrollBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    ListBox1: TListBox;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn8: TBitBtn;
    Label1: TLabel;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog2: TOpenDialog;
    J1: TMenuItem;
    N9: TMenuItem;
    OpenDialog3: TOpenDialog;
    StaticText1: TStaticText;
    Label2: TLabel;
    BitBtn7: TBitBtn;
    BitBtn9: TBitBtn;
    ListBox2: TListBox;
    BitBtn11: TBitBtn;
    Edit1: TEdit;
    OpenDialog4: TOpenDialog;
    N10: TMenuItem;
    N11: TMenuItem;
    CheckBox1: TCheckBox;
    BitBtn12: TBitBtn;
    ListBox3: TListBox;
    ComboBox1: TComboBox;
    BitBtn13: TBitBtn;
    Edit2: TEdit;
    Label3: TLabel;
    ComboBox3: TComboBox;
    ListBox4: TListBox;
    BitBtn15: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    Label4: TLabel;
    BitBtn19: TBitBtn;
    dlgSave1: TSaveDialog;
    pb1: TPaintBox;
    X: TTrackBar;
    Y: TTrackBar;
    BitBtn18: TBitBtn;
    lbl1: TLabel;
    lbl2: TLabel;
    dlgColor1: TColorDialog;
    pnl1: TPanel;
    pnl2: TPanel;
    trckbr1: TTrackBar;
    trckbr2: TTrackBar;
    trckbr3: TTrackBar;
    trckbr4: TTrackBar;
    txt1: TStaticText;
    txt2: TStaticText;
    txt3: TStaticText;
    txt4: TStaticText;
    btn1: TBitBtn;
    trckbr5: TTrackBar;
    trckbr6: TTrackBar;
    txt5: TStaticText;
    txt6: TStaticText;
    trckbr7: TTrackBar;
    trckbr8: TTrackBar;
    trckbr9: TTrackBar;
    txt7: TStaticText;
    txt8: TStaticText;
    txt9: TStaticText;
    btn2: TBitBtn;
    btn3: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure ScrollBar2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N6Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ListBox3DblClick(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure pnl1Click(Sender: TObject);
    procedure pnl2Click(Sender: TObject);
    procedure pnl3Click(Sender: TObject);
    procedure trckbr1Change(Sender: TObject);
    procedure trckbr2Change(Sender: TObject);
    procedure trckbr3Change(Sender: TObject);
    procedure trckbr4Change(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure trckbr5Change(Sender: TObject);
    procedure trckbr6Change(Sender: TObject);
    procedure trckbr7Change(Sender: TObject);
    procedure trckbr8Change(Sender: TObject);
    procedure trckbr9Change(Sender: TObject);
    procedure trckbr10Change(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
   private
    { Private declarations }
    Procedure AddMusic(MusicName:String);//добавь в плэйлист
    Procedure ListToPlay(I:Integer);//проиграй плэйлист
    Procedure WriteTags(FileName:string);//Выведи ТЭГИ данного трека
    Function ShowTime(const Sec:integer):string;//преобразует время трека
    Function CheckToPovtor(s:string):boolean;
    Procedure SortWayTrackPlayList;//сортирует плэй лист в таком порядке, что сначала выводится путь трека до названия трэка(ExtractFileName), затем все композиции
    //находящиеся по данному пути
    Procedure AddWithInicWay(s:string);//Добавляет композицию в Плэйлист с соблюдением всех правил, указанных выше
    Function PosToBack(x:string;s:char):integer;
    Procedure FilterText(ftext:string);//Поиск композиции из листбокс по эдит2
    Procedure FilterTextReset;//возвращение прежнего листбокса
    Procedure SortPlayListAZ1;//Сортирует плэй лист по алфавиту в режиме путь и трэк
    Procedure SortPlayListAZ2;//Сортирует плэй лист по алфавиту в режиме только путь
    procedure ForStartEqualizer(stream:HSTREAM);
  public
    { Public declarations }
  end;
  Const
 Genres : array[0..146] of string =
    ('Blues','Classic Rock','Country','Dance','Disco','Funk','Grunge',
    'Hip- Hop','Jazz','Metal','New Age','Oldies','Other','Pop','R&B',
    'Rap','Reggae','Rock','Techno','Industrial','Alternative','Ska',
    'Death Metal','Pranks','Soundtrack','Euro-Techno','Ambient',
    'Trip-Hop','Vocal','Jazz+Funk','Fusion','Trance','Classical',
    'Instrumental','Acid','House','Game','Sound Clip','Gospel','Noise',
    'Alternative Rock','Bass','Punk','Space','Meditative','Instrumental Pop',
    'Instrumental Rock','Ethnic','Gothic','Darkwave','Techno-Industrial','Electronic',
    'Pop-Folk','Eurodance','Dream','Southern Rock','Comedy','Cult','Gangsta',
    'Top 40','Christian Rap','Pop/Funk','Jungle','Native US','Cabaret','New Wave',
    'Psychadelic','Rave','Showtunes','Trailer','Lo-Fi','Tribal','Acid Punk',
    'Acid Jazz','Polka','Retro','Musical','Rock & Roll','Hard Rock','Folk',
    'Folk-Rock','National Folk','Swing','Fast Fusion','Bebob','Latin','Revival',
    'Celtic','Bluegrass','Avantgarde','Gothic Rock','Progressive Rock',
    'Psychedelic Rock','Symphonic Rock','Slow Rock','Big Band','Chorus',
    'Easy Listening','Acoustic','Humour','Speech','Chanson','Opera',
    'Chamber Music','Sonata','Symphony','Booty Bass','Primus','Porn Groove',
    'Satire','Slow Jam','Club','Tango','Samba','Folklore','Ballad',
    'Power Ballad','Rhytmic Soul','Freestyle','Duet','Punk Rock','Drum Solo',
    'Acapella','Euro-House','Dance Hall','Goa','Drum & Bass','Club-House',
    'Hardcore','Terror','Indie','BritPop','Negerpunk','Polsk Punk','Beat',
    'Christian Gangsta','Heavy Metal','Black Metal','Crossover','Contemporary C',
    'Christian Rock','Merengue','Salsa','Thrash Metal','Anime','JPop','SynthPop');
var
  Form1: TForm1;
  Stream: Hstream;//инициализируем поток
  NowStreamScrol:Boolean;              //CorrectPlayList-Были ли изменения, какие!нибудь действия с плэйлистом, если оно открыто
  OpenPlayList,SavePlayList,CorrectPlayList:boolean;//SavePlayList-Был ли сохранен плэй лист, если были изменения
    //OpenPlayList-открыта ли часть с Плэйлистом  True - DA
  ConfigWay:string;//путь к файлу Config
  AutoPlayList:string;//переменная в которой хранится полный путь к плэйлисту, который в автозагрузке
  TrackActive,PlayListActive,RadioActive,equalizerActive:boolean;
  PutITrackActive,OnlyTrackActive:boolean;//формат ПлэйЛиста в данный момент
  NowPlayList:string;//плэйлист,который путь к нему в данный момент активный
  RandomTrackPlayListActive,CycleTrackPlayListActive:boolean;//randomTrackplaylist - авключай рандомный трэк плэйлиста; CycleTrackPlayListActive - повторяй один и тот же трэк
  ToNextTrackActive:boolean;//трэки по порядку
  PlayListPlaying:boolean;//плэйлист изанимает поток
  SortPLNo,AlfAZ,AlfZA,AdrSort:boolean;//сортировка плэйлиста из перечня ComboBox1
  TimeFileCreate:Boolean;//Создан ли временный файл
  NowTrack:string;//что играет сейчас
  NumberNowTrack:Integer;// номер в плэйлисте того, что играет сейчас
  SaveToBack:Boolean;//сохранен ли плэй лист перед сортировками
  FastPlay:Boolean;
  FX:array[1..8]of Integer;//equalizer частоты
  p:BASS_DX8_PARAMEQ;  //поля для характеристик equalizert
  pr: BASS_DX8_REVERB;
  echo: BASS_DX8_ECHO;
  implementation
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var f:TextFile;s:string;
begin
  {ListBox1.Style:=lbOwnerDrawVariable;}
  ///////////////
   SortPLNo:=true;//ее нет
   AlfAZ:=false;
   AlfZA:=false;//Активные сортировки
   AdrSort:=False;
    //Добавить запоминание в Config.txt
  /////////////

  ////////////////////////////////
  RandomTrackPlayListActive:=false;
  CycleTrackPlayListActive:=false;// определение следующего трэка
  ToNextTrackActive:=true;
  ////////////////////////////////

  ComboBox1.ItemIndex:=0;
  PlayListPlaying:=false;//проигрывается ли плэй лист

  ////////////////////
  TrackActive:=false;
  PlayListActive:=true;//какой из листов сейчас{радио плэйлист трэк}
  RadioActive:=false;
  equalizerActive:=False;
  //////////////////

  FastPlay:=False;
  SaveToBack:=False;

  if bass_init(-1, 44100, 0,  Application.Handle, nil)=false//инициализируем поток
  then ShowMessage('Проблемы с инициализацией потока');

   OcilloScope := TOcilloScope.Create(pb1.Width, pb1.Height);
   Spectrum    := TSpectrum.Create(pb1.Width, pb1.Height);

   Form1.Height:=600;//размеры формы
   Form1.Width:=700;

   SavePlayList:=False;
   CorrectPlayList:=False;//Какие действия происходили с плэйлистом
   OpenPlayList:=False;

   ComboBox3.ItemIndex:=0;
   ConfigWay:=ExtractFilePath( Application.ExeName )+'Config.txt';//путь программы + 'Config.txt'

   AssignFile(f, ConfigWay);//Открытие конфига с настройками
   reset(f);
   PutITrackActive:=true;//добавить запоминание режима плэйлиста(сейчас пока только путь и трэе!)
   readln(f,s);
   If s='Checked : true'
   then begin
            CheckBox1.Checked:=true;
            read(f,s);
            If s<>'' then begin
                            ListBox1.Items.LoadFromFile(s);  //Загрузка плэйлиста
                            Edit1.Text:=s;
                            AutoPlayList:=s;
                            NowPlayList:=s;
                            SortWayTrackPlayList;
                            OpenPlayList:=true;
                          end
            else begin
                    ShowMessage('Установленна автозагрузка Плэйлиста, однако плэй лист не определен, чтобы его определить нажмите PL в разделе плэйлист.');
                    Edit1.Text:='        ---------------------';
                 end;
        end
   else begin
            read(f,s);
            If s<>''
            then begin
                      Edit1.Text:=s;
                      AutoPlayList:=s;
                 end;
        end;
   closefile(f);
   Randomize;
//Config.txt - первоначальна задумывался как хранилище для значений radiobutton1.checked и пути к плэй листу - для автозагрузки
//устранение элементо не доступных к просмотру при запусе
  //Track
  pb1.Visible:=false;
  x.Visible:=False;
  y.Visible:=False;
  Spectrum.Height:=220;
  lbl1.Visible:=False;
  lbl2.Visible:=False;
  pnl1.visible:=False;
  pnl2.visible:=False;
 // pnl3.visible:=False;
  Spectrum.Mode:=1;
  //rqualizer
  trckbr1.Visible:=False;trckbr1.Position:=15;
  trckbr2.Visible:=False;trckbr2.Position:=15;
  trckbr3.Visible:=False;trckbr3.Position:=15;
  trckbr4.Visible:=False;trckbr4.Position:=20;
  trckbr5.Visible:=False;
  trckbr6.Visible:=False;
  txt1.Visible:=False; btn1.Visible:=False;
  txt2.Visible:=False;
  txt3.Visible:=False;
  txt4.Visible:=False;
  txt5.Visible:=false;
  txt6.Visible:=False;
  trckbr5.Position:=0;trckbr6.Position:=1;
  trckbr7.Visible:=false;txt7.Visible:=False;
  trckbr8.Visible:=false;txt8.Visible:=False;
  trckbr9.Visible:=false;txt9.Visible:=False;
  trckbr7.Position:=15;trckbr8.Position:=15;
  trckbr9.Position:=15;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Bass_Free();//Ex

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute = false then exit;//выбор композиции из каталога
  if Stream<>0 then Bass_StreamFree(Stream);//проверка на то, чтобы не сливались 2 песни, если во время проигр одной вы выбрали другую
  Stream:= Bass_StreamCreateFile(false, Pchar(OpenDialog1.fileName), 0, 0, 0);//что проиграть
  if Stream =0 then ShowMessage('Нечего воспроизводить')             //!  рассмотреть параметры, где 0!
  else begin
          Panel1.Caption:=ExtractFileName(OpenDialog1.FileName);//ExtrFN-показывать на панели только название файла и расширение, а не полный путь
          ScrolLBar1.Min:=0;//при открытии файла Скролл переходит в начало
          ScrollBar1.Max:=Bass_ChannelGetLength(Stream,0)-1;//извлечение длинны канала(трека для скрол)
          ScrollBar1.Position:=0 //Чтоб с, выше вычитаем 1
       end;
 { ScrollBar2.Position:=100;}
  end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Bass_ChannelPlay(stream,false);//проиграть
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Bass_ChannelPause(Stream);//Pause
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Bass_ChannelStop(Stream);
  Bass_ChannelSetPosition(Stream,0,0)//Stop
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var FFTFata:TFFTData;WaveData:TWaveData;NewInd,k:Integer;
begin
  If NowStreamScrol=false then
  ScrollBar1.Position:=Bass_ChannelGetPosition(stream,0);//Извл тек позицию трека на скролл барее
  If PlayListPlaying and((ScrollBar1.Max-ScrollBar1.Position)<6000){воспроизведение песенки законченно}
  then begin                 {что дальше?}
            If RandomTrackPlayListActive
            then begin
                      k:=Random(ListBox1.count);
                       ListToPlay(k);
                       ListBox1.ItemIndex:=k;
                 end;
            if CycleTrackPlayListActive
            then begin
                       ListToPlay(ListBox1.ItemIndex);
                 end;
            if ToNextTrackActive
            then begin

                       if ListBox1.ItemIndex=ListBox1.Count-1
                      then ListBox1.ItemIndex:=0
                      else begin
                      if (ListBox1.Items[ListBox1.ItemIndex+1][1]='-')and(PutITrackActive)
                      then ListBox1.ItemIndex:=ListBox1.ItemIndex+1
                      else if (ListBox1.Items[ListBox1.ItemIndex+1][1]<>'-')and(ListBox1.Items[ListBox1.ItemIndex+1][1]<>'')and PutITrackActive
                          then  ListBox1.ItemIndex:=ListBox1.ItemIndex+2;

                      if OnlyTrackActive and(ListBox1.Items[ListBox1.ItemIndex+1]<>'')
                      then ListBox1.ItemIndex:=ListBox1.ItemIndex+1;

                      If ListBox1.Items[ListBox1.ItemIndex]<>''
                      then ListToPlay(ListBox1.ItemIndex);

                        end;

                  end;
       end;
  //далее визуализация потока
  If TrackActive
  then begin
  if BASS_ChannelIsActive(stream) <> BASS_ACTIVE_PLAYING then Exit;

    BASS_ChannelGetData(stream, @FFTFata, BASS_DATA_FFT1024);
    Spectrum.Draw (pb1.Canvas.Handle, FFTFata,x.Position-40,y.Position-60);
      end;
end;

procedure TForm1.ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
begin
  If ScrollCode=scEndScroll
  then begin
          Bass_ChannelSetPosition(Stream,ScrollBar1.Position,0);//Установить позицию в потоке
          NowStreamScrol:=false;//Чтобы ползунок на скрол не двигался сам когда мы перелистываем
       end
  else NowStreamScrol:=true;
end;

procedure TForm1.ScrollBar2Change(Sender: TObject);
begin
Bass_SetVolume(ScrollBar2.Position/100);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
      fastPlay:=False;
      Form1.BitBtn5Click(Sender);
      if FastPlay then begin
          if Stream<>0 then Bass_StreamFree(Stream);//проверка на то, чтобы не сливались 2 песни, если во время проигр одной вы выбрали другую
          Stream:= Bass_StreamCreateFile(false, Pchar(OpenDialog1.fileName), 0, 0, 0);//что проигра
          WriteTags(OpenDialog1.fileName);
          if Stream =0 then ShowMessage('Нечего воспроизводить')//!  рассмотреть параметры, где 0!
          else begin
                  Panel1.Caption:=ExtractFileName(OpenDialog1.FileName);//ExtrFN-показывать на панели только название файла и расширение, а не полный путь
                  ScrolLBar1.Min:=0;//при открытии файла Скролл переходит в начало
                  ScrollBar1.Max:=Bass_ChannelGetLength(Stream,0)-1;//извлечение длинны канала(трека для скрол)
                  ScrollBar1.Position:=0 //Чтоб с, выше вычитаем 1
              end;
          ForStartEqualizer(stream);
          Bass_ChannelPlay(stream,false);//проиграть
          end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
Bass_ChannelPause(Stream);//Pause
PlayListPlaying:=false;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
 Bass_ChannelPlay(stream,false);//проиграть
 PlayListPlaying:=True;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  Bass_ChannelStop(Stream);
  Bass_ChannelSetPosition(Stream,0,0)//Stop
  
end;

procedure TForm1.N2Click(Sender: TObject);
begin
if OpenDialog1.Execute = false then exit;//выбор композиции из каталога
  if Stream<>0 then Bass_StreamFree(Stream);//проверка на то, чтобы не сливались 2 песни, если во время проигр одной вы выбрали другую
  Stream:= Bass_StreamCreateFile(false, Pchar(OpenDialog1.fileName), 0, 0, 0);//что проиграть
  AddMusic(ExtractFileName(OpenDialog1.FileName));//добаить в плэй лист
  if Stream =0 then ShowMessage('Нечего воспроизводить')             //!  рассмотреть параметры, где 0!
  else begin
          Panel1.Caption:=ExtractFileName(OpenDialog1.FileName);//ExtrFN-показывать на панели только название файла и расширение, а не полный путь
          ScrolLBar1.Min:=0;//при открытии файла Скролл переходит в начало
          ScrollBar1.Max:=Bass_ChannelGetLength(Stream,0)-1;//извлечение длинны канала(трека для скрол)
          ScrollBar1.Position:=0 //Чтоб с, выше вычитаем 1
       end;
 { ScrollBar2.Position:=100;}
end;

procedure TForm1.AddMusic(MusicName: String);
begin
     CorrectPlayList:=true;
     ListBox1.Items.Add(MusicName);
end;

procedure TForm1.BitBtn5Click(Sender: TObject);//NofT-имя трэка way - путь
var s,way,NOfT,VrPs,ss:string;i,ls,PosSlash,ChWOT,adrWayInLB3,vrPi,code,n:integer;//ChWOT-значение функции CheckWayOfTrack
    f:TextFile;s1:string;
Function CheckWayOfTrack(Way:string):integer; //posslash-первое вхождение \ vrP - временная переменная
 var i,v,code:integer;f:boolean;s,s1:string;
 begin
      f:=false;
      For i:=0 to ListBox3.Count-1 do
          begin
            s1:=Copy(ListBox3.Items[i],1,(Length(ListBox3.Items[i])-(length(ListBox3.Items[i])-Pos(' ',ListBox3.Items[i]) ) )-1);//путь
            If s1=Way
            then begin
                    f:=true;
                    break
                  end;
          end;
      If  f
      then begin
                s:=Copy(ListBox3.Items[i],((Pos(' ',ListBox3.Items[i]))+1),(Length(ListBox3.Items[i])-((Pos(' ',ListBox3.Items[i])))));
                Val(s,v,code);
                Result:=v
            end
      else Result:=-1;
      adrWayInLB3:=i;
 end;
Function CheckToSovpLB1(Name:string;AdrWay,AdrWayLb3:integer):boolean;
  var s:string;ls,i:integer;
  begin
      If PutITrackActive then begin
          s:=ListBox1.Items[AdrWay+1];
          i:=AdrWay+1;
          While (s[1]='-')and(i<>ListBox1.Count-1) do
           begin
                inc(i);
                ls:=length(s);
                If copy(s,6,ls-5)=Name
                then begin
                        result:=true;
                        break
                     end;
                s:=listbox1.Items[i];
           end;
          inc(i);
          ls:=length(s);
          If copy(s,6,ls-5)=Name
          then result:=true;
      end
      else begin
                for i:=0 to ListBox1.Count-1 do
                    If (ListBox1.Items[i]=Name)and(StrToInt(ListBox4.Items[i])=AdrWayLb3)
                    then begin
                              Result:=true;
                              Break;
                          end;
          end;


  end;
begin
    If OpenDialog1.Execute=False then Exit
    else begin
              s:=OpenDialog1.FileName;
              ls:=Length(s);
              for i:=ls downto 1 do
                  if s[i]='\'
                  then begin
                          posSlash:=i;
                          Break
                        end;
              way:=copy(s,1,ls-(ls-posslash)-1);
              NOfT:=Copy(s,posSlash+1,ls-posSlash);
              ChWOT:=CheckWayOfTrack(way);
              If ChWOT>-1
              then begin
                     if checkToSovpLB1(NofT,ChWOT,AdrWayInLb3)=false
                     then Begin
                                //путь найден, просто добавь трэк по адресу ChWOT+1
                                If PutITrackActive then    //адреса всех путей после данного увеличь на 1
                                    begin
                                      ListBox1.Items.insert(ChWOT+1,'-----'+NofT);//добавить учет листбокс 4 + добавь учет режима
                                      If adrWayInLB3<ListBox3.Count-1
                                      then for i:=adrWayInLB3+1 to ListBox3.Count-1 do//адреса всех путей после данного увеличь на 1
                                               begin
                                                  VrPs:=Copy(ListBox3.Items[i],((Pos(' ',ListBox3.Items[i]))+1),(Length(ListBox3.Items[i])-((Pos(' ',ListBox3.Items[i])))));
                                                  Val(VrPs,vrPi,code);
                                                  Inc(vrPi);VrPs:=ListBox3.Items[i];
                                                  Delete(VrPs,((Pos(' ',VrPs))+1),(Length(VrPs)-((Pos(' ',VrPs))))+1);
                                                  Insert(' '+IntToStr(vrPi),VrPs,Length(VrPs));
                                                  Delete(VrPs,Length(VrPs),1);
                                                  ListBox3.Items[i]:=VrPs;
                                               end;

                                      AssignFile(f,'C:\MusicPlayer3\Проект\TimeFile2.txt');
                                      Rewrite(f);
                                        Begin
                                            For i:=0 to ListBox1.Count-1 do
                                              begin
                                                s:=ListBox1.Items[i];
                                                If s[1]<>'-'
                                                then s1:=s
                                                else Writeln(f,s1+'\'+Copy(s,6,Length(s)-5))
                                              end;
                                        end;
                                       closeFile(f);
                                       NowPlayList:='C:\MusicPlayer3\Проект\TimeFile2.txt';
                                       CorrectPlayList:=True;
                                       FastPlay:=True;
                                    end
                                else begin//добавь трэк в режиме onlyTrackActive
                                        ListBox1.Items.Add(NofT);
                                        ListBox4.Items.Add(IntToStr(adrWayInLB3));
                                        If adrWayInLB3<ListBox3.Count-1
                                        then for i:=adrWayInLB3+1 to ListBox3.Count-1 do//адреса всех путей после данного увеличь на 1
                                               begin
                                                  VrPs:=Copy(ListBox3.Items[i],((Pos(' ',ListBox3.Items[i]))+1),(Length(ListBox3.Items[i])-((Pos(' ',ListBox3.Items[i])))));
                                                  Val(VrPs,vrPi,code);
                                                  Inc(vrPi);VrPs:=ListBox3.Items[i];
                                                  Delete(VrPs,((Pos(' ',VrPs))+1),(Length(VrPs)-((Pos(' ',VrPs))))+1);
                                                  Insert(' '+IntToStr(vrPi),VrPs,Length(VrPs));
                                                  Delete(VrPs,Length(VrPs),1);
                                                  ListBox3.Items[i]:=VrPs;
                                               end;
                                        AssignFile(f,'C:\MusicPlayer3\Проект\TimeFile2.txt');
                                        Rewrite(f);
                                        For i:=0 to ListBox1.Count-1 do
                                              begin
                                                s:=ListBox1.Items[i];
                                                way:=ListBox3.Items[StrToInt(ListBox4.Items[i])];
                                                way:=Copy(way,1,Length(way)-(Length(way)-PosToBack(way,' ')+1));
                                                Writeln(f,way+'\'+s);
                                              end;
                                        closeFile(f);
                                        NowPlayList:='C:\MusicPlayer3\Проект\TimeFile2.txt';
                                        CorrectPlayList:=True;
                                        FastPlay:=True;
                                    end;
                          end
                     else ShowMessage('Такой трэк по такому пути уже добавлен.');
                     end
              else begin//Путь не найден, добавь путь и трэк + позже нужно сделать учет предыдущих сортировок(по алфавиту и тд)
                        If PutItrackActive
                        then Begin
                                  ListBox1.Items.Add(way);
                                  ListBox1.Items.Add('-----'+NOfT);
                                  ListBox3.Items.Add(way+' '+IntToStr(ListBox1.Count-2));
                                  //далее нужно изменить TimeFile2
                                   AssignFile(f,'C:\MusicPlayer3\Проект\TimeFile2.txt');
                                      Rewrite(f);
                                        Begin
                                            For i:=0 to ListBox1.Count-1 do
                                              begin
                                                s:=ListBox1.Items[i];
                                                If s[1]<>'-'
                                                then s1:=s
                                                else Writeln(f,s1+'\'+Copy(s,6,Length(s)-5))
                                              end;
                                        end;
                                   closeFile(f);
                                   NowPlayList:='C:\MusicPlayer3\Проект\TimeFile2.txt';
                                   CorrectPlayList:=True;
                                   FastPlay:=True;
                              end
                        else begin
                                  ss:=ListBox3.Items[ListBox3.count-1];//ss - просто переменная стринг для хранения
                                  ss:=Copy(ss,PosToBack(ss,' ')+1,Length(ss)-(Length(ss)-PosToBack(ss,' ')));
                                  n:=0;
                                  for i:=0 to ListBox4.Count-1 do
                                      If ListBox4.Items[i]=IntToStr(ListBox3.Count-1)
                                      then Inc(n);
                                  n:=StrToInt(ss)+n+1;
                                  ListBox3.Items.Add(way+' '+IntToStr(n));
                                  ListBox1.Items.Add(NOfT);
                                  ListBox4.Items.Add(IntToStr(ListBox3.Count-1));
                                  //далее нужно изменить TimeFile2
                                   AssignFile(f,'C:\MusicPlayer3\Проект\TimeFile2.txt');
                                   Rewrite(f);
                                   For i:=0 to ListBox1.Count-1 do
                                        begin
                                             s:=ListBox1.Items[i];
                                             way:=ListBox3.Items[StrToInt(ListBox4.Items[i])];
                                             way:=Copy(way,1,Length(way)-(Length(way)-PosToBack(way,' ')+1));
                                             Writeln(f,way+'\'+s);
                                        end;
                                   closeFile(f);
                                   NowPlayList:='C:\MusicPlayer3\Проект\TimeFile2.txt';
                                   CorrectPlayList:=true;
                                   FastPlay:=True;
                            end;
                    end;
          end;
end;

procedure TForm1.ListToPlay(I: Integer);
Var ii,v,code,K:integer;s,s1:string;
function GoodBegin(var I:integer;s:string):boolean;//проверка на то, не попали ли мы на путь и воспроизводим его, да - переходим на сл.
begin
    If s[1]<>'-'
    then begin
              Inc(I);
              Result:=false;
         end
    else result:=true;
end;
begin
    if Stream<>0 then Bass_StreamFree(Stream);//проверка на то, чтобы не сливались 2 песни, если во время проигр одной вы выбрали другую
    If ListBox1.Count-1<>-1 then begin
    If PutITrackActive then begin//путь и трэк
    If GoodBegin(I,ListBox1.Items.strings[I])=False then ListBox1.ItemIndex:=I;
    ii:=I;
    Repeat
      Dec(ii);S:=ListBox1.Items.strings[ii]
    until s[1]<>'-';
    s1:=S+'\'+Copy(ListBox1.Items.Strings[I],6,Length(ListBox1.Items.Strings[I])-5);
   // Stream:=Bass_StreamCreateFile(False,Pchar(s1), 0, 0, 0{ListBox1.Items.Strings[I]});
    Stream:=Bass_StreamCreateFile(False,Pchar(s1), 0, 0, 0);
     if Stream =0 then ShowMessage('Нечего воспроизводить')             //!  рассмотреть параметры, где 0!
     else begin
          Panel1.Caption:=ExtractFileName(Copy(ListBox1.Items.Strings[I],6,Length(ListBox1.Items.Strings[I])-5));//ExtrFN-показывать на панели только название файла и расширение, а не полный путь
          ScrolLBar1.Min:=0;//при открытии файла Скролл переходит в начало
          ScrollBar1.Max:=Bass_ChannelGetLength(Stream,0)-1;//извлечение длинны канала(трека для скрол)
          ScrollBar1.Position:=0; //Чтоб с, выше вычитаем 1
          WriteTags(s1);
          PlayListPlaying:=True;
       end;
     end
    else begin//Только трэк
              val(listbox4.Items.strings[I],v,code);
              K:=PosToback(ListBox3.Items[v],' ');
              s1:=Copy(ListBox3.Items[v],1,(Length(ListBox3.Items[v])-(length(ListBox3.Items[v])-k ) )-1);//путь Не работает для большого пути?!
              s1:=s1+'\'+ListBox1.Items.Strings[I];
              Stream:=Bass_StreamCreateFile(False,Pchar(s1), 0, 0, 0);
              if Stream =0 then ShowMessage('Нечего воспроизводить')             //!  рассмотреть параметры, где 0!
              else begin
                        Panel1.Caption:={ExtractFileName(Copy(}ListBox1.Items.Strings[I]{,6,Length(ListBox1.Items.Strings[I])-5))};//ExtrFN-показывать на панели только название файла и расширение, а не полный путь
                        ScrolLBar1.Min:=0;//при открытии файла Скролл переходит в начало
                        ScrollBar1.Max:=Bass_ChannelGetLength(Stream,0)-1;//извлечение длинны канала(трека для скрол)
                        ScrollBar1.Position:=0; //Чтоб с, выше вычитаем 1
                        WriteTags(s1);
                  end;
          end;
  {ScrollBar2.Position:=100;}
   ForStartEqualizer(stream);
   Bass_ChannelPlay(stream,false);//проиграть
   end;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
    If ListBox1.ItemIndex=-1 then ListBox1.ItemIndex:=0;
    ListToPlay(ListBox1.ItemIndex);
end;

procedure TForm1.ListBox1DblClick(Sender: TObject);
begin
    ListToPlay(ListBox1.ItemIndex);
end;

procedure TForm1.BitBtn8Click(Sender: TObject);
Var Ind,VrPi,code,i,adrwayInLb3,buttonselected,n,j:Integer;VrPs,way,s,s1:string;f:Integer;ff:TextFile;
Function CheckWayOfTrack(Way:string):integer; //posslash-первое вхождение \ vrP - временная переменная
 var i,v,code:integer;f:boolean;s,s1:string;
 begin
      f:=false;
      For i:=0 to ListBox3.Count-1 do
          begin
            s1:=Copy(ListBox3.Items[i],1,(Length(ListBox3.Items[i])-(length(ListBox3.Items[i])-Pos(' ',ListBox3.Items[i]) ) )-1);//путь
            If s1=Way
            then begin
                    f:=true;
                    break
                  end;
          end;
      If  f
      then begin
                s:=Copy(ListBox3.Items[i],((Pos(' ',ListBox3.Items[i]))+1),(Length(ListBox3.Items[i])-((Pos(' ',ListBox3.Items[i])))));
                Val(s,v,code);
                Result:=v
            end
      else Result:=-1;
      adrWayInLB3:=i;
 end;
begin
    If (ListBox1.Count-1<>-1) then begin
      CorrectPlayList:=true;
     If  PutITrackActive
     then begin
          if ListBox1.Items[ListBox1.ItemIndex][1]='-'
          then begin
                    //определить индекс пути в лб3
                    for i:=ListBox1.ItemIndex downto 0 do
                        if ListBox1.Items[i][1]<>'-'
                        then begin
                                way:=ListBox1.Items[i];
                                Break;
                             end;

                    f:=CheckWayOfTrack(way);
                     If adrwayInLb3<ListBox3.Count-1
                    then for i:=adrwayInLb3+1 to ListBox3.Count-1 do//адреса всех путей после данного уменьшить на 1
                    begin
                     VrPs:=Copy(ListBox3.Items[i],((Pos(' ',ListBox3.Items[i]))+1),(Length(ListBox3.Items[i])-((Pos(' ',ListBox3.Items[i])))));
                     Val(VrPs,vrPi,code);
                     dec(vrPi);VrPs:=ListBox3.Items[i];
                     Delete(VrPs,((Pos(' ',VrPs))+1),(Length(VrPs)-((Pos(' ',VrPs))))+1);
                     Insert(' '+IntToStr(vrPi),VrPs,Length(VrPs));
                     Delete(VrPs,Length(VrPs),1);
                     ListBox3.Items[i]:=VrPs;
                    end;
                    Ind:=ListBox1.ItemIndex;  //удаление из плэйлиста
                    ListBox1.Items.Delete(Ind);
                    If ListBox1.ItemIndex>0
                    then ListBox1.ItemIndex:=Ind-1//перемещение курсора на передыдущую композицию в плэйлисте
                    else ListBox1.ItemIndex:=-1;

                end
           else begin //удалить путь(все трэки данного пути)
                    buttonselected:= MessageDlg('Удалить все трэки по данному пути?',mtCustom,
                    [mbYes,mbNo], 0);
                    if buttonselected=mrYes
                    then begin
                              //определим колличество элементов данного пути
                              n:=0;
                              for j:= ListBox1.ItemIndex+1 to ListBox1.Count-1 do
                                  If ListBox1.Items[j][1]='-'
                                  then Inc(n)
                                  else Break;
                               Inc(n);//учтем сам путь, который удалится
                              f:=CheckWayOfTrack(ListBox1.Items[ListBox1.ItemIndex]);
                               If adrwayInLb3<ListBox3.Count-1
                                then for i:=adrwayInLb3+1 to ListBox3.Count-1 do//адреса всех путей после данного уменьшить на кол-во элементов данного пути
                                begin
                                 VrPs:=Copy(ListBox3.Items[i],((Pos(' ',ListBox3.Items[i]))+1),(Length(ListBox3.Items[i])-((Pos(' ',ListBox3.Items[i])))));
                                 Val(VrPs,vrPi,code);
                                 dec(vrPi,n);VrPs:=ListBox3.Items[i];
                                 Delete(VrPs,((Pos(' ',VrPs))+1),(Length(VrPs)-((Pos(' ',VrPs))))+1);
                                 Insert(' '+IntToStr(vrPi),VrPs,Length(VrPs));
                                 Delete(VrPs,Length(VrPs),1);
                                 ListBox3.Items[i]:=VrPs;
                                end;
                               ListBox3.Items.Delete(adrwayInLb3);
                               //далее удаляем из лб1 трэки
                               Ind:=ListBox1.ItemIndex;
                               for j:=ListBox1.ItemIndex to (ListBox1.ItemIndex+(n-1)) do
                               ListBox1.Items.Delete(Ind);

                          end
                    else begin
                          end;
                end;
            AssignFile(ff,'C:\MusicPlayer3\Проект\TimeFile2.txt');
            Rewrite(ff);
            Begin
            For i:=0 to ListBox1.Count-1 do
                begin
                  s:=ListBox1.Items[i];
                  If s[1]<>'-'
                  then s1:=s
                  else Writeln(ff,s1+'\'+Copy(s,6,Length(s)-5))
                end;
            end;
            closeFile(ff);
            NowPlayList:='C:\MusicPlayer3\Проект\TimeFile2.txt';
            CorrectPlayList:=True;
          end;
     If OnlyTrackActive
     then begin
                If StrToInt(ListBox4.Items[ListBox1.ItemIndex])<ListBox3.Count-1
                then for i:=StrToInt(ListBox4.Items[ListBox1.ItemIndex])+1 to ListBox3.Count-1 do//адреса всех путей после данного уменьшить на 1
                begin
                 VrPs:=Copy(ListBox3.Items[i],((Pos(' ',ListBox3.Items[i]))+1),(Length(ListBox3.Items[i])-((Pos(' ',ListBox3.Items[i])))));
                 Val(VrPs,vrPi,code);
                 dec(vrPi);VrPs:=ListBox3.Items[i];
                 Delete(VrPs,((Pos(' ',VrPs))+1),(Length(VrPs)-((Pos(' ',VrPs))))+1);
                 Insert(' '+IntToStr(vrPi),VrPs,Length(VrPs));
                 Delete(VrPs,Length(VrPs),1);
                 ListBox3.Items[i]:=VrPs;
                end;

                Ind:=ListBox1.ItemIndex;  //удаление из плэйлиста
                ListBox1.Items.Delete(Ind);
                If ListBox1.ItemIndex>0
                then ListBox1.ItemIndex:=Ind-1//перемещение курсора на передыдущую композицию в плэйлисте
                else ListBox1.ItemIndex:=-1;

                AssignFile(ff,'C:\MusicPlayer3\Проект\TimeFile2.txt');
                Rewrite(ff);
                For i:=0 to ListBox1.Count-1 do
                begin
                     s:=ListBox1.Items[i];
                     way:=ListBox3.Items[StrToInt(ListBox4.Items[i])];
                     way:=Copy(way,1,Length(way)-(Length(way)-PosToBack(way,' ')+1));
                     Writeln(ff,way+'\'+s);
                end;
                closeFile(ff);
                NowPlayList:='C:\MusicPlayer3\Проект\TimeFile2.txt';
                CorrectPlayList:=True;
          end;
      //далее сохраняем тек плэйлист в временный файл
      

    if Stream<>0 then Bass_StreamFree(Stream);//проверка на то, чтобы не сливались 2 песни, если во время проигр одной вы выбрали другую
    Panel1.Caption:='';//Надпись музыки после удалениея ее из плэйлиста необходимо убрать
    end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  OpenPlayList:=True;CorrectPlayList:=True;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
    Bass_Free();//Exit  Кнопка выход
    Form1.Close;
end;

procedure TForm1.ListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var Ind:Integer;
begin
    If Key=VK_Delete then
    Begin
      //проверка на попадаемость в путь и если все трэки этого пути удалены, то очисти и  от пути+
      //Если удалил в одном режиме только трэк, то удали и во 2м, исправь координаты в листбокс2
     { CorrectPlayList:=True;
      Ind:=ListBox1.ItemIndex;  //удаление из плэйлиста
      ListBox1.Items.Delete(Ind);
      If ListBox1.ItemIndex>0
      then ListBox1.ItemIndex:=Ind-1//перемещение курсора на передыдущую композицию в плэйлисте
      else ListBox1.ItemIndex:=-1;  }
      Form1.BitBtn8Click(Sender);
      if Stream<>0 then Bass_StreamFree(Stream);//проверка на то, чтобы не сливались 2 песни, если во время проигр одной вы выбрали другую
      Panel1.Caption:='';//Надпись музыки после удалениея ее из плэйлиста необходимо убрать
    End;
end;

procedure TForm1.N6Click(Sender: TObject);
var Way,s:string;i,e:Integer;
begin
      If dlgSave1.Execute=False then Exit;   //сохранение плэйлиста
      If PutITrackActive then
       begin                            //переделать листбокс в стандартный вид для записи в тхт документ и для дальнейшей загрузки
          i:=0;e:=ListBox1.Count-1;
          While i<>e+1 do
            begin
             If ListBox1.Items[i][1]<>'-'
             then begin
                     way:=ListBox1.Items[i];
                     ListBox1.Items.Delete(i);Dec(e);
                  end
             else
              begin
                  s:=ListBox1.Items[i];
                  Delete(s,1,5);
                  Insert(way+'\',s,1);
                  ListBox1.Items[i]:=s;
                  Inc(i);
              end;
              end;
             ListBox3.Clear;
             ListBox1.Items.SaveToFile(dlgSave1.FileName);//запись в файл
            SortWayTrackPlayList;//возвращение к исходному состоянию
            end
      else
       begin

       end;
      SavePlayList:=True;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  OpenPlayList:=True;
  If OpenDialog2.Execute=True
  then begin
          ListBox1.Items.LoadFromFile(OpenDialog2.FileName);  //Загрузка плэйлиста
          ListBox3.Clear;
          NowPlayList:=OpenDialog2.FileName;
          SortWayTrackPlayList;
       end;
end;

procedure TForm1.N9Click(Sender: TObject);
begin            //Загрузка тем
    If OpenDialog3.Execute= True then
    Begin
          //Image1.Picture.LoadFromFile(OpenDialog3.FileName);
    End;
end;

procedure TForm1.N8Click(Sender: TObject);
var buttonSelected,i,j,c:Integer;
begin
  IF OpenPlayList
  then begin
        if (SavePlayList=False)and(CorrectPlayList)
        Then begin
               buttonSelected := MessageDlg('Плэйлист не был сохранен, не сохранять?',mtCustom,
               [mbYes,mbNo,mbCancel], 0); // Отображение заказного диалога
               // Показ типа выбранной кнопки
               if buttonSelected = mrYes
               then begin
                     if ListBox1.count<>0
                     then For i:=1 to ListBox1.Count do
                              Begin
                                   //удаление из плэйлиста
                                    C:=ListBox1.Count;
                                    ListBox1.ItemIndex:=0;
                                    for j:=1 to c do
                                     Begin
                                           ListBox1.Items.Delete(Listbox1.ItemIndex);
                                           listBox1.ItemIndex:=listBox1.ItemIndex+1;
                                     end;
                              End
                     end;
               if buttonSelected = mrNo    then //сохраняй
                Begin
                    If SaveDialog1.Execute=False then Exit;   //сохранение плэйлиста
                    ListBox1.Items.SaveToFile(SaveDialog1.FileName);  //+- работает
                    SavePlayList:=True;
                    SavePlayList:=False;CorrectPlayList:=false;OpenPlayList:=False;
                End;
               {If buttonSelected = mrCancel
               then begin end;}
             end
          Else If ((SavePlayList=False)or(SavePlayList))And(CorrectPlayList=false)
                then begin//закрой и сотри
                          ListBox1.Clear;
                          ListBox2.Clear;
                          ListBox3.Clear;
                          NowPlayList:='';
                     end;
       end;
end;


procedure TForm1.WriteTags(FileName: string);
var Tag:TID3v2;
begin
Tag:=TID3v2.Create; // создали
Tag.ReadFromFile(FileName);
if Tag.Exists
then begin
      {  LablID.caption:=IntToStr(Tag.VersionID);
        LablTitel.caption:=Tag.Title;
        LablYear.Caption:=Tag.Year;
        LablAlbum.Caption:=Tag.Album;
        LablArtist.caption:=Tag.Artist;
        LablComment.Caption:=Tag.Comment;
        LablGenre.caption:=Tag.Genre;
        }
         Listbox2.Items.Clear;
        { ListBox2.Items.Add(IntToStr(Tag.VersionID));}
         ListBox2.Items.Add('Title'+' '+' '+' '+' '+' '+' '+' '+' '+':'+' '+' '+Tag.Title);
         ListBox2.Items.Add('Year'+' '+' '+' '+' '+' '+' '+' '+':'+' '+' '+Tag.Year);
         ListBox2.Items.Add('Album'+' '+' '+' '+' '+' '+':'+' '+' '+Tag.Album);
         ListBox2.Items.Add('Artist'+' '+' '+' '+' '+' '+' '+' '+':'+' '+' '+Tag.Artist);
         ListBox2.Items.Add('Comment:'+' '+' '+Tag.Comment);
         ListBox2.Items.Add('Genre'+' '+' '+' '+' '+' '+':'+' '+' '+Tag.Genre);
         ListBox2.Items.Add('Time'+' '+' '+' '+' '+' '+' '+' '+':'+' '+' '+ShowTime(BASS_ChannelGetLength(stream,0) div (3600*49) ));
    end;
Tag.free;// чистим память
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
begin
    //видимость плэйлиста
     TrackActive:=true;PlayListActive:=false;RadioActive:=false;equalizerActive:=False;
     ListBox1.Visible:=false; ListBox2.Visible:=false;ListBox3.Visible:=false;
     ListBox4.Visible:=false;
     BitBtn5.Visible:=false;
     BitBtn6.Visible:=false;
     BitBtn8.Visible:=false;
     BitBtn12.Visible:=false;
     BitBtn11.Visible:=false;
     BitBtn13.Visible:=false;
     BitBtn15.Visible:=false;
     BitBtn14.Visible:=false;
     Combobox3.Visible:=false;
     Combobox1.Visible:=false;
     Edit2.Visible:=false; Edit1.Visible:=false;
     label3.Visible:=false;Label1.Visible:=false;Label4.Visible:=False;
     StaticText1.Visible:=false;
     CheckBox1.Visible:=false;
     //видимость трэка
     pb1.Visible:=True;




     x.Visible:=false;
     y.Visible:=false;

     lbl1.Visible:=false;
     lbl2.Visible:=false;
     pnl1.visible:=True;
     pnl2.visible:=True;
    // pnl3.visible:=True;
     //equalizer
     trckbr1.Visible:=False;
     trckbr2.Visible:=False;
     trckbr3.Visible:=False;
     trckbr4.Visible:=False;
     txt1.Visible:=False;
     txt2.Visible:=False;
     txt3.Visible:=False;btn1.Visible:=False;
     txt4.Visible:=False;
     trckbr5.Visible:=false;
     trckbr6.Visible:=false;
     txt5.Visible:=false;
     txt6.Visible:=false;
     trckbr7.Visible:=false;txt7.Visible:=False;
     trckbr8.Visible:=false;txt8.Visible:=False;
     trckbr9.Visible:=false;txt9.Visible:=False;

end;

function TForm1.ShowTime(const Sec: integer): string;  //преобразует время трека
var H, M, S: Integer;
begin
    H:=Sec div 3600;
    S:=Sec mod 3600;
    M:=S div 60;
    S:=(S mod 60);
    if H <> 0 then
      Result:=Format('%2.2d:%2.2d:%2.2d', [H,M,S])
      else Result:=Format('%2.2d:%2.2d', [M,S]);
end;

function TForm1.CheckToPovtor(s:string): boolean;
var i,c:integer;f:boolean;
begin
    c:=ListBox1.Items.Count;
    f:=false;
    For i:=0 to c-1 do
        If S = ListBox1.items[i]
        then f:=true;

    If f then Result:=true
    else result:=false;
end;

procedure TForm1.BitBtn11Click(Sender: TObject);
var f:TextFile;s:string;
begin
    If OpenDialog4.Execute=true
    then  begin
              Edit1.Text:={ExtractFileName}OpenDialog4.FileName;  //OpenDialog4 - только для автозагрузки плэйлиста!!!
              AutoPlayList:=OpenDialog4.FileName;
          end;
end;



procedure TForm1.BitBtn12Click(Sender: TObject);
Var f:TextFile;
begin
     AssignFile(f,ConfigWay);
     Rewrite(f);
     Case CheckBox1.Checked of
                True:Writeln(f,'Checked : true');
                False:Writeln(f,'Checked : false');
     end;
     write(F,AutoPlayList);
     CloseFile(f);
end;




procedure TForm1.AddWithInicWay(s: string);
begin

end;

procedure TForm1.SortWayTrackPlayList;
Var i,AdrWay,v,code,j,n,now,nowadr,adrinLb3:integer;s1,s,way:string;fSl:boolean;//fSL- если нет, то след.элемент в плэйлисте обработан и является названием трэка
CountNow,PosSlash:integer;VrPs:string;VrPi,k:Integer;
//Настоящее число элементов листбокс1
//PosSlash - первое вхождение '/' с конца
Function CheckWayOfTrack(Way:string):integer;
 var i,v,code:integer;f:boolean;s,s1:string;
 begin
      nowadr:=-1;
      f:=false;
      For i:=0 to ListBox3.Count-1 do
          begin                                                                              //замена на функцию PosToBack
            s1:=Copy(ListBox3.Items[i],1,(Length(ListBox3.Items[i])-(length(ListBox3.Items[i])-Pos(' ',ListBox3.Items[i]) ) )-1);//путь
            If s1=Way
            then begin
                    f:=true;
                    break
                  end;
          end;
      adrinLb3:=i;
      If  f
      then begin                            //замена на функцию PosToBack                                //замена на функцию PosToBack
                s:=Copy(ListBox3.Items[i],(( Pos(' ',ListBox3.Items[i]) )+1),(Length(ListBox3.Items[i])-(( Pos(' ',ListBox3.Items[i])))));
                Val(s,v,code);
                Result:=v
            end
      else Result:=-1;
 end;
begin
     If ListBox1.Count-1<>-1 then begin
     fSl:=true;
     CountNow:=ListBox1.Count-1;
     i:=-1;
     Repeat
            Inc(i);
            s:=ListBox1.Items[i];
            If Fsl
            then begin
                      For j:=Length(s) downto 1 do
                      If s[j]='\' then break;
                      PosSlash:=j;
                      Way:=copy(s,1,j-1);
                      AdrWay:=CheckWayOfTrack(way);
                      If AdrWay>-1  //такой адрес есть и вот адрес его пути в лб1 его путь, просто добавь песню под адрес в лб1 и увеличб кол-во элем.
                      then begin
                                s1:=Copy(s,PosSlash+1,Length(s)-(Length(way)+1));
                                ListBox1.Items.Delete(i);
                                ListBox1.Items.Insert(AdrWay+1,'-----'+s1);
                                //далее все пути в лб 3 увеличь на 1, ведб в данном пути колличество элементов увеличилось на 1
                                 If adrinLb3<ListBox3.Count-1
                                      then for k:=adrInLB3+1 to ListBox3.Count-1 do//адреса всех путей после данного увеличь на 1
                                               begin
                                                  VrPs:=Copy(ListBox3.Items[k],((Pos(' ',ListBox3.Items[k]))+1),(Length(ListBox3.Items[k])-((Pos(' ',ListBox3.Items[k])))));
                                                  Val(VrPs,vrPi,code);
                                                  Inc(vrPi);VrPs:=ListBox3.Items[k];
                                                  Delete(VrPs,((Pos(' ',VrPs))+1),(Length(VrPs)-((Pos(' ',VrPs))))+1);
                                                  Insert(' '+IntToStr(vrPi),VrPs,Length(VrPs));
                                                  Delete(VrPs,Length(VrPs),1);
                                                  ListBox3.Items[k]:=VrPs;
                                               end;       

                            end
                      else begin //такого пути не встречалось, добавим новый в лб3 и его адрес
                                 ListBox3.Items.Add(Way+' '+IntToStr(i));//в листбоксе элементы с 0
                                 s1:=Copy(s,PosSlash+1,Length(s)-(Length(way)+1));
                                 //s1- название трэка
                                 If i<>ListBox1.Count-1
                                 then ListBox1.Items.Insert(i+1,'-----'+s1)
                                 else ListBox1.items.Add('-----'+s1);
                                 ListBox1.Items[i]:=way;
                                 fSl:=false;//(I+1)й элемент уже обработан
                                 Inc(CountNow);
                          end;
                  end
            else Begin
                      fSl:=True;
                 end;
     Until i=CountNow;
     If OnlyTrackActive then begin
        //удали пути
                     //сотри все пути
                     N:=ListBox1.Count;
                     Now:=0;
                     While Now<>n do
                      begin
                            s:=ListBox1.Items.Strings[now];
                            If s[1]<>'-'
                            then begin
                                      ListBox1.Items.Delete(now);
                                      dec(n);
                                      Inc(NowAdr);
                                 end
                            else begin
                                      Delete(s,1,5);
                                      ListBox1.Items.Strings[now]:=s;
                                      Inc(now);
                                      ListBox4.Items.Add(IntToStr(NowAdr));
                                  end;
                      end;
     end;
     end;
end;




procedure TForm1.ComboBox3Change(Sender: TObject);
var s:string;n,i,Now,NowAdr:integer;IndLb4,wayadr:Integer;OldTrack,g:string;f:Boolean;
begin
    //При смене типа если в другом была применена сортировка, то при смене режима она опять применяется, только под этим режимом!
    {PutITrackActive:=false; я хз зачем это нужно?!
    OnlyTrackActive:=false;}
    i:=ComboBox3.ItemIndex;
    NowAdr:=-1;
    Case i of
    0:begin
                If (PutiTrackActive=false)and(listBox1.count>-1) then
                begin
                      //запомни, на каком трэке сейчас ItemIndex и после восстановления перемести его на этотт трэк
                      f:=false;
                      If ListBox1.ItemIndex<>-1
                      then begin
                              f:=True;//Да, стоит на трэке
                               IndLb4:=StrToInt(ListBox4.Items[ListBox1.ItemIndex]);
                               OldTrack:=ListBox1.Items[ListBox1.ItemIndex];
                            end;
                      //если уже не это, то загрузи снова и отсортируй плэйлист
                      PutITrackActive:=true;
                      OnlyTrackActive:=false;
                      ListBox1.Items.LoadFromFile(NowPlayList);  //Загрузка плэйлиста
                      ListBox3.Clear;
                      ListBox4.Clear;
                      SortWayTrackPlayList;
                      If Edit2.text<>'' then
                      FilterText(Edit2.Text);
                      If f then
                        begin
                            g:=ListBox3.Items[IndLb4];
                            wayadr:=StrToInt(Copy(g,PosToBack(g,' ')+1,Length(g)-PosToBack(g,' ')));
                            For i:=wayadr+1 to ListBox1.Count-1 do
                                If Copy(ListBox1.Items[i],6,Length(ListBox1.Items[i])-5)=OldTrack
                                then begin
                                        ListBox1.ItemIndex:=i;
                                        Break;
                                      end;
                        end;
                        end;

          end;
    1:begin
              If (OnlyTrackActive=false)and(listBox1.count>-1) then
                begin
                     //удали пути
                     OnlyTrackActive:=true;
                     PutITrackActive:=false;
                     //сотри все пути
                     N:=ListBox1.Count;
                     Now:=0;
                     While Now<>n do
                      begin
                            s:=ListBox1.Items.Strings[now];
                            If s[1]<>'-'
                            then begin
                                      ListBox1.Items.Delete(now);
                                      dec(n);
                                      Inc(NowAdr);
                                 end
                            else begin
                                      Delete(s,1,5);
                                      ListBox1.Items.Strings[now]:=s;
                                      Inc(now);
                                      ListBox4.Items.Add(IntToStr(NowAdr));
                                  end;
                      end;
                end;
          end;
    end;
end;

procedure TForm1.BitBtn9Click(Sender: TObject);
begin
    //плэйлист
     TrackActive:=false;PlayListActive:=true;RadioActive:=false;equalizerActive:=False;
     ListBox1.Visible:=true; ListBox2.Visible:=true;ListBox3.Visible:=true;

     ListBox4.Visible:=false;

     BitBtn5.Visible:=true;
     BitBtn6.Visible:=true;
     BitBtn8.Visible:=true;
     BitBtn12.Visible:=true;
     BitBtn11.Visible:=true;
     BitBtn13.Visible:=true;
     BitBtn15.Visible:=true;
     BitBtn14.Visible:=true;
     Combobox3.Visible:=true;
     Combobox1.Visible:=true;
     Edit2.Visible:=true; Edit1.Visible:=true;
     label3.Visible:=true;Label1.Visible:=true;Label4.Visible:=False;
     StaticText1.Visible:=true;
     CheckBox1.Visible:=true;
     //трэк
     pb1.Visible:=false;


     x.Visible:=False;
     y.Visible:=False;
     lbl1.Visible:=False;
     lbl2.Visible:=False;
     pnl1.visible:=False;
     pnl2.visible:=False;
    // pnl3.visible:=False;
     //equalizer
     trckbr1.Visible:=False;
     trckbr2.Visible:=False;
     trckbr3.Visible:=False;
     trckbr4.Visible:=False;
     txt1.Visible:=False;
     txt2.Visible:=False;btn1.Visible:=False;
     txt3.Visible:=False;
     txt4.Visible:=False;
     trckbr5.Visible:=false;
     trckbr6.Visible:=false;
     txt5.Visible:=false;
     txt6.Visible:=false;
     trckbr7.Visible:=false;txt7.Visible:=False;
     trckbr8.Visible:=false;txt8.Visible:=False;
     trckbr9.Visible:=false;txt9.Visible:=False;
end;

function TForm1.PosToBack(x: string; s: char): integer;//ищет 1е вхожднение S с конца, х - строка  S - символ
var I,L:integer;
begin
  L:=Length(x);
  for i:=L downto 1 do
      If x[i]=s
      then begin
              result:=i;
              break;
           end;
end;

procedure TForm1.BitBtn15Click(Sender: TObject);
begin
    If Edit2.text<>'' then
    FilterText(Edit2.Text)
    else ShowMessage('Нечего искать!')
end;

procedure TForm1.BitBtn14Click(Sender: TObject);
begin
  FilterTextReset;
  Edit2.Text:='';
end;

procedure TForm1.FilterText(ftext:string);
var i,s:integer;f:boolean;
begin
   If OnlyTrackActive then begin//на экране только трэки
   i:=0;
    repeat
      if (ListBox1.Count<>-1)and(pos(ftext,ListBox1.Items[i])=0)
      then
      begin
          ListBox1.Items.Delete(i);
          ListBox4.Items.Delete(i);
      end
      else inc(i);
    until i>=ListBox1.Items.Count;
    end
    else begin//на экране трэки и пути
            i:=0;
            repeat
            //если то что ищем проистутствует в части пути, то выводим все трэки этого пути
            If (ListBox1.Items[i][1]<>'-')
            then begin
                   if (pos(ftext,ListBox1.Items[i])<>0)
                   then f:=false{не удоляй далее следующие трэки}
                   else f:=true;{удаляй }
                 end;

            if (pos(ftext,ListBox1.Items[i])=0)and(ListBox1.Items[i][1]='-')and f then
            ListBox1.Items.Delete(i)
            else inc(i);
            until i>=ListBox1.Items.Count;
            {уничтожить лишние пути! 3 варианта сверху снизу в середине}
            i:=-1;s:=ListBox1.Items.Count;
            Repeat
                  Inc(i);
                  If (i<>s-1)and(ListBox1.Items[i][1]<>'-')
                  then begin
                        If ListBox1.Items[i+1][1]<>'-'
                        then begin
                                 ListBox1.Items.Delete(i);
                                 Dec(s);Dec(i);
                            end;
                       end;
            Until i=s-1;
            If ListBox1.Items[i][1]<>'-'
            then ListBox1.Items.Delete(i);
        end;
end;

procedure TForm1.FilterTextReset;
begin
    //загрузи снова и отсортируй плэйлист
    ListBox1.Items.LoadFromFile(NowPlayList);  //Загрузка плэйлиста
    ListBox3.Clear;
    ListBox4.Clear;
    SortWayTrackPlayList;
end;


procedure TForm1.BitBtn16Click(Sender: TObject);
begin
  RandomTrackPlayListActive:=true;
  CycleTrackPlayListActive:=false;
  ToNextTrackActive:=false;
end;

procedure TForm1.BitBtn17Click(Sender: TObject);
begin
   RandomTrackPlayListActive:=false;
   CycleTrackPlayListActive:=true;
   ToNextTrackActive:=false;
end;

procedure TForm1.BitBtn18Click(Sender: TObject);
begin
      //видимость плэйлиста
     TrackActive:=False;PlayListActive:=false;RadioActive:=false;equalizerActive:=False;
     ListBox1.Visible:=false; ListBox2.Visible:=false;ListBox3.Visible:=false;
     ListBox4.Visible:=false;
     BitBtn5.Visible:=false;
     BitBtn6.Visible:=false;
     BitBtn8.Visible:=false;
     BitBtn12.Visible:=false;
     BitBtn11.Visible:=false;
     BitBtn13.Visible:=false;
     BitBtn15.Visible:=false;
     BitBtn14.Visible:=false;
     Combobox3.Visible:=false;
     Combobox1.Visible:=false;
     Edit2.Visible:=false; Edit1.Visible:=false;
     label3.Visible:=false;Label1.Visible:=false;Label4.Visible:=False;
     StaticText1.Visible:=false;
     CheckBox1.Visible:=false;
     //видимость трэка
     pb1.Visible:=False;
     x.Visible:=False;
     y.Visible:=false;
     lbl1.Visible:=False;
     lbl2.Visible:=False;
     pnl1.visible:=False;
    pnl2.visible:=False;
   // pnl3.visible:=False;
    //equalizer
     trckbr1.Visible:=True;
     trckbr2.Visible:=True;
     trckbr3.Visible:=True;
     trckbr4.Visible:=True;
     txt1.Visible:=True;
     txt2.Visible:=True;
     txt3.Visible:=True;
     txt4.Visible:=True;  btn1.Visible:=True;
     trckbr5.Visible:=true;
     trckbr6.Visible:=true;
     txt5.Visible:=True;
     txt6.Visible:=True;
     trckbr7.Visible:=true;txt7.Visible:=true;
     trckbr8.Visible:=true;txt8.Visible:=true;
     trckbr9.Visible:=true;txt9.Visible:=true;

end;

procedure TForm1.BitBtn19Click(Sender: TObject);
begin
      RandomTrackPlayListActive:=false;
      CycleTrackPlayListActive:=false;
      ToNextTrackActive:=true;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var x,y,i,j,j1,k,k1:Integer;way,wayAdr,s,s1:string;
    f:TextFile;
begin
  //  Если сортировка уже применена и выбрана другая, то мы восстанавливаем стандартынй выд(загружаем плэйлист) и выполняем сортировки, выбранные до этого
    Case ComboBox1.ItemIndex of
    0:begin
           ListBox1.Items.LoadFromFile('C:\MusicPlayer3\Проект\TimeFile3.txt');  //Загрузка плэйлиста
           ListBox3.Clear;
           ListBox4.Clear;
           if PutITrackActive
           then SortWayTrackPlayList;
           If OnlyTrackActive then
            begin
                    SortWayTrackPlayList;
                    Form1.ComboBox3Change(Sender);
              end;
            SaveToBack:=False;
      end;
    1:Begin//A-Z
          //Записать, то, что в плэйлисте(что взяли, то и вернули)(если адр сортировка, то сначала она, потом остальные, при включенных всех и выключении адресной, все сбрасывается, и при включенных всех и включении адресной все опять сбрасываются)
          If SaveToBack = False
          then begin
                    AssignFile(f,'C:\MusicPlayer3\Проект\TimeFile3.txt');
                     Rewrite(f);
                     If PutITrackActive then
                      Begin
                          For i:=0 to ListBox1.Count-1 do
                            begin
                              s:=ListBox1.Items[i];
                              If s[1]<>'-'
                              then s1:=s
                              else Writeln(f,s1+'\'+Copy(s,6,Length(s)-5))
                            end;
                      end
                     else Begin
                             For i:=0 to ListBox1.Count-1 do
                                 begin
                                    s:=ListBox1.Items[i];
                                    way:=ListBox3.Items[StrToInt(ListBox4.Items[i])];
                                    way:=Copy(way,1,Length(way)-(Length(way)-PosToBack(way,' ')+1));
                                    Writeln(f,way+'\'+s);
                                 end;
                        end;
                     closeFile(f);
                     SaveToBack:=True;
                end;
          if OnlyTrackActive then begin
          for i := 0 to (ListBox1.Items.Count - 1) do
              for x := 0 to (ListBox1.Items.Count - 1) do
                if (ListBox1.Items[x] < ListBox1.Items[i]) and (x > i) then
                begin
                    ListBox1.Items.Insert(i, ListBox1.Items[x]);
                    ListBox1.Items.Delete(x + 1);
                    ListBox4.Items.Insert(i, ListBox4.Items[x]);
                    ListBox4.Items.Delete(x + 1);
                end;
          end
          else begin//PutITrack
                    for i:=0 to ListBox3.Count-1 do
                    begin
                          //просто в каждом пути отсортируй трэки
                          way:=ListBox3.Items[i];
                          wayadr:=Copy(way,PosToBack(way,' ')+1,Length(way)-PosToBack(way,' '));
                          If i<>ListBox3.Count-1
                          then begin
                                    way:=ListBox3.Items[i+1];
                                    s1:=Copy(way,PosToBack(way,' ')+1,Length(way)-PosToBack(way,' '));//wayadr2
                                    k:=StrToInt(wayadr)+1;
                                    k1:=StrToInt(s1)-1;
                                end
                          else begin
                                  k:=StrToInt(wayadr)+1;
                                  k1:=ListBox1.Count-1;
                               end;
                          for j:=k to k1 do
                            for j1:=k to k1 do
                                if (ListBox1.Items[j1] < ListBox1.Items[j]) and (j1 > j) then
                                  begin
                                      ListBox1.Items.Insert(j, ListBox1.Items[J1]);
                                      ListBox1.Items.Delete(j1 + 1);
                                  end;
                    end;

                end;
          SortPLNo:=false;//ее нет
          AlfAZ:=true;
          AlfZA:=false;//Активные сортировки
      end;
    2:Begin//Z-A
          //Записать, то, что в плэйлисте(что взяли, то и вернули)(если адр сортировка, то сначала она, потом остальные, при включенных всех и выключении адресной, все сбрасывается, и при включенных всех и включении адресной все опять сбрасываются)
          If SaveToBack = False
          then begin
                  AssignFile(f,'C:\MusicPlayer3\Проект\TimeFile3.txt');
                     Rewrite(f);
                     If PutITrackActive then
                      Begin
                          For i:=0 to ListBox1.Count-1 do
                            begin
                              s:=ListBox1.Items[i];
                              If s[1]<>'-'
                              then s1:=s
                              else Writeln(f,s1+'\'+Copy(s,6,Length(s)-5))
                            end;
                      end
                     else Begin
                             For i:=0 to ListBox1.Count-1 do
                                 begin
                                    s:=ListBox1.Items[i];
                                    way:=ListBox3.Items[StrToInt(ListBox4.Items[i])];
                                    way:=Copy(way,1,Length(way)-(Length(way)-PosToBack(way,' ')+1));
                                    Writeln(f,way+'\'+s);
                                 end;
                        end;
                     closeFile(f);
                     SaveToBack:=True;
                end;
          If OnlyTrackActive then begin
          for i := 0 to (ListBox1.Items.Count - 1) do
              for x := 0 to (ListBox1.Items.Count - 1) do
                if (ListBox1.Items[x] > ListBox1.Items[i]) and (x > i) then
                begin
                    ListBox1.Items.Insert(i, ListBox1.Items[x]);
                    ListBox1.Items.Delete(x + 1);
                    ListBox4.Items.Insert(i, ListBox4.Items[x]);
                    ListBox4.Items.Delete(x + 1);
                end;
              end
          else begin
                  //просто в каждом пути отсортируй трэки
                  for i:=0 to ListBox3.Count-1 do
                    begin
                          //просто в каждом пути отсортируй трэки
                          way:=ListBox3.Items[i];
                          wayadr:=Copy(way,PosToBack(way,' ')+1,Length(way)-PosToBack(way,' '));
                          If i<>ListBox3.Count-1
                          then begin
                                    way:=ListBox3.Items[i+1];
                                    s1:=Copy(way,PosToBack(way,' ')+1,Length(way)-PosToBack(way,' '));//wayadr2
                                    k:=StrToInt(wayadr)+1;
                                    k1:=StrToInt(s1)-1;
                                end
                          else begin
                                  k:=StrToInt(wayadr)+1;
                                  k1:=ListBox1.Count-1;
                               end;
                          for j:=k to k1 do
                            for j1:=k to k1 do
                                if (ListBox1.Items[j1] > ListBox1.Items[j]) and (j1 > j) then
                                  begin
                                      ListBox1.Items.Insert(j, ListBox1.Items[J1]);
                                      ListBox1.Items.Delete(j1 + 1);
                                  end;
                    end;
                end;
          SortPLNo:=false;//ее нет
          AlfAZ:=false;
          AlfZA:=true;//Активные сортировки
      end;
    end;
end;

procedure TForm1.SortPlayListAZ1;
begin

end;

procedure TForm1.SortPlayListAZ2;
begin

end;

procedure TForm1.ListBox3DblClick(Sender: TObject);
var s,s1,way:string;i,j,AdrIndex,k:Integer;f:TextFile;fDel:boolean;
begin                                              //k - колличество элементов в лб1
   //найдем адрес пути
   //PutITrack - 2 варианта сврху, снизу, в середине, удалить ненужное, возвести SortAdr
   //OnlyTrack - находим ненужные трэки и удаляем их + синхронизация с листбокс3
   AssignFile(f,'C:\MusicPlayer3\Проект\TimeFile.txt');
   Rewrite(f);
   If PutITrackActive then
    Begin
        For i:=0 to ListBox1.Count-1 do
          begin
            s:=ListBox1.Items[i];
            If s[1]<>'-'
            then s1:=s
            else Writeln(f,s1+'\'+Copy(s,6,Length(s)-5))
          end;
        Write(f,'1')//Режим записи - '1' - PutITrack
    end
   else Begin
           For i:=0 to ListBox1.Count-1 do
               begin
                  s:=ListBox1.Items[i];
                  way:=ListBox3.Items[StrToInt(ListBox4.Items[i])];
                  way:=Copy(way,1,Length(way)-(Length(way)-PosToBack(way,' ')+1));
                  Writeln(f,way+'\'+s);
               end;
        Write(f,'2')//Режим записи - '2' - OnlyTrack
      end;
   closeFile(f);

  s:=ListBox3.Items[ListBox3.ItemIndex];
  i:=0;Way:=Copy(s,1,(Length(s)-(Length(s)-PosToBack(s,' ')))-1);fDel:=true;//выбранный путь для сортировки
  k:=ListBox1.Count-1;
  If PutITrackActive //Покажи Только трэки по выбранному пути с учетом выбранного режима
  then begin
            repeat
                  If ListBox1.Items[i][1]<>'-'
                  then begin
                          if ListBox1.Items[i]=way
                          then begin
                                  fDel:=False;
                                  Inc(i);
                               end
                          else begin
                                    fDel:=true;
                                    ListBox1.Items.Delete(i);
                                    Dec(k);
                               end

                       end
                  else begin
                            if fDel
                            then begin
                                      Dec(k);
                                      ListBox1.Items.Delete(i);
                                  end
                            else Inc(i);
                        end;

            until i=k+1;
       end
  else begin
          repeat
              if ListBox4.Items[i]=IntToStr(ListBox3.ItemIndex)
              then inc(i)
              else begin
                        Dec(k);
                        ListBox1.Items.Delete(i);
                        ListBox4.Items.Delete(i);
                   end;
          until i=k+1;
       end;
    AdrSort:=True;
    SortPLNo:=False;
    {общая проблема всех сортировок - Возвращение к исходному состоянию}
end;

procedure TForm1.BitBtn13Click(Sender: TObject);
var s:string;
begin
       ListBox1.Items.LoadFromFile('C:\MusicPlayer3\Проект\TimeFile.txt');  //Загрузка плэйлиста
       ListBox3.Clear;
       ListBox4.Clear;
       s:=ListBox1.Items[ListBox1.Count-1];
        case StrToInt(s) of
        1:begin
              ListBox1.Items.Delete(ListBox1.Count-1);
              SortWayTrackPlayList;
            end;

        2:begin
                ListBox1.Items.Delete(ListBox1.Count-1);
                SortWayTrackPlayList;
                Form1.ComboBox3Change(Sender);
          end;
        end;
       AdrSort:=false;
       SortPLNo:=true;
end;

procedure TForm1.BitBtn10Click(Sender: TObject);
begin
    //видимость плэйлиста
     TrackActive:=False;PlayListActive:=false;RadioActive:=false;equalizerActive:=False;
     ListBox1.Visible:=false; ListBox2.Visible:=false;ListBox3.Visible:=false;
     ListBox4.Visible:=false;
     BitBtn5.Visible:=false;
     BitBtn6.Visible:=false;
     BitBtn8.Visible:=false;
     BitBtn12.Visible:=false;
     BitBtn11.Visible:=false;
     BitBtn13.Visible:=false;
     BitBtn15.Visible:=false;
     BitBtn14.Visible:=false;
     Combobox3.Visible:=false;
     Combobox1.Visible:=false;
     Edit2.Visible:=false; Edit1.Visible:=false;
     label3.Visible:=false;Label1.Visible:=false;Label4.Visible:=False;
     StaticText1.Visible:=false;
     CheckBox1.Visible:=false;
     //видимость трэка
     pb1.Visible:=False;
     x.Visible:=False;
     y.Visible:=false;
     lbl1.Visible:=False;
     lbl2.Visible:=False;
     pnl1.visible:=False;
     pnl2.visible:=False;
    // pnl3.visible:=False;
     //equalizer
     trckbr1.Visible:=False;
     trckbr2.Visible:=False;btn1.Visible:=False;
     trckbr3.Visible:=False;
     trckbr4.Visible:=False;
     txt1.Visible:=False;
     txt2.Visible:=False;
     txt3.Visible:=False;
     txt4.Visible:=False;
     trckbr5.Visible:=false;
     trckbr6.Visible:=false;
     txt5.Visible:=false;
     txt6.Visible:=false;
end;

procedure TForm1.pnl1Click(Sender: TObject);
begin
   dlgColor1.Color := pnl1.Color;
   if not dlgColor1.Execute then Exit;
    pnl1.Color :=dlgColor1.Color;
    OcilloScope.BackColor := dlgColor1.Color;
    Spectrum.BackColor := dlgColor1.Color;
end;

procedure TForm1.pnl2Click(Sender: TObject);
begin
    dlgColor1.Color := pnl2.Color;
   if not dlgColor1.Execute then Exit;
    pnl2.Color :=dlgColor1.Color;
    OcilloScope.Pen := dlgColor1.Color;
    Spectrum.Pen := dlgColor1.Color;
end;

procedure TForm1.pnl3Click(Sender: TObject);
begin
  //    dlgColor1.Color := pnl3.Color;
   if not dlgColor1.Execute then Exit;
//    pnl3.Color :=dlgColor1.Color;
     Spectrum.Peak := dlgColor1.Color;
end;

procedure TForm1.ForStartEqualizer(stream: HSTREAM);
begin
    fx[1] := BASS_ChannelSetFX(stream, BASS_FX_DX8_PARAMEQ, 1);
    fx[2] := BASS_ChannelSetFX(stream, BASS_FX_DX8_PARAMEQ, 1);
    fx[3] := BASS_ChannelSetFX(stream, BASS_FX_DX8_PARAMEQ, 1);
    fx[4] := BASS_ChannelSetFX(stream, BASS_FX_DX8_PARAMEQ, 1);
    FX[5] := BASS_ChannelSetFX(stream, BASS_FX_DX8_PARAMEQ, 1);
    FX[6] := BASS_ChannelSetFX(stream, BASS_FX_DX8_PARAMEQ, 1);
    fx[7] := BASS_ChannelSetFX(stream, BASS_FX_DX8_REVERB, 1);
    //настройка параметров стандарт
    p.fGain := 0;
    p.fBandwidth := 36;
    p.fCenter := 125;
    BASS_FXSetParameters(fx[1], @p);

    BASS_FXSetParameters(fx[8], @p);

    p.fCenter := 5000;
    BASS_FXSetParameters(fx[2], @p);

    p.fCenter := 1000;
    BASS_FXSetParameters(fx[3], @p);

    p.fCenter := 4000;
    BASS_FXSetParameters(fx[4], @p);

    p.fCenter := 8000;
    BASS_FXSetParameters(fx[5], @p);

    p.fCenter := 16000;
    BASS_FXSetParameters(fx[6], @p);

    BASS_FXGetParameters(fx[7], @pR);

    pR.fReverbMix := -96;
    pR.fReverbTime := 1200;
    pR.fHighFreqRTRatio := 0.1;
    BASS_FXSetParameters(fx[7], @pR);

    // play both MOD and stream, it must be one of them! :)
    BASS_ChannelPlay(stream, False)
end;

procedure TForm1.trckbr1Change(Sender: TObject);{123}
begin
    BASS_FXGetParameters(fx[1], @p);
    p.fgain := 15-trckbr1.position;
    BASS_FXSetParameters(fx[1], @p);
end;

procedure TForm1.trckbr2Change(Sender: TObject);{1000}
begin
    BASS_FXGetParameters(fx[3], @p);
    p.fgain := 15-trckbr2.position;
    BASS_FXSetParameters(fx[3], @p);
end;

procedure TForm1.trckbr3Change(Sender: TObject);{8000}
begin
    BASS_FXGetParameters(fx[5], @p);
    p.fgain := 15-trckbr3.position;
    BASS_FXSetParameters(fx[5], @p);
end;

procedure TForm1.trckbr4Change(Sender: TObject);
var v: integer;
begin
    v:=trckbr4.position;
    BASS_FXGetParameters(fx[7], @pR);
    pR.fReverbMix := -0.012*v*v*v; // получает -96, при 20
    BASS_FXSetParameters(fx[7], @pR);
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  trckbr1.Position:=15;
  trckbr2.Position:=15;
  trckbr3.Position:=15;
  trckbr4.Position:=20;
  trckbr7.Position:=15;
  trckbr8.Position:=15;
  trckbr9.Position:=15;
  trckbr5.Position:=0;
  trckbr6.Position:=1;
end;

procedure TForm1.trckbr5Change(Sender: TObject);{freq}
begin
    BASS_ChannelSetAttribute(stream,BASS_ATTRIB_FREQ,0+trckbr5.Position*1000);
end;

procedure TForm1.trckbr6Change(Sender: TObject); {balance}
begin
    BASS_ChannelSetAttribute(stream,BASS_ATTRIB_PAN,trckbr6.Position -1);
end;

procedure TForm1.trckbr7Change(Sender: TObject);
begin
    BASS_FXGetParameters(fx[2], @p);
    p.fgain := 15-trckbr1.position;
    BASS_FXSetParameters(fx[2], @p);
end;

procedure TForm1.trckbr8Change(Sender: TObject);
begin
BASS_FXGetParameters(fx[4], @p);
    p.fgain := 15-trckbr1.position;
    BASS_FXSetParameters(fx[4], @p);
end;

procedure TForm1.trckbr9Change(Sender: TObject);
begin
    BASS_FXGetParameters(fx[6], @p);
    p.fgain := 15-trckbr1.position;
    BASS_FXSetParameters(fx[6], @p);
end;

procedure TForm1.trckbr10Change(Sender: TObject);
begin
    BASS_FXGetParameters(fx[6], @p);
    p.fgain := 15-trckbr1.position;
    BASS_FXSetParameters(fx[6], @p);
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
    If ListBox1.ItemIndex<>ListBox1.Count-1
    then ListBox1.ItemIndex:=ListBox1.ItemIndex+1
    else ListBox1.ItemIndex:=0;
    ListToPlay(ListBox1.ItemIndex);
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
    If ListBox1.ItemIndex<>0
    then ListBox1.ItemIndex:=ListBox1.ItemIndex-1
    else ListBox1.ItemIndex:=ListBox1.Count-1;
    ListToPlay(ListBox1.ItemIndex);
end;

procedure TForm1.N4Click(Sender: TObject);
begin
   Form1.BitBtn5Click(sender);
end;

end.

