unit uPlotterClass;

interface

uses
  Types, Graphics, uImageClass;

type
  TFigureType=(ftSquare, ftCircle, ftTriangle, ftSqSq, ftCiSq, ftSqCi, ftCiCi, ftTrCi, ftTrTr);

  //Объявление класса Plotter
  TPlotter=class
  private
    ACanvas: TCanvas;
    FCount: Integer;  //Число созданных фигур
    FBackColor: TColor;
    FItems: array of TFigure; //Динамический массив созданных фигур

    procedure SetBackColor(AColor: TColor); virtual;
    function GetItem(Index: Integer): TFigure;  //Метод доступа к фигуре и чтения ее параметров
    procedure SetItem(Index: Integer; AItem: TFigure);  //Метод доступа к фигуре для записи/изменения ее параметров

    destructor Destroy; override;
  public
    constructor Create(Owner: TCanvas; ASize: TRect);

    procedure Add(AFigure: TFigureType; AColor: TColor; ASize, X, Y: Integer);  //Метод добавления новой фигуры
    procedure Delete(Index: Integer); //Метод удаления фигуры по ее индексу
    procedure ChangeFig(Index: Integer; AFigure: TFigureType; AColor: TColor; ASize, X, Y: Integer);
    procedure Free; //Метод удаления объекта

    property BackColor: TColor read FBackColor write SetBackColor;
    property Count: Integer read FCount; //свойство только для чтения
    property Items[Index: Integer]: TFigure read GetItem write SetItem;
  end;

implementation

{TPlotter}
procedure TPlotter.Add(AFigure:TFigureType; AColor: TColor; ASize, X, Y: Integer);
begin //Добавление новой фигуры
  try
    FCount:=FCount+1; //Увеличение счетчика числа фигур
    SetLength(FItems, FCount);  //Увеличение размера массива
    //Создание фигуры
    //Анализ типа фигуры
    case AFigure of
      ftSquare: FItems[FCount-1]:=TSquare.Create(ACanvas, ACanvas.ClipRect);
      ftCircle: FItems[FCount-1]:=TCircle.Create(ACanvas, ACanvas.ClipRect);
      ftTriangle: FItems[FCount-1]:=TTriangle.Create(ACanvas, ACanvas.ClipRect);
      ftSqSq: FItems[FCount-1]:=TSqSq.Create(ACanvas, ACanvas.ClipRect);
      ftCiSq: FItems[FCount-1]:=TCiSq.Create(ACanvas, ACanvas.ClipRect);
      ftSqCi: FItems[FCount-1]:=TSqCi.Create(ACanvas, ACanvas.ClipRect);
      ftCiCi: FItems[FCount-1]:=TCiCi.Create(ACanvas, ACanvas.ClipRect);
      ftTrCi: FItems[FCount-1]:=TTrCi.Create(ACanvas, ACanvas.ClipRect);
      ftTrTr: FItems[FCount-1]:=TTrTr.Create(ACanvas, ACanvas.ClipRect);
    end;
    FItems[FCount-1].Color:=AColor;
    FItems[FCount-1].Size:=ASize;
    FItems[FCount-1].X:=X-Round(ASize/2);
    FItems[FCount-1].Y:=Y-Round(ASize/2);
    FItems[FCount-1].Draw;
  except
    FCount:=FCount-1; //Возвращаем значение счетчика фигур
  end;
end;

procedure TPlotter.ChangeFig(Index: Integer; AFigure:TFigureType; AColor: TColor; ASize, X, Y: Integer);
begin //Изменение типа фигуры
  try
    //Анализ типа фигуры
    case AFigure of
      ftSquare: FItems[Index]:=TSquare.Create(ACanvas, ACanvas.ClipRect);
      ftCircle: FItems[Index]:=TCircle.Create(ACanvas, ACanvas.ClipRect);
      ftTriangle: FItems[Index]:=TTriangle.Create(ACanvas, ACanvas.ClipRect);
      ftSqSq: FItems[Index]:=TSqSq.Create(ACanvas, ACanvas.ClipRect);
      ftCiSq: FItems[Index]:=TCiSq.Create(ACanvas, ACanvas.ClipRect);
      ftSqCi: FItems[Index]:=TSqCi.Create(ACanvas, ACanvas.ClipRect);
      ftCiCi: FItems[Index]:=TCiCi.Create(ACanvas, ACanvas.ClipRect);
      ftTrCi: FItems[Index]:=TTrCi.Create(ACanvas, ACanvas.ClipRect);
      ftTrTr: FItems[Index]:=TTrTr.Create(ACanvas, ACanvas.ClipRect);
    end;
    FItems[Index].Color:=AColor;
    FItems[Index].Size:=ASize;
    FItems[Index].X:=X-Round(ASize/2);
    FItems[Index].Y:=Y-Round(ASize/2);
    SetBackColor(FBackColor);
  except
  end;
end;

constructor TPlotter.Create(Owner: TCanvas; ASize: TRect);
begin
  inherited Create;
  try
    ACanvas:=Owner;
    FCount:=0;
    FBackColor:=clWhite;
    ACanvas.Brush.Color:=BackColor;
    ACanvas.FillRect(ACanvas.ClipRect);
  finally
  end;
end;

procedure TPlotter.Delete(Index: Integer);
var
  I: Integer;
begin
  if Index>=0 then
  begin
    for I:=Index to High(FItems)-1 do FItems[I]:=FItems[I+1];
    FCount:=FCount-1;
    SetLength(FItems, FCount);
    SetBackColor(FBackColor);
  end;
end;

destructor TPlotter.Destroy;
begin
  SetLength(FItems, 0);
  inherited;
end;

procedure TPlotter.Free;
begin
  if Self<>nil then Self.Destroy;
  Self:=nil;
end;

function TPlotter.GetItem(Index: Integer): TFigure;
begin
  Result:=FItems[Index];
end;

procedure TPlotter.SetBackColor(AColor: TColor);
var
  I: Integer;
begin
  FBackColor:=AColor;
  ACanvas.Brush.Color:=AColor;
  ACanvas.FillRect(ACanvas.ClipRect);
  for I:=0 to High(FItems) do FItems[I].Draw;
end;

procedure TPlotter.SetItem(Index: Integer; AItem: TFigure);
begin
  FItems[Index]:=AItem;
end;

end.
