unit ax_keylist;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  ExtCtrls, Buttons, DBCtrls, RxDBGrid;

type

  { TfrmKeyList }

  TfrmKeyList = class(TForm)
    dbKeyAPI: TDBEdit;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    Panel1: TPanel;
    RxDBGrid1: TRxDBGrid;
    spAdd: TSpeedButton;
    spAdd1: TSpeedButton;
    spAdd2: TSpeedButton;
    spAddKey: TSpeedButton;
    spDelKey: TSpeedButton;
    spbSimpanKey: TSpeedButton;
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure spAddClick(Sender: TObject);
    procedure spAddKeyClick(Sender: TObject);
    procedure spbResetTokenClick(Sender: TObject);
    procedure spbSimpanKeyClick(Sender: TObject);
    procedure spDelKeyClick(Sender: TObject);
    procedure spUseKeyClick(Sender: TObject);
  private

  public

  end;

var
  frmKeyList: TfrmKeyList;

implementation

uses ax_main;

{$R *.lfm}

{ TfrmKeyList }

procedure TfrmKeyList.spAddClick(Sender: TObject);
begin

end;

procedure TfrmKeyList.RxDBGrid1DblClick(Sender: TObject);
begin
    if Dialogs.MessageDlg('Hanya Menggunakan API KEY ini ?',
          mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
          frmAxMain.SINGLE_API_KEY:= frmAxMain.DTAPIKEY.FieldByName('gemini_key').AsString
    else
          frmAxMain.SINGLE_API_KEY:= '';

end;

procedure TfrmKeyList.spAddKeyClick(Sender: TObject);
begin
  frmAxMain.DTAPIKEY.Append;
  dbKeyAPI.Text:='';

end;

procedure TfrmKeyList.spbResetTokenClick(Sender: TObject);
begin
  frmAxMain.Koneksi.ExecuteDirect('update apikey set token=0');
  frmAxMain.DTAPIKEY.Refresh;
end;

procedure TfrmKeyList.spbSimpanKeyClick(Sender: TObject);
begin
  frmAxMain.DTAPIKEY.edit;
  frmAxMain.DTAPIKEY.post;

  frmAxMain.DTPrompt.edit;
  frmAxMain.DTPrompt.post;
end;

procedure TfrmKeyList.spDelKeyClick(Sender: TObject);
begin
   if Dialogs.MessageDlg('Hapus API KEY ini ? Tidak Bisa di Kembalikan',
          mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
            frmAxMain.DTAPIKEY.Delete;
end;

procedure TfrmKeyList.spUseKeyClick(Sender: TObject);
var
  ts_api : TStringList;
begin
  try
      ts_api := TStringList.Create;
      ts_api.Add(frmAxMain.DTAPIKEY.FieldByName('gemini_key').AsString);
      ts_api.SaveToFile(ExtractFilePath(Application.ExeName) + 'apikey.txt');
    finally
     ts_api.Free;
  end;
  ShowMessage('API KEY : ' + frmAxMain.DTAPIKEY.FieldByName('gemini_key').AsString + ' Digunakan ' );
end;

end.

