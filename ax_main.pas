unit ax_main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ShellApi, DB, SQLDB, Forms, Controls, opensslsockets,
  Graphics, Dialogs, Math, ExtCtrls, Buttons, StdCtrls, ComCtrls, FileCtrl,
  Menus, DBCtrls, ZConnection, ZDataset, StrUtils, Clipbrd, JvNavigationPane,
  ubrowser, RxDBGrid, IdThreadComponent, cyDBMemo, LCLIntf, openssl,
  fphttpclient, fpjson, DBGrids, FXProgressBar, SpkToolbar, spkt_Tab, spkt_Pane,
  spkt_Buttons, urlmon, process, Grids, TAGraph, TASeries, TADbSource, uabout,
  ui_progres, Types, ax_keylist, ulo_splash, ax_data, ZAbstractRODataset;

type

  { TfrmAxMain }

  TfrmAxMain = class(TForm)
    DSPrompt: TDataSource;
    DSGridRekap: TDataSource;
    dbmEnglish: TDBMemo;
    dbmTranslate: TDBMemo;
    DSAPIKEY: TDataSource;
    DSRekap: TDataSource;
    edtJudul: TDBEdit;
    GRDBook: TRxDBGrid;
    GRDTerjemahakn: TRxDBGrid;
    icobuku: TImageList;
    ImageList1: TImageList;
    ImageList2: TImageList;
    mnHapusNull: TMenuItem;
    mnHapusMassal: TMenuItem;
    mmText: TcyDBMemo;
    DSbook: TDataSource;
    DSTranslate: TDataSource;
    DSBookIsi: TDataSource;
    DTTranslate: TZQuery;
    mnRemoveENTER: TMenuItem;
    pgMain: TPageControl;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    pnl_judul_buku: TPanel;
    Panel7: TPanel;
    pbPrepare: TProgressBar;
    pbProgress: TProgressBar;
    pgDoc: TPageControl;
    pgResult: TPageControl;
    pnEditData: TPanel;
    pnMain: TPanel;
    popText: TPopupMenu;
    PopupMenu1: TPopupMenu;
    Process1: TProcess;
    spbAddBook: TSpkLargeButton;
    spbExportWord: TSpkLargeButton;
    spBooFolder: TSpeedButton;
    spbShowGrid: TSpkLargeButton;
    spbSaveTranslate: TSpkLargeButton;
    spBookFind: TSpeedButton;
    spbFull: TSpeedButton;
    spbReady: TSpeedButton;
    spbAll: TSpeedButton;
    SpkLargeButton1: TSpkLargeButton;
    SpkLargeButton15: TSpkLargeButton;
    SpkLargeButton16: TSpkLargeButton;
    spbPaste: TSpkLargeButton;
    spbManual: TSpkLargeButton;
    spbInfoAxinemo: TSpkLargeButton;
    spbDelBook: TSpkLargeButton;
    spbConvert: TSpkLargeButton;
    spbFilterBlank: TSpkLargeButton;
    spbGetAPI: TSpkLargeButton;
    SpkLargeButton2: TSpkLargeButton;
    spbChatGPT: TSpkLargeButton;
    spbSaveBook: TSpkLargeButton;
    spbPrepare: TSpkLargeButton;
    spbTansRow: TSpkLargeButton;
    spbTansAll: TSpkLargeButton;
    spbSimpanNash: TSpkLargeButton;
    spbOpenText: TSpkLargeButton;
    spbShowNaskah: TSpkLargeButton;
    spbShowNaskahTerjemah: TSpkLargeButton;
    SpkLargeButton3: TSpkLargeButton;
    spbDeepL: TSpkLargeButton;
    spbSalinKalimat: TSpkLargeButton;
    spbSalinPrompt: TSpkLargeButton;
    spbWord: TSpkLargeButton;
    spbSumber: TSpkLargeButton;
    spbDeleteRow: TSpkLargeButton;
    SpkLargeButton4: TSpkLargeButton;
    spbDrive: TSpkLargeButton;
    spbYou: TSpkLargeButton;
    spbProgress: TSpkLargeButton;
    spkGoogleFont: TSpkLargeButton;
    spb_BacBuku: TSpkLargeButton;
    spbCount: TSpkLargeButton;
    spkMachine: TSpkLargeButton;
    spkNoTranslate: TSpkLargeButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    spnCariKata: TSpkLargeButton;
    spnInsertKey: TSpkLargeButton;
    spb_AIBrowser: TSpkLargeButton;
    SpkPane1: TSpkPane;
    SpkPane2: TSpkPane;
    SpkPane4: TSpkPane;
    SpkPane5: TSpkPane;
    SpkPane6: TSpkPane;
    SpkTab1: TSpkTab;
    SpkTab2: TSpkTab;
    SpkToolbar1: TSpkToolbar;
    tbs_Grid: TTabSheet;
    tbs_Maker: TTabSheet;
    tbs_Hasil: TTabSheet;
    tbs_AIBrowser: TTabSheet;
    tbs_GridRes: TTabSheet;
    tbs_PageMemo: TTabSheet;
    tbs_PageRes: TTabSheet;
    thrTranslateAI: TIdThreadComponent;
    OdTextFile: TOpenDialog;
    Panel2: TPanel;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Koneksi: TZConnection;
    DTBook: TZQuery;
    DTBookIsi: TZQuery;
    DTGetData: TZQuery;
    DTrekap: TZQuery;
    DTAPIKEY: TZTable;
    DTGridRekap: TZQuery;
    DTPrompt: TZTable;
    procedure ckBelumDiterjemahkanClick(Sender: TObject);
    procedure dbmEnglishClick(Sender: TObject);
    procedure dbmTranslateDblClick(Sender: TObject);
    procedure DTBookAfterApplyUpdates(Sender: TObject);
    procedure DTBookAfterDelete(DataSet: TDataSet);
    procedure DTBookAfterOpen(DataSet: TDataSet);
    procedure DTBookAfterScroll(DataSet: TDataSet);
    procedure DTTranslateAfterPost(DataSet: TDataSet);
    procedure DTTranslateAfterScroll(DataSet: TDataSet);
    procedure edtCariKataChange(Sender: TObject);
    procedure edtJudulKeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GRDBookCellClick(Column: TColumn);
    procedure GRDBookDblClick(Sender: TObject);
    procedure GRDBookDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GRDTerjemahaknCellClick(Column: TColumn);
    procedure GRDTerjemahaknDblClick(Sender: TObject);
    procedure GRDTerjemahaknDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure mnAboutClick(Sender: TObject);
    procedure mnAddEbookClick(Sender: TObject);
    procedure mnHapusMassalClick(Sender: TObject);
    procedure mnHapusNullClick(Sender: TObject);
    procedure mnRemoveENTERClick(Sender: TObject);
    procedure spbAllClick(Sender: TObject);
    procedure spbBukaClick(Sender: TObject);
    procedure spbChatGPTClick(Sender: TObject);
    procedure spbConvertClick(Sender: TObject);
    procedure spbCountClick(Sender: TObject);
    procedure spbDeepLClick(Sender: TObject);
    procedure spbDeleteRowClick(Sender: TObject);
    procedure spbDriveClick(Sender: TObject);
    procedure spbErrorClick(Sender: TObject);
    procedure spbFilterBlankClick(Sender: TObject);
    procedure spbFullClick(Sender: TObject);
    procedure spbGeminiClick(Sender: TObject);
    procedure spbGetAPIClick(Sender: TObject);
    procedure spbHapusClick(Sender: TObject);
    procedure spbManualClick(Sender: TObject);
    procedure spBooFolderClick(Sender: TObject);
    procedure spBookFindClick(Sender: TObject);
    procedure spbProgressClick(Sender: TObject);
    procedure spbReadyClick(Sender: TObject);
    procedure spbWordClick(Sender: TObject);
    procedure spbNullClick(Sender: TObject);
    procedure spbPasteClick(Sender: TObject);
    procedure spbSalinKalimatClick(Sender: TObject);
    procedure spbSalinPromptClick(Sender: TObject);
    procedure spbSimpanClick(Sender: TObject);
    procedure spbStopClick(Sender: TObject);
    procedure spbSumberClick(Sender: TObject);
    procedure spbYouClick(Sender: TObject);
    procedure spb_BacBukuClick(Sender: TObject);
    procedure spkGoogleFontClick(Sender: TObject);
    procedure SpkLargeButton4Click(Sender: TObject);
    procedure spkMachineClick(Sender: TObject);
    procedure spkNoTranslateClick(Sender: TObject);
    procedure spkYandexClick(Sender: TObject);
    procedure Splitter1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure Splitter1Moved(Sender: TObject);
    procedure spnCariKataClick(Sender: TObject);
    procedure spnInsertKeyClick(Sender: TObject);
    procedure spNotranslate(Sender: TObject);
    procedure spOpenFileClick(Sender: TObject);
    procedure spPrepareClick(Sender: TObject);
    procedure spSaveIsiClick(Sender: TObject);
    procedure spSaveTranslate1Click(Sender: TObject);
    procedure spSaveTranslateClick(Sender: TObject);
    procedure spShowGridClick(Sender: TObject);
    procedure spShowResult1Click(Sender: TObject);
    procedure spShowResult2Click(Sender: TObject);
    procedure spTranslateAllClick(Sender: TObject);
    procedure spTranslateClick(Sender: TObject);
    procedure tbs_AIBrowserShow(Sender: TObject);
    procedure tbs_GridShow(Sender: TObject);
    procedure tbs_HasilShow(Sender: TObject);
    procedure thrTranslateAIRun(Sender: TIdThreadComponent);
    procedure thrTranslateAITerminate(Sender: TIdThreadComponent);
  private
    FrmRes : TfrmBrowser;
    FrmGem : TfrmBrowser;
    FAbout : TfrmTentang;
    FAxProgress : TfrmAxProgress;
    FKeyList : TfrmKeyList ;
    FSplash : TfrmSplash;
    FrmPDF : TfrmBrowser;
    FrmGrid : TfrmGrid;
    procedure Initiate;
    function AsktoGemini(s:string):string;
    function GetData(sq:string;f:string):string;
    function HasInternet: Boolean;
    procedure TranslateOne;
    procedure TranslateAll;
    function RemoveEnter(const s: string): string;
    procedure FormatPage;
    procedure prepare;
    procedure Progress;
    procedure BacaPosisiBaris;
    function getKey:string;
    procedure TampilkanData;
    procedure MarkPDF;

  public
    mode : string ;
    api:string;
    SINGLE_API_KEY :string;
    JUMLAH_BARIS : Integer;
    procedure StopAll;
    procedure GoBookByID(id:string);
  end;

