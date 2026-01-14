program ParkingUnizar;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {FormMain},
  UnitTipos in 'UnitTipos.pas',
  UnitUsuario in 'UnitUsuario.pas',
  UnitVehiculo in 'UnitVehiculo.pas',
  UnitRegistro in 'UnitRegistro.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Sistema de Gestión de Parking - UNIZAR';
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
