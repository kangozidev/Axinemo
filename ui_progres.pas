unit ui_progres;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms,  Controls, Windows, LCLIntf, Math, JwaWindows, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls, TplGifAnimatorUnit;

type

  { TfrmAxProgress }

  TfrmAxProgress = class(TForm)
    Label1: TLabel;
    lbANtiSleep: TLabel;
    Panel1: TPanel;
    plGifAnimator1: TplGifAnimator;
    spclose: TSpeedButton;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure lbANtiSleepClick(Sender: TObject);
    procedure plGifAnimator1Click(Sender: TObject);
    procedure spcloseClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure GerakAcak;
    procedure AntiSleep(j:boolean);
    procedure AcakWarna;
  public

  end;

var
  frmAxProgress: TfrmAxProgress;

implementation

uses ax_main;

{$R *.lfm}



{ TfrmAxProgress }



procedure TfrmAxProgress.AcakWarna;
begin
  Randomize;


  self.Color:= RGB(RandomRange(1,254),RandomRange(1,254),RandomRange(1,254));
  //Label1.font.color :=  RGB(RandomRange(1,254),RandomRange(1,254),RandomRange(1,254));
  //spclose.font.color :=  RGB(RandomRange(1,254),RandomRange(1,254),RandomRange(1,254));
  //lbANtiSleep.font.color := RGB(RandomRange(1,254),RandomRange(1,254),RandomRange(1,254));

end;

procedure TfrmAxProgress.AntiSleep(j:boolean);
const
  ES_CONTINUOUS = $80000000;
  ES_SYSTEM_REQUIRED = $00000001;
  ES_DISPLAY_REQUIRED = $00000002;

begin
  // Mencegah komputer masuk mode sleep dan menonaktifkan screensaver

  if j=True then
   begin
   SetThreadExecutionState( 0 ) ;
   SetThreadExecutionState( 0 );

   end
  else
  SetThreadExecutionState(ES_CONTINUOUS);

end;

procedure TfrmAxProgress.GerakAcak;
var
  screenWidth, screenHeight: Integer;
  randomX, randomY: Integer;

begin
  // Mendapatkan resolusi layar
  screenWidth := GetSystemMetrics(SM_CXSCREEN);
  screenHeight := GetSystemMetrics(SM_CYSCREEN);

  // Menghasilkan koordinat acak
  Randomize;  // Inisialisasi generator angka acak
  randomX := Random(screenWidth);
  randomY := Random(screenHeight);

  // Menggerakkan kursor ke posisi acak
  SetCursorPos(randomX, randomY);


end;



procedure TfrmAxProgress.spcloseClick(Sender: TObject);
begin
   //timer1.Enabled:=False;
   WindowState:=wsNormal;
   frmAxMain.StopAll;
   sleep(3000);
   //close;
end;

procedure TfrmAxProgress.Timer1Timer(Sender: TObject);
begin
  AcakWarna;
end;

procedure TfrmAxProgress.FormShow(Sender: TObject);
begin
  // timer1.Enabled:=True;
 //  AntiSleep;
  WindowState:=wsNormal;
  plGifAnimator1.FileName:=ExtractFilePath(Application.ExeName) + 'support\progress.gif';
end;

procedure TfrmAxProgress.lbANtiSleepClick(Sender: TObject);
begin
  if lbANtiSleep.Caption='Aktifkan Anti Sleep' then
   begin
   AntiSleep(true);
   WindowState:=wsMaximized;
   lbANtiSleep.Caption:='Non Aktifkan Anti Sleep';
   end
  else
  begin
    AntiSleep(false);
    WindowState:=wsNormal;
    lbANtiSleep.Caption:='Aktifkan Anti Sleep';
  end;
end;

procedure TfrmAxProgress.plGifAnimator1Click(Sender: TObject);
begin
  OpenDocument(ExtractFilePath(Application.ExeName) + 'support/Atlantis/awp.exe');
end;

procedure TfrmAxProgress.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  //timer1.Enabled:=false;

end;

end.