var
  frmAxMain: TfrmAxMain;

implementation

{$R *.lfm}


function TfrmAxMain.getKey:string;
var
  i : integer;
begin

 Randomize;

 with DTAPIKEY do
  begin
    close;
    open;
    i := RandomRange(1, RecordCount);
    RecNo:=i;
    Result := Trim(FieldByName('gemini_key').AsString);

  end;

end;

procedure TfrmAxMain.FormatPage;
var
  m : string;
begin

  DTBookIsi.edit;
  m := mmText.text;

  m := AnsiReplaceStr(m , '.' + #13 , '.-ENTER-');
  m := AnsiReplaceStr(m , #13 + #13 , '-DOUBLEENTER-');
  m := AnsiReplaceStr(m , ')' + #13 , ')ENTER-');
  m := AnsiReplaceStr(m , '"' + #13 , '"-ENTER-');
  m := AnsiReplaceStr(m , '?' + #13 , '?-ENTER-');
  m := AnsiReplaceStr(m , '.' + #13#13 , '2-ENTER-');
  m := RemoveEnter(m);
  m := AnsiReplaceStr(m , '.-ENTER-','.' + #13#13 );
  m := AnsiReplaceStr(m , '"-ENTER-','"' + #13 );
  m := AnsiReplaceStr(m , '?-ENTER-','?' + #13 );
  m := AnsiReplaceStr(m , '2-ENTER-','.' + #13#13 );
  m := AnsiReplaceStr(m ,  ')ENTER-',')' + #13 );
  m := AnsiReplaceStr(m ,  '-DOUBLEENTER-', #13 + #13);

  mmText.text := m;
  DTBookIsi.post;

end;

procedure TfrmAxMain.FormShow(Sender: TObject);
begin
  Initiate;
  JUMLAH_BARIS := 5;
   With DTBookIsi do
  begin
    close;
    Prepared:=True;
    ParamByName('var_id').AsString:= DTBook.FieldByName('ID').AsString;
    open;
  end;

  With DTTranslate do
  begin
    close;
    Prepared:=True;
    ParamByName('var_id').AsString:= DTBook.FieldByName('ID').AsString;
    open;
  end;
  dbmEnglish.Width:=trunc(pnEditData.Width/2)-10;
end;

procedure TfrmAxMain.ckBelumDiterjemahkanClick(Sender: TObject);
begin


end;

procedure TfrmAxMain.dbmEnglishClick(Sender: TObject);
begin

end;

procedure TfrmAxMain.dbmTranslateDblClick(Sender: TObject);
begin
 dbmTranslate.Clear;
 dbmTranslate.PasteFromClipboard;
end;

procedure TfrmAxMain.DTBookAfterApplyUpdates(Sender: TObject);
begin
  
 With DTBookIsi do
  begin
    close;
    Prepared:=True;
    ParamByName('var_id').AsString:= DTBook.FieldByName('ID').AsString;
    open;
  end;

  With DTTranslate do
  begin
    Filtered:=false;
    close;
    Prepared:=True;
    ParamByName('var_id').AsString:= DTBook.FieldByName('ID').AsString;
    open;
  end;

  tbs_GridRes.show;
  tbs_PageMemo.show;
  try
  Progress;
  except
  on e:exception do exit;
  end;

end;

procedure TfrmAxMain.DTBookAfterDelete(DataSet: TDataSet);
begin

   With DTBookIsi do
    begin
      close;
      Prepared:=True;
      ParamByName('var_id').AsString:= DTBook.FieldByName('ID').AsString;
      open;
    end;

    With DTTranslate do
    begin
      Filtered:=false;
      close;
      Prepared:=True;
      ParamByName('var_id').AsString:= DTBook.FieldByName('ID').AsString;
      open;
    end;

    tbs_GridRes.show;
    tbs_PageMemo.show;
    try
    Progress;
    except
    on e:exception do exit;
    end;

end;

procedure TfrmAxMain.DTBookAfterOpen(DataSet: TDataSet);
begin
   pnl_judul_buku.Caption:= 'Teks Asli : ' + DTBook.FieldByName('judul').AsString;
end;

procedure TfrmAxMain.DTBookAfterScroll(DataSet: TDataSet);
begin
  StatusBar1.Panels[0].Text:= IntToStr(DTBook.RecordCount);
end;

procedure TfrmAxMain.DTTranslateAfterPost(DataSet: TDataSet);
begin

end;

procedure TfrmAxMain.DTTranslateAfterScroll(DataSet: TDataSet);
begin
  BacaPosisiBaris
end;

procedure TfrmAxMain.edtCariKataChange(Sender: TObject);
begin

end;

procedure TfrmAxMain.edtJudulKeyPress(Sender: TObject; var Key: char);
begin
  if Key=#13 then
  begin
     spbSumber.Checked:=True;
     pgDoc.Visible:=True;
     spbSumber.Caption:='Sembunyikan Sumber';
     DTBook.post;
     DTBook.Refresh;
     DTBook.First;
     DTBookIsi.close;
     DTTranslate.close;
     pgDoc.Visible:=True;
  end;
end;

procedure TfrmAxMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction:=caFree;
  Free;
  Application.Terminate;
end;


function TfrmAxMain.GetData(sq:string;f:string):string;
begin
   With DTGetData do
   begin
     close;
     sql.Clear;
     sql.Add(sq);
     open;
     Result := FieldByName(f).AsString;
   end;
end;

procedure TfrmAxMain.GRDBookCellClick(Column: TColumn);
var
  nbook:string;
begin

 pnl_judul_buku.Caption:= 'Teks Asli : ' + DTBook.FieldByName('judul').AsString;
 caption :=  'Axinemo ( Aplikasi Penerjemah Memo ) v2  * ' + DTBook.FieldByName('judul').AsString + ' *';
 pbPrepare.Position:=0;

 if spbSumber.Caption='Sembunyikan Sumber' then
 begin
 With DTBookIsi do
  begin
    close;
    Prepared:=True;
    ParamByName('var_id').AsString:= DTBook.FieldByName('ID').AsString;
    open;
  end;
 end;


  With DTTranslate do
  begin
    Filtered:=false;
    close;
    Prepared:=True;
    ParamByName('var_id').AsString:= DTBook.FieldByName('ID').AsString;
    open;
  end;

  tbs_GridRes.show;
  tbs_PageMemo.show;
  SpkToolbar1.TabIndex:=0;

  nbook := ExtractFilePath(Application.ExeName) + 'files\pdf\' + Trim(DTBook.FieldByName('judul').AsString) + '.pdf' ;

  if FileExists(nbook) then

  FrmPDF.Chromium1.LoadURL(nbook)
  else
  begin
  tbs_Maker.Show;
  FrmPDF.Chromium1.LoadURL('about:blank');

  end;

  try
  Progress;
  except
  on e:exception do exit;
  end;

  GRDTerjemahakn.Enabled:=True;
end;


procedure TfrmAxMain.GRDBookDblClick(Sender: TObject);
var
  nbook:string;

begin
  nbook := ExtractFilePath(Application.ExeName) + 'files\doc\' +
           Trim(DTBook.FieldByName('judul').AsString) + '.docx' ;

  if FileExists(nbook) then
  begin
     OpenDocument(nbook);
  end;
end;

procedure TfrmAxMain.GRDBookDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if DTBook.FieldByName('status').AsString='1' then
     GRDBook.Canvas.Font.Color:=clgreen
   else
     GRDBook.Canvas.Font.Color:=$005C12AF;

 
 GRDBook.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmAxMain.GRDTerjemahaknCellClick(Column: TColumn);
begin
  BacaPosisiBaris;
end;

procedure TfrmAxMain.GRDTerjemahaknDblClick(Sender: TObject);
begin

  if Dialogs.MessageDlg('Terjemahan Sama dengan Teks',
          mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
          begin
           DTTranslate.edit;
           dbmTranslate.Text:=dbmEnglish.Text;
           DTTranslate.post;
          end;
end;

procedure TfrmAxMain.GRDTerjemahaknDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if AnsiContainsStr(DTTranslate.FieldByName('book_translate').AsString,'-ERROR-') then
        begin
        GRDTerjemahakn.Canvas.Font.Color:=$005C12AF   ;
        GRDTerjemahakn.Canvas.Font.Size:= 11;
        end
 else
 begin
   GRDTerjemahakn.Canvas.Font.Color:=clBlack;
   GRDTerjemahakn.Canvas.Font.Size:= 11;
 end;



 GRDTerjemahakn.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmAxMain.mnAboutClick(Sender: TObject);
begin
  FAbout.ShowModal;
end;

procedure TfrmAxMain.mnAddEbookClick(Sender: TObject);
begin
  if Dialogs.MessageDlg('Menambah Data Buku  ? ',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
    DTBook.Append;
    DTBook.FieldByName('judul').AsString:=' ';
    DTBook.FieldByName('judul').AsString:='';
    edtJudul.SetFocus;

    end;
end;

procedure TfrmAxMain.mnHapusMassalClick(Sender: TObject);
var
  s1,s2,c,b : string;
begin

  s1 := InputBox('Data','Masukan ID AWAL','');
  s2 := InputBox('Data','Masukan ID AKHIR','');
  b := DTTranslate.FieldByName('book_id').AsString;

  if (s1 <> '') or (s2 <> '' ) then
    begin
       if Dialogs.MessageDlg('Menghapus Data Baris ' +  s1 + ' sampai ' + s2 +' ? ',
           mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
             begin
             c := 'DELETE FROM book_trans WHERE book_id=' + b  + ' AND ( id between  ' + s1 + ' and ' + s2 + ' )';
              Koneksi.ExecuteDirect(c);
              DTTranslate.Refresh;
             end;
    end ;

end;

procedure TfrmAxMain.mnHapusNullClick(Sender: TObject);
var
  c,b : string;
begin
   b := DTTranslate.FieldByName('book_id').AsString;
 if Dialogs.MessageDlg('Menghapus Data Baris yang Belum diterjemahkan ? ',
           mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
             begin
             c := 'DELETE FROM book_trans WHERE book_id=' + b  + ' AND book_translate is null';
              Koneksi.ExecuteDirect(c);
              DTTranslate.Refresh;
             end;
end;


procedure TfrmAxMain.mnRemoveENTERClick(Sender: TObject);
begin
 FormatPage;
end;

procedure TfrmAxMain.spbAllClick(Sender: TObject);
begin
  DTBook.Filtered:=false;
  DTBook.First;
  TampilkanData;
end;

procedure TfrmAxMain.spbBukaClick(Sender: TObject);
var
  o : string;
  t : string;
  h : string;
  fl: string;
  p : TstringList;
begin

 // tbs_PageRes.show;
  h := '';
  With DTTranslate do
  begin
    First;
    While not eof do
    begin

      t := FieldByName('book_translate').AsString;
      t :=  t + #13#13 ;
      h := h +  t ;
      next;
    end;
    end;

  p := TStringList.create;
  p.text := h ;
  fl := ExtractFilePath(Application.ExeName) + 'files/doc/' + DTBook.FieldByName('judul').AsString + '.doc';

  if FileExists(fl) then
  begin
      if Dialogs.MessageDlg('File Hasil Translate Sudah Ada, Akan ditimpa ?',
      mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
      begin
        p.SaveToFile(fl);
        opendocument(fl);
      end
      else
        opendocument(fl);
  end
  else
  begin
    p.SaveToFile(fl);
    opendocument(fl);
  end;


end;

procedure TfrmAxMain.spbChatGPTClick(Sender: TObject);
begin

 pgDoc.Visible:=true;
 spbSumber.Caption:='Sembunyikan Sumber';

 FrmGem.Chromium1.LoadURL('https://chatgpt.com/');
 tbs_AIBrowser.show;
end;

procedure TfrmAxMain.spbConvertClick(Sender: TObject);
begin
  OpenDocument('https://convertio.co/epub-doc/');
end;

procedure TfrmAxMain.spbCountClick(Sender: TObject);
var
  j : string;
begin
  j := InputBox('Pengaturan','Jumlah Baris / Terjemahan','5');
  if (J = '') or (j = '0') or ( strtoint(j) > 10) then
  j:= '5';

  JUMLAH_BARIS:=StrToInt(j);
  StatusBar1.Panels[1].Text:= 'JUMLAH BARIS/TRANSLATE = ' + j;

end;

procedure TfrmAxMain.spbDeepLClick(Sender: TObject);
begin
 pgDoc.Visible:=true;
 spbSumber.Caption:='Sembunyikan Sumber';

 FrmGem.Chromium1.LoadURL('https://www.deepl.com/en/translator');
 tbs_AIBrowser.show;
end;

procedure TfrmAxMain.spbDeleteRowClick(Sender: TObject);
begin
 if Dialogs.MessageDlg('Menghapus Baris/Paragraph ini Tidak Bisa dikembalikan',
   mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
 begin
        DTTranslate.Delete;
        Progress;
 end;
end;

procedure TfrmAxMain.spbDriveClick(Sender: TObject);
begin

 OpenDocument(ExtractFilePath(Application.ExeName) + 'support/Atlantis/awp.exe');
end;

procedure TfrmAxMain.spbErrorClick(Sender: TObject);
begin
  DTTranslate.Filtered:=false;
  DTTranslate.Filter:= 'book_translate=' + QuotedStr('-ERROR-');
  DTTranslate.Filtered:=True;
  DTTranslate.First;
  tbs_GridRes.show;
end;

procedure TfrmAxMain.spbFilterBlankClick(Sender: TObject);
begin

 if Dialogs.MessageDlg('Apakah Akan Menuju Baris Blank / Belum diterjemahkan?',
          mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
          begin


           DTTranslate.Filtered:=false;
           DTTranslate.First;

           while  (DTTranslate.FieldByName('book_translate').AsString <>'') and
                  (not DTTranslate.eof) do
           begin
            DTTranslate.next;

           end;
             tbs_GridRes.show;

  end;

end;

procedure TfrmAxMain.spbFullClick(Sender: TObject);
begin
  DTBook.Filtered:=false;
  DTBook.Filter:='status=1';
  DTBook.Filtered:=true;
  DTBook.First;
  TampilkanData;
end;

procedure TfrmAxMain.spbGeminiClick(Sender: TObject);
begin

 pgDoc.Visible:=true;
 spbSumber.Caption:='Sembunyikan Sumber';
 FrmGem.Chromium1.LoadURL('https://gemini.google.com/');
 tbs_AIBrowser.show;
end;

procedure TfrmAxMain.spbGetAPIClick(Sender: TObject);
begin
 OpenDocument('https://aistudio.google.com/app/u/1/prompts/new_chat');
end;

procedure TfrmAxMain.spbHapusClick(Sender: TObject);
begin
  if Dialogs.MessageDlg('Menghapus Data Buku ini ? ',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
    Koneksi.ExecuteDirect('delete from book_trans where book_id=' + DTBook.FieldByName('ID').AsString);
    DTBook.Delete;
    DTBookIsi.Refresh;
    DTTranslate.Refresh;
    end;
end;

procedure TfrmAxMain.spbManualClick(Sender: TObject);
begin
  OpenDocument(ExtractFilePath(Application.ExeName)  + 'support\manual_axinemo.pdf');
end;

procedure TfrmAxMain.spBooFolderClick(Sender: TObject);
begin
  ShellExecute(Handle,'open',PChar(ExtractFilePath(Application.ExeName) + 'files/doc/'),nil,nil,1);
end;

procedure TfrmAxMain.spBookFindClick(Sender: TObject);
var
  j : string;
begin
  j := InputBox('Cari Judul ','Masukan Judul Buku','');
  if j<>'' then
    begin
    DTBook.Filtered:=false;
    DTBook.Filter:='judul like' + QuotedStr('*' + j + '*');
    DTBook.Filtered:=true;
    end;

end;

procedure TfrmAxMain.spbProgressClick(Sender: TObject);
begin
  DTGridRekap.Close;
  DTGridRekap.open;
  tbs_Grid.show;
end;

procedure TfrmAxMain.spbReadyClick(Sender: TObject);
begin

  DTBook.Filtered:=false;
  DTBook.Filter:='pdf=''+''';
  DTBook.Filtered:=true;
  DTBook.First;
  TampilkanData;

end;

procedure TfrmAxMain.spbWordClick(Sender: TObject);
begin
  OpenDocument('winword');
end;

procedure TfrmAxMain.spbNullClick(Sender: TObject);
begin

end;

procedure TfrmAxMain.spbPasteClick(Sender: TObject);
begin
    if Dialogs.MessageDlg('Akan mempaste teks dari clipboard',
          mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
          begin
           DTBookIsi.edit;
           mmText.PasteFromClipboard;

          end;
end;

procedure TfrmAxMain.spbSalinKalimatClick(Sender: TObject);
begin
    GRDTerjemahakn.Enabled:=false;
  dbmEnglish.SelectAll;
  Clipboard.AsText:=  dbmEnglish.text ;
end;

procedure TfrmAxMain.spbSalinPromptClick(Sender: TObject);
begin
  GRDTerjemahakn.Enabled:=false;
  dbmEnglish.SelectAll;
  Clipboard.AsText:= 'Terjemahkan ''' + dbmEnglish.text + ''' dalam bahasa Indonesia yang lebih natural';
end;

procedure TfrmAxMain.spbSimpanClick(Sender: TObject);
begin
  if Trim(edtJudul.text)<>'' then
    begin
    DTBook.Edit;
    DTBook.Post;
    DTBook.Refresh;
    end;

  MarkPDF
end;

procedure TfrmAxMain.spbStopClick(Sender: TObject);
begin
  thrTranslateAI.Terminate;
  ShowMessage('Semua Progress Dihentikan');
end;

procedure TfrmAxMain.spbSumberClick(Sender: TObject);
begin
    if spbSumber.Caption='Sembunyikan Sumber' then
    begin
    pgDoc.Visible:=false;
    spbSumber.Caption:='Tampilkan Sumber';
    end
    else
    begin
      pgDoc.Visible:=true;
      spbSumber.Caption:='Sembunyikan Sumber';

    end;

    dbmEnglish.Width:=trunc(pnEditData.Width/2)-10;
end;

procedure TfrmAxMain.spbYouClick(Sender: TObject);
begin
  pgDoc.Visible:=true;
  spbSumber.Caption:='Sembunyikan Sumber';
  FrmGem.Chromium1.LoadURL('https://you.com/?chatMode=default');
  tbs_AIBrowser.show;
end;

procedure TfrmAxMain.spb_BacBukuClick(Sender: TObject);
begin
  OpenDocument('https://bacabukumenarik.blogspot.com');
end;

procedure TfrmAxMain.spkGoogleFontClick(Sender: TObject);
begin
  OpenDocument('https://fonts.google.com/');
end;

procedure TfrmAxMain.SpkLargeButton4Click(Sender: TObject);
begin

end;

procedure TfrmAxMain.spkMachineClick(Sender: TObject);
begin
  pgDoc.Visible:=true;
  spbSumber.Caption:='Sembunyikan Sumber';
  FrmGem.Chromium1.LoadURL('https://www.machinetranslation.com/');
  tbs_AIBrowser.show;
end;

procedure TfrmAxMain.spkNoTranslateClick(Sender: TObject);
begin

end;

procedure TfrmAxMain.spkYandexClick(Sender: TObject);
begin
  FrmGem.Chromium1.LoadURL('https://translate.yandex.com/');
 tbs_AIBrowser.show;
end;

procedure TfrmAxMain.Splitter1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin

end;

procedure TfrmAxMain.Splitter1Moved(Sender: TObject);
begin
    dbmEnglish.Width:=trunc(pnEditData.Width/2)-10;
end;

procedure TfrmAxMain.spnCariKataClick(Sender: TObject);
var
  k :string;
begin

  k := InputBox('Cari','Masukan Kata yang akan dicari','');
  if Length(k)>3 then
  begin
    DTTranslate.Filtered:=false;
    DTTranslate.Filter:='book_translate like' + QuotedStr('*'+k+'*');
    DTTranslate.Filtered:=true;
  end
  else
    DTTranslate.Filtered:=false;
end;

procedure TfrmAxMain.spnInsertKeyClick(Sender: TObject);
begin

 FKeyList.ShowModal;

end;

procedure TfrmAxMain.spNotranslate(Sender: TObject);
begin
     if Dialogs.MessageDlg('Terjemahan Sama dengan Teks',
          mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
          begin
           DTTranslate.edit;
           dbmTranslate.Text:=dbmEnglish.Text;
           DTTranslate.post;
          end;
end;


function TfrmAxMain.HasInternet: Boolean;
begin

     if URLDownloadToFile(nil, PChar('https://google.com'),
        PChar(ExtractFilePath(Application.ExeName) + 'inet.stat'), 0, nil) = 0 then
          Result := True
     else
         Result := false;

end;

procedure TfrmAxMain.TranslateOne;
var
  nash, tr : string;
  prompt : string;
  state : string;
begin

 if not HasInternet then
   begin
     ShowMessage('Tidak Ada Koneksi Intenet');
     thrTranslateAI.Terminate;
     GRDTerjemahakn.Enabled:=true;
      exit;
   end;

  state := DTTranslate.FieldByName('book_translate').AsString;

  GRDTerjemahakn.Enabled:=false;

 if Dialogs.MessageDlg('Terjemahkan Baris Ini dengan AI ? ',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
      DTTranslate.Edit;
      nash := DTTranslate.FieldByName('book_paragraph').AsString ;
      if AnsiContainsStr(nash,'http') then
         nash := AnsiReplaceStr(nash,'- ','-') ;

         prompt := DTPrompt.FieldByName('prompt').AsString;
         prompt := AnsiReplaceStr(prompt,'$KALIMAT',nash);

      tr :=  AsktoGemini(prompt);
     // clipboard.AsText:='Terjemahkan ''' + nash + ''' dalam bahasa Indonesia ';

      DTTranslate.FieldByName('book_translate').AsString := tr;
      if tr=state then
         ShowMessage('Terjemah Masih Error , Gunakan AI Browser');
      DTTranslate.Post;
      Progress;
    thrTranslateAI.Terminate;
    end
 else
  thrTranslateAI.Terminate;

 GRDTerjemahakn.Enabled:=true;
end;

procedure TfrmAxMain.TranslateAll;
var
  nash, trj, tr : string;
  prompt : string;
  i: integer;
begin

 if not HasInternet then
   begin
     ShowMessage('Tidak Ada Koneksi Intenet');
     thrTranslateAI.Terminate;
     FAxProgress.Close;

     exit;
   end;

    i := DTTranslate.RecNo;
    while not DTTranslate.eof do
    begin

      Progress;
      trj :=   DTTranslate.FieldByName('book_translate').AsString ;


      nash := DTTranslate.FieldByName('book_paragraph').AsString ;
      pbProgress.Position:=DTTranslate.RecNo;

      if thrTranslateAI.Terminated then
         begin
           DTTranslate.Last;
           DTTranslate.RecNo:=i;
           exit;
         end;

      if (Length(nash)=1) or
         (Length(trj)>8)  then
       tr := nash
      else if AnsiMatchStr(nash,['--','---','----','**','***','****']) then
       tr := nash
      else
         prompt := DTPrompt.FieldByName('prompt').AsString;
         prompt := AnsiReplaceStr(prompt,'$KALIMAT',nash);

      // tr :=  AsktoGemini('Terjemahkan frasa ''' + nash + ''' ke dalam bahasa Indonesia yang lebih natural');
        prompt := AnsiReplaceStr(prompt,'$KALIMAT',  nash  );

        tr := AsktoGemini(prompt);

       DTTranslate.Edit;

      if AnsiContainsStr(tr,'http') then
         tr := AnsiReplaceStr(nash,'- ','-') ;

       DTTranslate.FieldByName('book_translate').AsString := tr;
       DTTranslate.Post;
       Sleep(2000);
       prompt := DTPrompt.FieldByName('prompt').AsString;
       DTTranslate.next;

    end;
   frmAxProgress.spclose.Click;
   ShowMessage('Proses Penerjemahan Selesai');

   thrTranslateAI.Terminate;

end;



procedure TfrmAxMain.spOpenFileClick(Sender: TObject);
begin
  if OdTextFile.Execute then
  begin
    DTBookIsi.Edit;
    MmText.Lines.LoadFromFile(OdTextFile.FileName);
    DTBookIsi.post;
  end;
end;

procedure TfrmAxMain.spPrepareClick(Sender: TObject);
var
  angka1 : integer;
  angka2 : integer;
  hasil  : integer;
  tanya : string;
begin





  Randomize;
  angka1 := RandomRange(1,100);
  angka2 := RandomRange(1,100);

  hasil := angka1 + angka2 ;
  tanya := InputBox('Proteksi',#13 + 'Hitung ' + IntToStr(angka1) + ' + ' +
                   IntToStr( angka2 ) + ' ?' +#13,'');
  if  tanya=IntToStr(hasil) then
  begin

  mode := 'prepare';
  thrTranslateAI.Active:=TRue;
  pbProgress.Position:=0;

  end
  else
  ShowMessage('Hitungan Salah');
end;

procedure TfrmAxMain.spSaveIsiClick(Sender: TObject);
begin
  try
  DTBookIsi.edit;
  DTBookIsi.Post;
  except
  on e:exception do
  exit;
  end;
end;

procedure TfrmAxMain.spSaveTranslate1Click(Sender: TObject);
begin
   if Dialogs.MessageDlg('Terjemahan Sama dengan Teks',
          mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
          begin
           DTTranslate.edit;
           dbmTranslate.Text:=dbmEnglish.Text;
           DTTranslate.post;
          end;
end;

procedure TfrmAxMain.spSaveTranslateClick(Sender: TObject);
begin

  DTTranslate.edit;
  DTTranslate.post;
  DTTranslate.First;
  Progress;
  GRDTerjemahakn.Enabled:=True;
end;

procedure TfrmAxMain.prepare;
var

  ts : TStringList;
  j,i : integer;
  book_id : string;
  sq : string;
  ck : string;
  ta : string;
  o : integer;
  outputLine : string;
  linecount: Integer =0;
begin


  GRDBook.Enabled:=False;
  try
    ts := Tstringlist.Create;
    ts.Text:= MmText.Text;
    j := ts.Count-1;

    book_id := DTBookIsi.FieldByName('id').AsString;

    ck := GetData('select count(id) as j from book_trans where book_id=' + book_id ,'J' );

    if ck <> '0' then
    begin

       if Dialogs.MessageDlg('Data Sudah Ada , Apakah Akan digenerate Ulang ? ',
          mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
            Koneksi.ExecuteDirect('delete from book_trans where book_id=' + book_id)  ;

    end;
      outputLine:='';
      linecount:=0;;
      pbPrepare.Min:=0;
      pbPrepare.Max:=j;
      //__________________________________________________________________________

      for i := 0 to j - 1 do
          begin
            outputLine := outputLine + ts[i] + #13;
            Inc(linecount);
            pbPrepare.Position:=i;
            if linecount = JUMLAH_BARIS then
            begin
              // Masukkan ke tabel
                  if  Length(trim(outputline))<>0 then
                     begin

                     sq:= 'Insert Into book_trans(book_id,book_paragraph) values (' +
                          book_id + ',' + QuotedStr(Trim(outputline)) + ')';
                          Koneksi.ExecuteDirect(sq);
                     end;

              // Reset untuk kelompok berikutnya
              outputLine := '';
              lineCount := 0;
            end;
          end;

          // Masukkan sisa baris jika ada
          if outputLine <> '' then
          begin
            if  Length(trim(outputline))<>0 then
                begin

                     sq:= 'Insert Into book_trans(book_id,book_paragraph) values (' +
                          book_id + ',' + QuotedStr(Trim(outputline)) + ')';
                          Koneksi.ExecuteDirect(sq);
                end;

          end;



  finally
   ts.Free;
  end;
  Koneksi.ExecuteDirect('delete from book_trans where trim(book_paragraph)='' ''');
  ShowMessage('Proses Selesai');
  GRDBook.Enabled:=true;
  DTTranslate.Refresh;
  thrTranslateAI.Terminate;
end;

procedure TfrmAxMain.spShowGridClick(Sender: TObject);
begin
  tbs_GridRes.show;
end;

procedure TfrmAxMain.spShowResult1Click(Sender: TObject);
var
  o : string;
  t : string;
  r : string;
  h : string;
  p : TstringList;
  fl : string;
begin
  //tbs_PageRes.show;
  h := '<html><body>';
   h := '<html><body><table width="100%" border=0>' ;

  With DTTranslate do
  begin
    First;
    While not eof do
    begin
      o := FieldByName('book_paragraph').AsString;
      o := '<tr><td width="100%" style="border: 1px solid #ddd;color:#404008;font-family:'+
           'Arial;padding:20px">' + o + '</td></tr>' ;
      t := FieldByName('book_translate').AsString;
      t := '<tr><td width="100%" style="color:#00007;font-family:'+
           'Arial;border: 1px solid #ddd;background-color:#FFFFFB;padding:20px"><b>' + t + '</b>'+
           '</td></tr>' ;
      r := r + o + t ;
      next;
    end;
     h := h + r + '</table></body></html>' ;
    end;

  p := TStringList.create;
  p.text := h ;
  fl := ExtractFilePath(Application.ExeName) + 'files/doc/' + DTBook.FieldByName('judul').AsString + '_V.doc';

  if FileExists(fl) then
   begin
        if Dialogs.MessageDlg('File Hasil Translate Sudah Ada, Akan ditimpa ?',
        mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
        begin
          p.SaveToFile(fl);
          opendocument(fl);
        end
        else
          opendocument(fl);
  end
  else
  begin
   p.SaveToFile(fl);
   opendocument(fl);
  end;


End;

procedure TfrmAxMain.spShowResult2Click(Sender: TObject);
  var
  o : string;
  t : string;
  h : string;
  r : string;
  fl:string;
  p : TstringList;
begin
  //tbs_PageRes.show;
  h := '<html><body><table width="100%" border=0>' ;

  With DTTranslate do
  begin
    First;
    While not eof do
    begin
      o := FieldByName('book_paragraph').AsString;
      o := '<td width="50%" style="border: 1px solid #ddd;color:#404008;font-family:'+
           'Arial;padding:20px">' + o + '</td>' ;
      t := FieldByName('book_translate').AsString;
      t := '<td width="50%" style="color:#00007;font-family:'+
           'Arial;border: 1px solid #ddd;background-color:#FFFFFB;padding:20px"><b>' + t + '</b>'+
           '</td>' ;
      r := r + '<tr>' + o + t +'</tr>' ;
      next;
    end;
     h := h + r + '</table></body></html>' ;
    end;

  p := TStringList.create;
  p.text := h ;

  fl := ExtractFilePath(Application.ExeName) + 'files/doc/' + DTBook.FieldByName('judul').AsString + '_H.doc';
  if FileExists(fl) then
   begin
        if Dialogs.MessageDlg('File Hasil Translate Sudah Ada, Akan ditimpa ?',
        mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
        begin
          p.SaveToFile(fl);
          opendocument(fl);
        end
        else
          opendocument(fl);
  end
  else
  begin
   p.SaveToFile(fl);
   opendocument(fl);
  end;

end;

procedure TfrmAxMain.spTranslateAllClick(Sender: TObject);
begin

  mode :='all';
  pbProgress.Min:=0;
  pbProgress.Max:=DTTranslate.RecordCount;
  thrTranslateAI.Active:=True;
  FAxProgress.ShowModal;
end;

procedure TfrmAxMain.spTranslateClick(Sender: TObject);
begin

  mode :='one';

  thrTranslateAI.Active:=True;

end;

procedure TfrmAxMain.tbs_AIBrowserShow(Sender: TObject);
begin
    dbmEnglish.Width:=trunc(pnEditData.Width/2)-10;

end;

procedure TfrmAxMain.tbs_GridShow(Sender: TObject);
begin
  if DTGridRekap.Active=false then DTGridRekap.Open;
end;

procedure TfrmAxMain.tbs_HasilShow(Sender: TObject);
var
 nbook:string;
begin

  nbook := ExtractFilePath(Application.ExeName) + 'files\pdf\' +
  Trim(DTBook.FieldByName('judul').AsString) + '.pdf' ;

  if not FileExists(nbook) then
   begin
     ShowMessage('Belum Ada PDF Buku ini');
     tbs_Maker.show;
   end;

end;

procedure TfrmAxMain.thrTranslateAIRun(Sender: TIdThreadComponent);
begin
  if mode='one' then
  TranslateOne
  else if mode='all' then
  TranslateAll
  else if mode='prepare' then
  prepare;
end;

procedure TfrmAxMain.thrTranslateAITerminate(Sender: TIdThreadComponent);
begin
  //frmAxProgress.Close;
end;

function TfrmAxMain.AsktoGemini(s:string):string;
var
    json: TJSONData;
    content: string;
    Client: TFPHTTPClient;
    RequestBody: TMemoryStream;
    Response: TStringStream;
    QueryJSON: string;
    gemini_ac : string;
    ts_api:TStringList;
    i : integer;
begin

     // Persiapkan klien HTTP
    Client := TFPHTTPClient.Create(nil);
    Response := TStringStream.Create('');
    RequestBody := TMemoryStream.Create;

    if SINGLE_API_KEY='' then
    gemini_ac:= 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=' +
                getKey
    else
    gemini_ac:= 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=' +
                SINGLE_API_KEY;
                //api;

    s  := AnsiReplaceStr(s,':','\:');
    s  := AnsiReplaceStr(s,'''','\''');
    s  := AnsiReplaceStr(s,'"','\"');
    s  := AnsiReplaceStr(s,'{','\{');
    s  := AnsiReplaceStr(s,'}','\}');
    s  := AnsiReplaceStr(s,'[','\[');
    s  := AnsiReplaceStr(s,']','\]');
    s  := AnsiReplaceStr(s,'-','\-');
    s  := AnsiReplaceStr(s,',','\,');
    s  := AnsiReplaceStr(s,';','\;');
    s  := AnsiReplaceStr(s,';','\;');
    s  := AnsiReplaceStr(s,'”','\"');
    s  := AnsiReplaceStr(s,'“','\"');
    s  := AnsiReplaceStr(s,'’','\''');
    s  := AnsiReplaceStr(s,'—','\—');
    s  := AnsiReplaceStr(s,'-','');
    s  := AnsiReplaceStr(s,#13,'\n');

  //  —




    try
      // Persiapkan kueri dalam format JSON
      QueryJSON :=
        '{ '+
        '"contents": [{ '+
        '"parts": [{'+
        '"text": "'+ s + '" '+
        '}]'+
        '}] '+
        '}';
      RequestBody.Write(QueryJSON[1], Length(QueryJSON));
      RequestBody.Position := 0;

      Client.AddHeader('Content-Type', 'application/json');

      Client.RequestBody := RequestBody;
      Client.Post(gemini_ac, Response);

      // Tampilkan hasil respons
      json := GetJSON(Response.DataString) ;
      content := json.FindPath('candidates[0].content.parts[0].text').AsString;
      content := Trim(content);
      Result  := content;

    except
      on E: Exception do
      begin

      //  ShowMessage( 'Terdapat Error dalam Request yaitu : ' + e.Message + #13 + ', Coba Ulangi');
      //  thrd_Terjemah.Terminate;
       // tmr_ChatAI.Enabled:=false;
        Result := '-ERROR-';
      end;
    end;

  // Bebaskan sumber daya

    json.Free;
    Client.Free;
    Response.Free;
    RequestBody.Free;
   // thrTranslateAI.Active:=false
end;

function TfrmAxMain.RemoveEnter(const s: string): string;
var
  i: Integer;
  resultString: string;
begin
  resultString := '';
  for i := 1 to Length(s) do
  begin
    if not (s[i] in [#10, #13]) then
      resultString := resultString + s[i];
  end;
  Result := resultString;
end;

procedure TfrmAxMain.Initiate;
begin

  SINGLE_API_KEY:='';
  pgDoc.ShowTabs:=false;
  pgResult.ShowTabs:=false;


  FrmRes := TfrmBrowser.Create(self);
  FrmRes.Parent:= tbs_PageRes;
  FrmRes.BorderStyle:=bsnone;
  FrmRes.Align:=alClient;
  FrmRes.AddressPnl.hide;
  FrmRes.Show;

  FrmGem := TfrmBrowser.Create(self);
  FrmGem.Parent:= tbs_AIBrowser;
  FrmGem.BorderStyle:=bsnone;
  FrmGem.Align:=alClient;
  FrmGem.AddressPnl.hide;
  FrmGem.Show;


  FrmPDF := TfrmBrowser.Create(self);
  FrmPDF.Parent:= tbs_Hasil;
  FrmPDF.BorderStyle:=bsnone;
  FrmPDF.Align:=alClient;
  FrmPDF.AddressPnl.hide;
  FrmPDF.Show;

  FrmGrid := TfrmGrid.Create(self);
  FrmGrid.Parent:= tbs_Grid;
  FrmGrid.BorderStyle:=bsnone;
  FrmGrid.Align:=alClient;
  FrmGrid.Show;

  FKeyList := TfrmKeyList.create(self) ;

  FAxProgress := TfrmAxProgress.Create(self);

  FAbout := TfrmTentang.Create(self);

  FSplash := TfrmSplash.Create(self);



  pgDoc.Width:= Trunc(pnMain.Width/2) - 100;
  Koneksi.Database := ExtractFilePath(Application.ExeName) + 'support/axinemo.db';
  Koneksi.Protocol:='sqlite-3';
  koneksi.LibraryLocation:=  ExtractFilePath(Application.ExeName) + 'support/Sqlite3.dll';
  koneksi.Connect;

  DTBook.open;
  DTAPIKEY.open;
  DTPrompt.open;
  pgDoc.Visible:=false;
  FSplash.ShowModal;
  MarkPDF;
end;

procedure TfrmAxMain.StopAll;
begin
   thrTranslateAI.Terminate;
     FAxProgress.close;
end;
procedure TfrmAxMain.Progress;
begin

 With DTRekap do
  begin
    Filtered:=false;
    close;
    Prepared:=True;
    ParamByName('v_id').AsString:= DTBook.FieldByName('id').AsString;
    open;

    StatusBar1.Panels[1].Text:= 'Total : ' + FieldByName('j_t').AsString + ' :: ' +
                                'Selesai : ' + FieldByName('j_i').AsString + ' :: ' +
                                'On Progress : ' + FieldByName('j_k').AsString + ' :: ' +
                                'Error : ' + FieldByName('j_e').AsString ;

    if ( FieldByName('j_k').AsString<>'0' ) or
       ( FieldByName('j_e').AsString<>'0' ) then
    Koneksi.ExecuteDirect('update book set status=0 where id=' + DTBook.FieldByName('id').AsString)
    else
    Koneksi.ExecuteDirect('update book set status=1 where id=' + DTBook.FieldByName('id').AsString);

    DTBook.Refresh;

  end;
end;
procedure TfrmAxMain.BacaPosisiBaris;
begin
 StatusBar1.Panels[2].text := 'IDB : ' + DTBook.FieldByName('ID').AsString;
 StatusBar1.Panels[3].text := 'IDD : ' + DTTranslate.FieldByName('ID').AsString;
 StatusBar1.Panels[4].text := 'REC : ' + Inttostr(DTTranslate.RecNo);
end;

procedure TfrmAxMain.MarkPDF;
begin

 GRDBook.Columns[0].Width:=trunc(10/100*GRDBook.Width);
 GRDBook.Columns[1].Width:=trunc(80/100*GRDBook.Width);


 With DTBook do
  begin
    First;
    while not eof do
    begin
    if FileExists(ExtractFilePath(Application.ExeName) +
       'files/pdf/' + FieldByName('judul').AsString + '.pdf' ) then
       begin
         edit;
         FieldByName('pdf').AsString:='+';
         post;
       end
    else
       begin
         edit;
         FieldByName('pdf').AsString:='';
         post;

       end;
     next;
    end;
    DTBook.First;
    end;
 end;

procedure TfrmAxMain.TampilkanData;
var
  nbook:string;
begin

 pbPrepare.Position:=0;

 With DTBookIsi do
  begin
    close;
    Prepared:=True;
    ParamByName('var_id').AsString:= DTBook.FieldByName('ID').AsString;
    open;
  end;

  With DTTranslate do
  begin
    Filtered:=false;
    close;
    Prepared:=True;
    ParamByName('var_id').AsString:= DTBook.FieldByName('ID').AsString;
    open;
  end;

  tbs_GridRes.show;
  tbs_PageMemo.show;
  SpkToolbar1.TabIndex:=0;

  nbook := ExtractFilePath(Application.ExeName) + 'files\pdf\' + Trim(DTBook.FieldByName('judul').AsString) + '.pdf' ;

  if FileExists(nbook) then

  FrmPDF.Chromium1.LoadURL(nbook)
  else

  FrmPDF.Chromium1.LoadURL('about:blank');

  try
  Progress;
  except
  on e:exception do exit;
  end;


end;
procedure TfrmAxMain.GoBookByID(id:string);
begin
  DTBook.First;
  DTBook.Locate('id',id,[loPartialKey]);
  TampilkanData;
end;

end.

