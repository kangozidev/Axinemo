program axinemo;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, tachartlazaruspkg, openssl, rxnew, indylaz, ax_main, ubrowser, uabout,
  uCEFApplication, zcomponent, ui_progres, ax_keylist, ulo_splash, ax_data
  { you can add units after this };

{$R *.res}

begin

  GlobalCEFApp := TCefApplication.Create;
  GlobalCEFApp.EnableGPU:=true;
  GlobalCEFApp.PersistSessionCookies:=true;
  GlobalCEFApp.MultiThreadedMessageLoop:=true;
  GlobalCEFApp.UserAgent            :='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) ';//Chrome/118.0.0.0 Safari/537.36';
  GlobalCEFApp.FrameworkDirPath     := 'support\cef';
  GlobalCEFApp.ResourcesDirPath     := 'support\cef';
  GlobalCEFApp.Cache                := 'support\cache';
  GlobalCEFApp.LocalesDirPath       := 'support\cef\locales';



  if GlobalCEFApp.StartMainProcess then
    begin
      RequireDerivedFormResource:=True;
      Application.Title:='Axinemo ( Penerjemah )';
      Application.Scaled:=True;
      Application.Initialize;
      Application.CreateForm(TfrmAxMain, frmAxMain);
      Application.CreateForm(TfrmTentang, frmTentang);
      Application.CreateForm(TfrmAxProgress, frmAxProgress);
      Application.CreateForm(TfrmKeyList, frmKeyList);
      Application.CreateForm(TfrmGrid, frmGrid);
      Application.Run;
    end;

  GlobalCEFApp.Free;
  GlobalCEFApp := nil;



end.

