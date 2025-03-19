unit ulo_splash;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls;

type

  { TfrmSplash }

  TfrmSplash = class(TForm)
    Image6: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    tmSplash: TTimer;
    procedure FormShow(Sender: TObject);
    procedure tmSplashTimer(Sender: TObject);
  private

  public

  end;

var
  frmSplash: TfrmSplash;
  i : integer;

implementation

{$R *.lfm}

{ TfrmSplash }

procedure TfrmSplash.FormShow(Sender: TObject);
begin
  i := 0 ;
  tmSplash.Enabled:=true;
  ProgressBar1.Position:=0;
end;

procedure TfrmSplash.tmSplashTimer(Sender: TObject);
begin

  inc(i);
  ProgressBar1.Position:=i;
  if i > 100 then
   begin
     tmSplash.Enabled:=false;
     self.close;
   end;

end;

end.

