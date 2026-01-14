unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, UnitTipos, UnitUsuario, 
  UnitVehiculo, UnitRegistro;

type
  TFormMain = class(TForm)
    PageControl1: TPageControl;
    TabSheetEntrada: TTabSheet;
    TabSheetSalida: TTabSheet;
    TabSheetConsulta: TTabSheet;
    LabelTitulo: TLabel;
    PanelEntrada: TPanel;
    LabelMatriculaEntrada: TLabel;
    EditMatriculaEntrada: TEdit;
    LabelCampus: TLabel;
    ComboBoxCampus: TComboBox;
    ButtonRegistrarEntrada: TButton;
    LabelLocalidadEntrada: TLabel;
    EditLocalidadEntrada: TEdit;
    MemoInfoEntrada: TMemo;
    PanelSalida: TPanel;
    LabelMatriculaSalida: TLabel;
    EditMatriculaSalida: TEdit;
    ButtonRegistrarSalida: TButton;
    MemoInfoSalida: TMemo;
    PanelConsulta: TPanel;
    ListBoxRegistros: TListBox;
    ButtonActualizarLista: TButton;
    MemoDetalleRegistro: TMemo;
    LabelRegistrosActivos: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonRegistrarEntradaClick(Sender: TObject);
    procedure ButtonRegistrarSalidaClick(Sender: TObject);
    procedure ButtonActualizarListaClick(Sender: TObject);
    procedure ComboBoxCampusChange(Sender: TObject);
    procedure ListBoxRegistrosClick(Sender: TObject);
  private
    FRegistros: TList;
    procedure InicializarComboBoxCampus;
    procedure ActualizarLocalidad;
    procedure ActualizarListaRegistros;
    function BuscarRegistroActivo(const AMatricula: string): TRegistro;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

{ TFormMain }

procedure TFormMain.FormCreate(Sender: TObject);
begin
  FRegistros := TList.Create;
  InicializarComboBoxCampus;
  PageControl1.ActivePageIndex := 0;
  
  // Información inicial
  MemoInfoEntrada.Lines.Add('Sistema de Gestión de Parking - Universidad de Zaragoza');
  MemoInfoEntrada.Lines.Add('');
  MemoInfoEntrada.Lines.Add('Instrucciones:');
  MemoInfoEntrada.Lines.Add('1. Ingrese la matrícula del vehículo');
  MemoInfoEntrada.Lines.Add('2. Seleccione el campus');
  MemoInfoEntrada.Lines.Add('3. Pulse "Registrar Entrada"');
  
  MemoInfoSalida.Lines.Add('Para registrar una salida:');
  MemoInfoSalida.Lines.Add('1. Ingrese la matrícula del vehículo');
  MemoInfoSalida.Lines.Add('2. Pulse "Registrar Salida"');
  MemoInfoSalida.Lines.Add('');
  MemoInfoSalida.Lines.Add('El sistema calculará automáticamente el tiempo de permanencia.');
end;

procedure TFormMain.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  // Liberar todos los registros
  for i := 0 to FRegistros.Count - 1 do
    TRegistro(FRegistros[i]).Free;
  FRegistros.Free;
end;

procedure TFormMain.InicializarComboBoxCampus;
begin
  ComboBoxCampus.Items.Clear;
  ComboBoxCampus.Items.Add(CampusToStr(cPlazaSanFrancisco));
  ComboBoxCampus.Items.Add(CampusToStr(cRioEbro));
  ComboBoxCampus.Items.Add(CampusToStr(cSanVicente));
  ComboBoxCampus.Items.Add(CampusToStr(cTeruel));
  ComboBoxCampus.ItemIndex := 0;
  ActualizarLocalidad;
end;

procedure TFormMain.ActualizarLocalidad;
var
  Campus: TCampus;
begin
  if ComboBoxCampus.ItemIndex < 0 then
    Exit;
    
  Campus := TCampus(ComboBoxCampus.ItemIndex);
  EditLocalidadEntrada.Text := LocalidadToStr(CampusToLocalidad(Campus));
