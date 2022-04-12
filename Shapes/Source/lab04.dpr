program lab04;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {Form1},
  uImageClass in '..\Unit\uImageClass.pas',
  uPlotterClass in '..\Unit\uPlotterClass.pas';

//,

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
