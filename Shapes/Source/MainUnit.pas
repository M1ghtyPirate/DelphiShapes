unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPlotterClass, StdCtrls, ExtCtrls, Math;

function SetIntValue(AValue: String): Integer;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    cmbBackColor: TComboBox;
    lbColorFig: TLabel;
    edXFig: TEdit;
    edYFig: TEdit;
    edSize: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbAColor: TLabel;
    lbBColor: TLabel;
    RadioGroup1: TRadioGroup;
    cmbColor: TComboBox;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbBackColorSelect(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edXFigExit(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure cmbColorSelect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  APlotter: TPlotter;
  FChangeFig: Boolean;

implementation


{$R *.dfm}

function SetIntValue(AValue: String): Integer;
begin
  try
    Result:=StrToInt(AValue);
  except
    Result:=0;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  APlotter:=TPlotter.Create(Image1.Canvas, Rect(0,0, Image1.Width, Image1.Height));

  ComboBox1.Clear;
  Button3.Enabled:=False;
  edXFig.Clear;
  edYFig.Clear;
  edSize.Clear;
  FChangeFig:=False;
  lbBColor.Color:=clWhite;
  lbAColor.Color:=clBlack;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  APlotter.Free;
end;

procedure TForm1.cmbBackColorSelect(Sender: TObject); //Выбор цвета фона
var
  AColor: TColor;
begin
  case cmbBackColor.ItemIndex of
  0: AColor:=clBlack;
  1: AColor:=clGray;
  2: AColor:=clRed;
  3: AColor:=clYellow;
  4: AColor:=clGreen;
  5: AColor:=clAqua;
  6: AColor:=clBlue;
  7: AColor:=clWhite;
  end;
  APlotter.BackColor:=AColor;
  lbBColor.Color:=AColor;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  X, Y, W, II: Integer;
  AColor: TColor;
  AFigure: TFigureType;
  S: String;

begin
  //Добавить новую фигуру
    X:=SetIntValue(edXFig.Text);
    Y:=SetIntValue(edYFig.Text);
    W:=SetIntValue(edSize.Text);
    //Определяем цвет новой фигуры
    case cmbColor.ItemIndex of
    0: AColor:=clBlack;
    1: AColor:=clGray;
    2: AColor:=clRed;
    3: AColor:=clYellow;
    4: AColor:=clGreen;
    5: AColor:=clAqua;
    6: AColor:=clBlue;
    end;
    case RadioGroup1.ItemIndex of
    0: begin
        AFigure:=ftSquare;
        S:='Квадрат';
       end;
    1: begin
        AFigure:=ftCircle;
        S:='Круг';
       end;
    2: begin
        AFigure:=ftTriangle;
        S:='Треугольник';
       end;
    3: begin
        AFigure:=ftSqSq;
        S:='Квадрат в квадрате';
       end;
    4: begin
        AFigure:=ftCiSq;
        S:='Круг в квадрате';
       end;
    5: begin
        AFigure:=ftSqCi;
        S:='Квадрат в круге';
       end;
    6: begin
        AFigure:=ftCiCi;
        S:='Круг в круге';
       end;
    7: begin
        AFigure:=ftTrCi;
        S:='Треугольник в круге';
       end;
    8: begin
        AFigure:=ftTrTr;
        S:='Тр. в треугольнике';
       end;
    end;

    if not(FChangeFig) then
    begin
      APlotter.Add(AFigure, AColor, W, X, Y);

      ComboBox1.Items.Add(IntToStr(APlotter.Count)+' '+S);
      ComboBox1.ItemIndex:=ComboBox1.Items.Count-1;
      ComboBox1Change(Sender);
    end
    else
    begin
      II:=ComboBox1.ItemIndex;
      ComboBox1.Items.Insert(II, IntToStr(II+1)+' '+S);
      ComboBox1.Items.Delete(II+1);
      ComboBox1.ItemIndex:=II;
      APlotter.ChangeFig(ComboBox1.ItemIndex, AFigure, AColor, W, X, Y);
      FChangeFig:=False;
    end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var
  I: Integer;
  S: String;
begin
  if ComboBox1.ItemIndex>=0 then
  begin
    lbAColor.Color:=APlotter.Items[ComboBox1.ItemIndex].Color;

    case APlotter.Items[ComboBox1.ItemIndex].Color of
    clBlack: cmbColor.ItemIndex:=0;
    clGray: cmbColor.ItemIndex:=1;
    clRed: cmbColor.ItemIndex:=2;
    clYellow: cmbColor.ItemIndex:=3;
    clGreen: cmbColor.ItemIndex:=4;
    clAqua: cmbColor.ItemIndex:=5;
    clBlue: cmbColor.ItemIndex:=6;
    end;
    S:=ComboBox1.Text;
    for I:=1 to Length(S) do
    begin
      if S[I]=' ' then
      begin
        S:=Copy(S, I+1, Length(S)-I);
        break;
      end;
    end;
    for I:=0 to RadioGroup1.Items.Count-1 do
    begin
      if S=RadioGroup1.Items.Strings[I] then
      begin
        RadioGroup1.ItemIndex:=I;
        break;
      end;
    end;
    
    edXFig.Text:=IntToStr(APlotter.Items[ComboBox1.ItemIndex].X+Round(APlotter.Items[ComboBox1.ItemIndex].Size/2));
    edYFig.Text:=IntToStr(APlotter.Items[ComboBox1.ItemIndex].Y+Round(APlotter.Items[ComboBox1.ItemIndex].Size/2));
    edSize.Text:=IntToStr(APlotter.Items[ComboBox1.ItemIndex].Size);
    Button3.Enabled:=True; //Активировать кнопку Новая фигура
  end
  else
  begin
    //lbAColor.Color:=lbColorFig.Color;
    edXFig.Clear;
    edYFig.Clear;
    edSize.Clear;
    ComboBox1.Clear;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  I:Integer;
begin
  try
    I:=ComboBox1.ItemIndex;
    APlotter.Delete(I);
    ComboBox1.Items.Delete(I);
    ComboBox1.ItemIndex:=Min(I, ComboBox1.Items.Count-1);
    if ComboBox1.ItemIndex=-1 then Button3.Enabled:=False;
    ComboBox1Change(Sender);
  except
  end;
end;

procedure TForm1.edXFigExit(Sender: TObject); //Смена параметров фигуры
var
  I:Integer;
  AColor:TColor;
begin
  if ComboBox1.ItemIndex>=0 then
  begin
    I:=ComboBox1.ItemIndex;
    APlotter.Items[ComboBox1.ItemIndex].X:=SetIntValue(edXFig.Text)-Round(SetIntValue(edSize.Text)/2);
    edXFig.Text:=IntToStr(SetIntValue(edXFig.Text));
    APlotter.Items[ComboBox1.ItemIndex].Y:=SetIntValue(edYFig.Text)-Round(SetIntValue(edSize.Text)/2);
    edYFig.Text:=IntToStr(SetIntValue(edYFig.Text));
    APlotter.Items[ComboBox1.ItemIndex].Size:=SetIntValue(edSize.Text);
    edSize.Text:=IntToStr(SetIntValue(edSize.Text));
    cmbBackColorSelect(Sender);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject); //Новая фигура
begin
  ComboBox1.ItemIndex:=-1;
  ComboBox1.Text:='';
  Button3.Enabled:=False;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject); //Смена типа фигуры
var
  I: Integer;
  S: String;
begin
  if ComboBox1.ItemIndex>=0 then
  begin
    S:=ComboBox1.Text;
    for I:=1 to Length(S) do
    begin
      if S[I]=' ' then
      begin
        S:=Copy(S, I+1, Length(S)-I);
        break;
      end;
    end;
    if not(S=RadioGroup1.Items.Strings[RadioGroup1.ItemIndex]) then
    begin
      FChangeFig:=True;
      Button1Click(Sender);
    end;
  end;
end;

procedure TForm1.cmbColorSelect(Sender: TObject);
var
  AColor: TColor;
begin
  case cmbColor.ItemIndex of
  0: AColor:=clBlack;
  1: AColor:=clGray;
  2: AColor:=clRed;
  3: AColor:=clYellow;
  4: AColor:=clGreen;
  5: AColor:=clAqua;
  6: AColor:=clBlue;
  end;
  lbAColor.Color:=AColor;
  if ComboBox1.ItemIndex>=0 then
  begin
    APlotter.Items[ComboBox1.ItemIndex].Color:=AColor;
    cmbBackColorSelect(Sender);
  end;
end;

end.
