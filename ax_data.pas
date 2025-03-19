unit ax_data;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, RxDBGrid,
  ZAbstractRODataset, ZDataset, DBGrids;

type

  { TfrmGrid }

  TfrmGrid = class(TForm)
    RxDBGrid1: TRxDBGrid;
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1TitleClick(Column: TColumn);
  private
  procedure SortirSesuaiKolomQuery(d:TZQuery;k:string)  ;
  public

  end;

var
  frmGrid: TfrmGrid;
  st : TFSortType;
implementation

uses ax_main;

{$R *.lfm}

procedure TfrmGrid.RxDBGrid1TitleClick(Column: TColumn);
begin
  SortirSesuaiKolomQuery(frmAxMain.DTGridRekap,Column.FieldName);
end;

procedure TfrmGrid.RxDBGrid1DblClick(Sender: TObject);
begin
  frmAxMain.GoBookByID(frmAxMain.DTGridRekap.FieldByName('ID').AsString);
  frmAxMain.tbs_Maker.Show;
end;

procedure TfrmGrid.SortirSesuaiKolomQuery(d:TZQuery;k:string)  ;
begin

   st := d.SortType;

   d.SortedFields:= QuotedStr( k);

   if st=stAscending  then
     d.SortType:= stDescending
     else
     d.SortType := stAscending;

  d.First;

end;

end.

