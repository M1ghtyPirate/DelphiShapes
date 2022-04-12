unit uImageClass;

interface

uses
  Types, Graphics, Classes, Math;

type
  TFigure=class
  private
    FColor: TColor;
    FSize: Integer;
    FPosition: array[0..1] of Integer;
    procedure SetFigureColor(AColor: TColor); virtual;  //Виртуальные методы будут переопределены дочерними классами
  public
    constructor Create; //Конструктор класса

    //Методы класса
    procedure Erase; virtual; abstract;
    procedure Draw; virtual; abstract;

    property Color: TColor read FColor write SetFigureColor;
    property Size: Integer read FSize write FSize;
    property X: Integer index 0 read FPosition[0] write FPosition[0];
    property Y: Integer index 1 read FPosition[1] write FPosition[1];
  end;

  //Класс квадрат
  TSquare=class(TFigure)
  private
    ACanvas: TCanvas;
    procedure SetFigureColor(AColor: TColor); override;
  public
    constructor Create (Owner: TCanvas; ASize: TRect);
    //Методы переопределены по отношению к родительскому
    procedure Erase; override;// virtual;
    procedure Draw; override;// virtual;
  end;

  //Класс круг
  TCircle=class(TFigure)
  private
    ACanvas: TCanvas;
    procedure SetFigureColor(AColor: TColor); override;
  public
    constructor Create (Owner: TCanvas; Asize: TRect);
    //Методы переопределены по отношению к родительскому
    procedure Erase; override;
    procedure Draw; override;
  end;

  //Класс треугольник
  TTriangle=class(TFigure)
  private
    ACanvas: TCanvas;
    procedure SetFigureColor(AColor: TColor); override;
  public
    constructor Create (Owner: TCanvas; Asize: TRect);
    procedure Erase; override;
    procedure Draw; override;
  end;

  //Класс квадрат в квадрате
  TSqSq=class(TSquare)
  public
    //Методы переопределены по отношению к родительскому
    procedure Draw; override;
  end;

  //Класс круг в квадрате
  TCiSq=class(TSquare)
  public
    //Методы переопределены по отношению к родительскому
    procedure Draw; override;
  end;

  //Класс квадрат в круге
  TSqCi=class(TCircle)
  public
    //Методы переопределены по отношению к родительскому
    procedure Draw; override;
  end;

  //Класс круг в круге
  TCiCi=class(TCircle)
  public
    //Методы переопределены по отношению к родительскому
    procedure Draw; override;
  end;

  //Класс треугольник в круге
  TTrCi=class(TCircle)
  public
    //Методы переопределены по отношению к родительскому
    procedure Draw; override;
  end;

  //Класс треугольник в треугольнике
  TTrTr=class(TTriangle)
  public
    //Методы переопределены по отношению к родительскому
    procedure Draw; override;
  end;

implementation

{ TFigure }

constructor TFigure.Create;
begin
  inherited Create;
  //Инициализация значениями по умолчанию
  X:=Low(Integer);
  Y:=Low(Integer);
  FSize:=0;
end;

procedure TFigure.SetFigureColor(AColor: TColor);
begin
  FColor:=AColor;
end;

{ TSquare }

constructor TSquare.Create(Owner: TCanvas; ASize: TRect);
begin
  inherited Create; //Создать родительский класс
  try
    ACanvas:=Owner;
    Color:=ACanvas.Pen.Color;
  finally
  end;
end;

procedure TSquare.Draw;
var
  AColor: TColor;
  ARect: TRect;
begin
  inherited;
  if ACanvas<>nil then
  begin
    Erase;
    AColor:=ACanvas.Brush.Color;
    ACanvas.Brush.Color:=Color;
    //Определение текущей позиции рисуемой фигуры
    ARect.Left:=X;
    ARect.Top:=Y;
    ARect.Right:=ARect.Left+Size;
    ARect.Bottom:=ARect.Top+Size;
    ACanvas.FillRect(ARect);
    ACanvas.Refresh;
    ACanvas.Brush.Color:=AColor;
  end;
end;

procedure TSquare.Erase;
var
  AColor: TColor;
  ARect: TRect;
begin
  inherited;
  AColor:=Color;
  if ACanvas<>nil then
  begin
    try
      ARect.Left:=X;
      ARect.Top:=Y;
      ARect.Right:=ARect.Left+Size;
      ARect.Bottom:=ARect.Top+Size;
      ACanvas.FillRect(ARect);
      ACanvas.Refresh;
    finally
      ACanvas.Pen.Color:=AColor;
    end;
  end;
end;

procedure TSquare.SetFigureColor(AColor: TColor);
begin
  inherited;
  ACanvas.Pen.Color:=AColor;
end;

{ TCircle }

constructor TCircle.Create(Owner: TCanvas; ASize:TRect);
begin
  inherited Create; //Создать родительский класс
  try
    ACanvas:=Owner;
    Color:=ACanvas.Pen.Color;
  finally
  end;
end;

procedure TCircle.Draw;
var
  AColor: TColor;
  ARect: TRect;
begin
  inherited;
  if ACanvas<>nil then
  begin
    Erase;
    AColor:=ACanvas.Brush.Color;
    ACanvas.Brush.Color:=Color;
    //Определение текущей позиции рисуемой фигуры
    ARect.Left:=X;
    ARect.Top:=Y;
    ARect.Right:=ARect.Left+Size;
    ARect.Bottom:=ARect.Top+Size;
    ACanvas.Ellipse(ARect);
    ACanvas.Refresh;
    ACanvas.Brush.Color:=AColor;
  end;
end;

procedure TCircle.Erase;
var
  AColor: TColor;
  ARect: TRect;
