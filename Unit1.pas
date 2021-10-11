unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, ComCtrls, ExtCtrls,ShellAPI;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Button1: TButton;
    Panel1: TPanel;
    UpDown1: TUpDown;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    UpDown2: TUpDown;
    Label3: TLabel;
    Edit3: TEdit;
    UpDown3: TUpDown;
    Button2: TButton;
    Memo1: TMemo;
    Bevel1: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Chane(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure Edit3Change(Sender: TObject);
    procedure UpDown3Click(Sender: TObject; Button: TUDBtnType);
    procedure Button2Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure WMNCHitTest(var M: TWMNCHitTest); message wm_NCHitTest;
  end;
type
  MyPoint = record
  X:integer;
  Y:integer;
  lastColor:COLORREF;
  speed:byte;//скорость
  crazy:integer;//степень сумасшедшести снежинки :)  integer для того чтобы она могла быть отрицательной
end;

var
  Form1: TForm1;
  screenW,screenH:integer;//высота и ширина экрана
  points : array of MyPoint;
  desktop:hDC;
  wind:integer; //ветер
  show_color:COLORREF;
implementation

{$R *.dfm}

procedure ShowGradient2(prmDC:hDC;prmRed,prmGreen,prmBlue:byte;ClientWidth,ClientHeight:integer);
var
Row:Word ;
wrkPenNew:hPen;

//[23:53 24.10.2005]
wrkDelta:integer;

begin

wrkDelta:=100 div (1+ClientHeight);
if wrkDelta=0 then wrkDelta:=1;

for Row := 0 to 1+(ClientHeight) do begin
wrkPenNew:=CreatePen(PS_SOLID,1,RGB(prmRed, prmGreen, prmBlue));
SelectObject(prmDC,wrkPenNew);

MoveToEx(prmDC,0,Row,nil);
LineTo(prmDC,ClientWidth,Row);


DeleteObject(wrkPenNew);

if prmRed > wrkDelta then Dec(prmRed,wrkDelta);
if prmGreen > wrkDelta then Dec(prmGreen,wrkDelta);
if prmBlue  > wrkDelta then Dec(prmBlue,wrkDelta);

end;
end;

function IsContrast(Color1,Color2:COLORREF):boolean;
var
  r1,g1,b1:byte;
  r2,g2,b2:byte;
begin
result:=false;
r1:=GetRValue(Color1);
g1:=GetGValue(Color1);
b1:=GetBValue(Color1);
r2:=GetRValue(Color2);
g2:=GetGValue(Color2);
b2:=GetBValue(Color2);

if ((r1-r2)+(g1-g2)+(b1-b2))>100 then result:=true;

end;

procedure paintSnow(h:hDC);
var
  i:integer;
  x,y:integer;
  color_1,color_2:COLORREF;//два цвета для сравнения

  down_snow:byte;
begin

case 2-random(2) of
1:inc(wind);
2:dec(wind);
end;
if wind>5 then dec(wind);
if wind<-5 then inc(wind);

for i:=0 to high(points) do begin
//узнаем координаты движения снежинки
x:=points[i].X+points[i].crazy+wind;
y:=points[i].Y+1+points[i].speed;

if (y > screenH) then y:=1;//если долетела до низа экрана то отображаем сверху
if (x > screenW) then x:=1;
if (x < 0) then x:=screenW;
//if points[i].lastColor=show_color then y:=random(screenH);// избавляемся от шлейфов

color_1:=GetPixel(h,x,y);//цвет будущей точки
color_2:=GetPixel(h,x,y+1);

if (IsContrast(color_1,color_2)) and (color_1<>show_color) //если контраст большой то снежинка упала
then begin

down_snow:=random(1);
points[i].Y:=points[i].Y+down_snow;
points[i].X:=points[i].X;
case (random(2)) of
  1: begin // .
     SetPixelV(h,points[i].X,points[i].Y,show_color);
     end;
  2: begin // ..
     SetPixelV(h,points[i].X-1,points[i].Y,show_color);
     SetPixelV(h,points[i].X,points[i].Y,show_color);
     end;
  0: begin // .'.
     points[i].Y:=points[i].Y-random(3);
     SetPixelV(h,points[i].X+1,points[i].Y+1,show_color);
     SetPixelV(h,points[i].X,points[i].Y,show_color);
     SetPixelV(h,points[i].X-1,points[i].Y+1,show_color);
     end;

end;
y:=random(screenH div 4);

end else begin //снежинка продолжает лететь
if GetPixel(h,points[i].X,points[i].Y)=show_color then
SetPixelV(h,points[i].X,points[i].Y,points[i].lastColor);//восстанавливаем цвет предыдущей точки, ранее затертой
points[i].lastColor:=GetPixel(h,x,y);//запоминаем цвет точки который скоро затерем
SetPixelV(h,x,y,show_color);
end;
points[i].X:=x;
points[i].Y:=y;
points[i].crazy:=-points[i].crazy;//добиваюсь того чтобы снежинка летела влево-вправо
end;

end;


procedure TForm1.Timer1Timer(Sender: TObject);
begin
paintSnow(desktop);
end;

procedure init;
var
  i:integer;
begin
for i:=0 to high(points) do begin
  points[i].X:=screenW-random(screenW);
  points[i].Y:=screenH-random(screenH);
  points[i].speed:=3-random(2);
  points[i].crazy:=1-random(1);
  points[i].lastColor:=GetPixel(desktop,points[i].X+1,points[i].Y);
end;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
show_color:=rgb(234,234,255);
wind:=1;
form1.WindowState:=wsMinimized;
desktop:=CreateDC('DISPLAY',nil,nil,nil);
screenW:=GetSystemMetrics (SM_CXSCREEN);
screenH:=GetSystemMetrics (SM_CYSCREEN);
randomize;
setlength(points,801);
init;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DeleteDC(desktop);
invalidaterect(WindowFromDC(desktop),nil,true);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
timer1.Enabled:=false;
close;
end;

procedure TForm1.FormPaint(Sender: TObject);
const
  str='С Новым 2007 годом!!!';
var
  dc:Hdc;
  r:Trect;
  size_:tsize;
  ttt:ttextmetric;
  f:hfont;
  f_:tlogfont;

//rtemp:hrgn;
begin
dc:=form1.Canvas.Handle;
ShowGradient2(dc,255,200,200,form1.Width,form1.Height);

windows.GetClientRect(form1.handle,r);

f:=selectobject(dc,GetStockObject(DEFAULT_GUI_FONT));
GetObject(f,sizeof(f_),@f_);
f_.lfFaceName:='Tahoma';
f_.lfHeight:=40;
f:=CreateFontIndirect(f_); //обязательно через переменную чтобы можно было потом закрыть объект-шрифт
SelectObject(DC,f);

GetTextExtentPoint32(dc, PChar(str),length(str), size_);
GetTextMetrics(dc,ttt);
setbkmode(dc,transparent);

settextcolor(dc,rgb(255,200,200));
r.Top:=ttt.tmHeight+4;
r.Left:=4;
DrawText(DC,str,Length(string(str)),r,DT_CENTER	);

settextcolor(dc,rgb(255,0,0));
r.Top:=ttt.tmHeight;
r.Left:=0;
DrawText(DC,str,Length(string(str)),r,DT_CENTER	);

deleteobject(f);
releaseDC(form1.Handle,dc);

{
windows.GetClientRect(handle,r);
rTemp := CreateRoundRectRgn(0,0,r.Right,r.Bottom,r.Bottom div 20,r.Right);
SetWindowRgn(handle, rTemp, True);
}
end;



procedure TForm1.FormResize(Sender: TObject);

begin
form1.Paint;

end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if (key>char('9')) or (key<char('0')) then key:=#0;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
if edit1.Text='' then edit1.Text:='0';
UpDown1.Update;
end;

procedure TForm1.Edit2Chane(Sender: TObject);
begin
if edit2.Text='' then edit2.Text:='0';
UpDown2.Update;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
Edit1.Text:=inttostr(high(points));
Edit2.Text:=inttostr(timer1.Interval);
Edit3.Text:=inttostr(wind);
end;

procedure TForm1.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
timer1.Enabled:=false;
setlength(points,StrToInt(edit1.Text));
init;
invalidaterect(WindowFromDC(desktop),nil,true);
timer1.Enabled:=true;
end;

procedure TForm1.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin
timer1.Interval:=strtoint(edit2.Text);
end;

procedure TForm1.Edit3Change(Sender: TObject);
begin
if edit3.Text='' then edit3.Text:='0';
UpDown3.Update;
end;

procedure TForm1.UpDown3Click(Sender: TObject; Button: TUDBtnType);
begin
wind:=strtoint(edit3.Text);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
//form1.WindowState:=wsMinimized;
application.Minimize;
end;

procedure TForm1.Label4Click(Sender: TObject);
begin
shellexecute(handle,'open','http://kladovka.net.ru',nil,nil,1);
end;

procedure TForm1.Label5Click(Sender: TObject);
begin
shellexecute(handle,'open','http://winconsul.kladovka.net.ru',nil,nil,1);
end;

procedure TForm1.Label7Click(Sender: TObject);
begin
shellexecute(handle,'open','http://jdmc.kladovka.net.ru',nil,nil,1);
end;

procedure TForm1.Label6Click(Sender: TObject);
begin
shellexecute(handle,'open','http://delphimaster.ru',nil,nil,1);
end;

procedure TForm1.WMNCHitTest(var M: TWMNCHitTest);
begin
inherited;                   { вызвали наследованный дескриптор сообщения, }
if M.Result = htClient then  { кликнув в области окна?                     }
M.Result := htCaption;     { если так, то мы заставили Windows думать,   }
{ что щелчок был на заголовке окна.           }

end;

end.