end;

procedure TFormMain.ComboBoxCampusChange(Sender: TObject);
begin
  ActualizarLocalidad;
end;

procedure TFormMain.ButtonRegistrarEntradaClick(Sender: TObject);
var
  Registro: TRegistro;
  Matricula: string;
  Campus: TCampus;
begin
  Matricula := Trim(UpperCase(EditMatriculaEntrada.Text));
  
  if Matricula = '' then
  begin
    ShowMessage('Por favor, ingrese una matrícula válida.');
    EditMatriculaEntrada.SetFocus;
    Exit;
  end;
  
  // Verificar si ya existe un registro activo para esta matrícula
  if BuscarRegistroActivo(Matricula) <> nil then
  begin
    ShowMessage('El vehículo con matrícula ' + Matricula + ' ya está registrado en el parking.');
    Exit;
  end;
  
  Campus := TCampus(ComboBoxCampus.ItemIndex);
  
  // Crear nuevo registro
  Registro := TRegistro.Create;
  Registro.IDRegistro := FRegistros.Count + 1;
  Registro.RegistrarEntrada(Matricula, 0, Campus);
  FRegistros.Add(Registro);
  
  // Mostrar confirmación
  MemoInfoEntrada.Lines.Add('');
  MemoInfoEntrada.Lines.Add('=== ENTRADA REGISTRADA ===');
  MemoInfoEntrada.Lines.Add('Matrícula: ' + Matricula);
  MemoInfoEntrada.Lines.Add('Campus: ' + CampusToStr(Campus));
  MemoInfoEntrada.Lines.Add('Localidad: ' + LocalidadToStr(Registro.Localidad));
  MemoInfoEntrada.Lines.Add('Fecha: ' + DateToStr(Registro.FechaEntrada));
  MemoInfoEntrada.Lines.Add('Hora: ' + TimeToStr(Registro.HoraEntrada));
  MemoInfoEntrada.Lines.Add('========================');
  
  EditMatriculaEntrada.Clear;
  EditMatriculaEntrada.SetFocus;
  
  ShowMessage('Entrada registrada correctamente para el vehículo ' + Matricula);
end;

procedure TFormMain.ButtonRegistrarSalidaClick(Sender: TObject);
var
  Registro: TRegistro;
  Matricula: string;
begin
  Matricula := Trim(UpperCase(EditMatriculaSalida.Text));
  
  if Matricula = '' then
  begin
    ShowMessage('Por favor, ingrese una matrícula válida.');
    EditMatriculaSalida.SetFocus;
    Exit;
  end;
  
  // Buscar registro activo
  Registro := BuscarRegistroActivo(Matricula);
  
  if Registro = nil then
  begin
    ShowMessage('No se encontró un registro activo para el vehículo con matrícula ' + Matricula);
    Exit;
  end;
  
  // Registrar salida
  Registro.RegistrarSalida;
  
  // Mostrar información
  MemoInfoSalida.Lines.Add('');
  MemoInfoSalida.Lines.Add('=== SALIDA REGISTRADA ===');
  MemoInfoSalida.Lines.Add('Matrícula: ' + Matricula);
  MemoInfoSalida.Lines.Add('Campus: ' + CampusToStr(Registro.Campus));
  MemoInfoSalida.Lines.Add('Fecha salida: ' + DateToStr(Registro.FechaSalida));
  MemoInfoSalida.Lines.Add('Hora salida: ' + TimeToStr(Registro.HoraSalida));
  MemoInfoSalida.Lines.Add('Duración: ' + Registro.GetDuracionEstanciaStr);
  MemoInfoSalida.Lines.Add('=========================');
  
  EditMatriculaSalida.Clear;
  EditMatriculaSalida.SetFocus;
  
  ShowMessage('Salida registrada correctamente.' + #13#10 + 
              'Tiempo de permanencia: ' + Registro.GetDuracionEstanciaStr);