begin
  inherited;
  AColor:=Color;
  if ACanvas<>nil then
  begin
    try
      ARect.Left:=X;
      ARect.Top:=Y;
      ARect.Right:=ARect.Left+Size;
      ARect.Bottom:=ARect.Top+Size;
      ACanvas.FillRect(ARect);
      ACanvas.Refresh;
    finally
      ACanvas.Pen.Color:=AColor;
    end;
  end;
end;

procedure TCircle.SetFigureColor(AColor: TColor);
begin
  inherited;
  ACanvas.Pen.Color:=AColor;
end;

{ TTriangle }

constructor TTriangle.Create(Owner: TCanvas; ASize:TRect);
begin
  inherited Create; //Создать родительский класс
  try
    ACanvas:=Owner;
    Color:=ACanvas.Pen.Color;
  finally
  end;
end;

procedure TTriangle.Draw;
var
  AColor: TColor;
  Points: array of TPoint;
begin
  inherited;
  if ACanvas<>nil then
  begin
    Erase;
    SetLength(Points, 3);
    Points[0]:=Point(X+Round(Size/2), Y+Round(Size/2)-Round(Round(Size/2)/(Cos(PI/6))));
    Points[1]:=Point(X+Size, Y+Round(Size/2)+Round(Round(Size/2)*(Tan(PI/6))));
    Points[2]:=Point(X, Y+Round(Size/2)+Round(Round(Size/2)*(Tan(PI/6))));
    AColor:=ACanvas.Brush.Color;
    ACanvas.Brush.Color:=Color;
    ACanvas.Polygon(Points);
    ACanvas.Refresh;
    ACanvas.Brush.Color:=AColor;
  end;
end;

procedure TTriangle.Erase;
var
  AColor: TColor;
  ARect: TRect;
begin
  inherited;
  AColor:=Color;
  if ACanvas<>nil then
  begin
    try
      ARect.Left:=X;
      ARect.Top:=Y+Round(Size/2)-Round(Round(Size/2)/(Cos(PI/6)));
      ARect.Right:=ARect.Left+Size;
      ARect.Bottom:=Y+Round(Size/2)+Round(Round(Size/2)*(Tan(PI/6)));
      ACanvas.FillRect(ARect);
      ACanvas.Refresh;
    finally
      ACanvas.Pen.Color:=AColor;
    end;
  end;
end;

procedure TTriangle.SetFigureColor(AColor: TColor);
begin
  inherited;
  ACanvas.Pen.Color:=AColor;
end;

{TSqSq}

procedure TSqSq.Draw;
var
  ARect: TRect;
begin
  inherited;
  //Определение текущей позиции рисуемой фигуры
  ARect.Left:=X+Round(Size/4);
  ARect.Top:=Y+Round(Size/4);
  ARect.Right:=ARect.Left+Round(Size/2);
  ARect.Bottom:=ARect.Top+Round(Size/2);
  ACanvas.FillRect(ARect);
  ACanvas.Refresh;
end;

{TCiSq}

procedure TCiSq.Draw;
var
  ARect: TRect;
begin
  inherited;
  //Определение текущей позиции рисуемой фигуры
  ARect.Left:=X+Round(Size/4);
  ARect.Top:=Y+Round(Size/4);
  ARect.Right:=ARect.Left+Round(Size/2);
  ARect.Bottom:=ARect.Top+Round(Size/2);
  ACanvas.Ellipse(ARect);
  ACanvas.Refresh;
end;

{TSqCi}

procedure TSqCi.Draw;
var
  ARect: TRect;
begin
  inherited;
  //Определение текущей позиции рисуемой фигуры
  ARect.Left:=X+Round(Size/4);
  ARect.Top:=Y+Round(Size/4);
  ARect.Right:=ARect.Left+Round(Size/2);
  ARect.Bottom:=ARect.Top+Round(Size/2);
  ACanvas.FillRect(ARect);
  ACanvas.Refresh;
end;

{TCiCi}

procedure TCiCi.Draw;
var
  ARect: TRect;
begin
  inherited;
  //Определение текущей позиции рисуемой фигуры
  ARect.Left:=X+Round(Size/4);
  ARect.Top:=Y+Round(Size/4);
  ARect.Right:=ARect.Left+Round(Size/2);
  ARect.Bottom:=ARect.Top+Round(Size/2);
  ACanvas.Ellipse(ARect);
  ACanvas.Refresh;
end;

{TTrCi}

procedure TTrCi.Draw;
var
  Points: array of TPoint;
begin
  inherited;
  //Определение текущей позиции рисуемой фигуры
  SetLength(Points, 3);
  Points[0]:=Point(X+Round(Size/2), Y+Round(Size/2)-Round(Round(Size/4)/(Cos(PI/6))));
  Points[1]:=Point(X+Round(Size*3/4), Y+Round(Size/2)+Round(Round(Size/4)*(Tan(PI/6))));
  Points[2]:=Point(X+Round(Size/4), Y+Round(Size/2)+Round(Round(Size/4)*(Tan(PI/6))));
  ACanvas.Polygon(Points);
  ACanvas.Refresh;
end;

{TTrCi}

procedure TTrTr.Draw;
var
  Points: array of TPoint;
begin
  inherited;
  //Определение текущей позиции рисуемой фигуры
  SetLength(Points, 3);
  Points[0]:=Point(X+Round(Size/2), Y+Round(Size/2)-Round(Round(Size/4)/(Cos(PI/6))));
  Points[1]:=Point(X+Round(Size*3/4), Y+Round(Size/2)+Round(Round(Size/4)*(Tan(PI/6))));
  Points[2]:=Point(X+Round(Size/4), Y+Round(Size/2)+Round(Round(Size/4)*(Tan(PI/6))));
  ACanvas.Polygon(Points);
  ACanvas.Refresh;
end;

end.
