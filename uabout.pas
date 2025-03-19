unit uabout;

{$mode Delphi}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  klabels, cyCustomImage, GR32_Image, LCLIntf;

type

  { TfrmTentang }

  TfrmTentang = class(TForm)
    btclose: TButton;
    goChromium: TImage;
    goFPC: TImage;
    goLazarus: TImage;
    Image1: TImage;
    Image32_1: TImage32;
    KLinkLabel1: TKLinkLabel;
    KLinkLabel2: TKLinkLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    procedure btcloseClick(Sender: TObject);
    procedure goChromiumClick(Sender: TObject);
    procedure goCTClick(Sender: TObject);
    procedure goFPCClick(Sender: TObject);
    procedure goLazarusClick(Sender: TObject);
  private

  public

  end;

var
  frmTentang: TfrmTentang;

implementation

{$R *.lfm}

{ TfrmTentang }

procedure TfrmTentang.btcloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTentang.goChromiumClick(Sender: TObject);
begin
  OpenURL('https://www.videolan.org/vlc/');
end;

procedure TfrmTentang.goCTClick(Sender: TObject);
begin
  OpenURL('https://www.pilotlogic.com/sitejoom/');
end;

procedure TfrmTentang.goFPCClick(Sender: TObject);
begin
  OpenURL('https://www.freepascal.org');
end;

procedure TfrmTentang.goLazarusClick(Sender: TObject);
begin
   OpenURL('https://www.lazarus-ide.org');
end;

end.