end;

procedure TFormMain.ButtonActualizarListaClick(Sender: TObject);
begin
  ActualizarListaRegistros;
end;

procedure TFormMain.ActualizarListaRegistros;
var
  i, RegistrosActivos: Integer;
  Registro: TRegistro;
begin
  ListBoxRegistros.Items.Clear;
  RegistrosActivos := 0;
  
  for i := 0 to FRegistros.Count - 1 do
  begin
    Registro := TRegistro(FRegistros[i]);
    if Registro.EstaActivo then
    begin
      ListBoxRegistros.Items.Add(Format('Matrícula: %s - Campus: %s - Entrada: %s %s',
        [Registro.Matricula, 
         CampusToStr(Registro.Campus),
         DateToStr(Registro.FechaEntrada),
         TimeToStr(Registro.HoraEntrada)]));
      Inc(RegistrosActivos);
    end;
  end;
  
  LabelRegistrosActivos.Caption := Format('Vehículos actualmente en parking: %d', 
    [RegistrosActivos]);
  
  if ListBoxRegistros.Items.Count > 0 then
    ListBoxRegistros.ItemIndex := 0;
    
  ListBoxRegistrosClick(nil);
end;

procedure TFormMain.ListBoxRegistrosClick(Sender: TObject);
var
  i, Index: Integer;
  Registro: TRegistro;
  RegistrosActivos: TList;
begin
  MemoDetalleRegistro.Clear;
  
  if ListBoxRegistros.ItemIndex < 0 then
    Exit;
  
  // Crear lista temporal de registros activos
  RegistrosActivos := TList.Create;
  try
    for i := 0 to FRegistros.Count - 1 do
    begin
      Registro := TRegistro(FRegistros[i]);
      if Registro.EstaActivo then
        RegistrosActivos.Add(Registro);
    end;
    
    Index := ListBoxRegistros.ItemIndex;
    if (Index >= 0) and (Index < RegistrosActivos.Count) then
    begin
      Registro := TRegistro(RegistrosActivos[Index]);
      MemoDetalleRegistro.Lines.Add('=== DETALLE DEL REGISTRO ===');
      MemoDetalleRegistro.Lines.Add('');
      MemoDetalleRegistro.Lines.Add('ID Registro: ' + IntToStr(Registro.IDRegistro));
      MemoDetalleRegistro.Lines.Add('Matrícula: ' + Registro.Matricula);
      MemoDetalleRegistro.Lines.Add('Campus: ' + CampusToStr(Registro.Campus));
      MemoDetalleRegistro.Lines.Add('Localidad: ' + LocalidadToStr(Registro.Localidad));
      MemoDetalleRegistro.Lines.Add('');
      MemoDetalleRegistro.Lines.Add('Fecha entrada: ' + DateToStr(Registro.FechaEntrada));
      MemoDetalleRegistro.Lines.Add('Hora entrada: ' + TimeToStr(Registro.HoraEntrada));
      MemoDetalleRegistro.Lines.Add('');
      MemoDetalleRegistro.Lines.Add('Tiempo transcurrido: ' + Registro.GetDuracionEstanciaStr);
      MemoDetalleRegistro.Lines.Add('');
      MemoDetalleRegistro.Lines.Add('Estado: ACTIVO (en parking)');
    end;
  finally
    RegistrosActivos.Free;
  end;
end;

function TFormMain.BuscarRegistroActivo(const AMatricula: string): TRegistro;
var
  i: Integer;
  Registro: TRegistro;
begin
  Result := nil;
  for i := 0 to FRegistros.Count - 1 do
  begin
    Registro := TRegistro(FRegistros[i]);
    if (UpperCase(Registro.Matricula) = UpperCase(AMatricula)) and 
       Registro.EstaActivo then
    begin
      Result := Registro;
      Break;
    end;
  end;
end;

end.
