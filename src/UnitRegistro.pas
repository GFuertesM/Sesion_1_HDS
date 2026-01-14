unit UnitRegistro;

interface

uses
  UnitTipos, SysUtils, DateUtils;

type
  TRegistro = class
  private
    FIDRegistro: Integer;
    FIDVehiculo: Integer;
    FMatricula: string;
    FFechaEntrada: TDateTime;
    FHoraEntrada: TDateTime;
    FFechaSalida: TDateTime;
    FHoraSalida: TDateTime;
    FCampus: TCampus;
    FLocalidad: TLocalidad;
  public
    constructor Create;
    destructor Destroy; override;
    
    // Propiedades
    property IDRegistro: Integer read FIDRegistro write FIDRegistro;
    property IDVehiculo: Integer read FIDVehiculo write FIDVehiculo;
    property Matricula: string read FMatricula write FMatricula;
    property FechaEntrada: TDateTime read FFechaEntrada write FFechaEntrada;
    property HoraEntrada: TDateTime read FHoraEntrada write FHoraEntrada;
    property FechaSalida: TDateTime read FFechaSalida write FFechaSalida;
    property HoraSalida: TDateTime read FHoraSalida write FHoraSalida;
    property Campus: TCampus read FCampus write FCampus;
    property Localidad: TLocalidad read FLocalidad write FLocalidad;
    
    // Métodos
    procedure RegistrarEntrada(const AMatricula: string; AIDVehiculo: Integer; 
                               ACampus: TCampus);
    procedure RegistrarSalida;
    function GetDuracionEstancia: Int64; // Retorna minutos
    function GetDuracionEstanciaStr: string;
    function EstaActivo: Boolean;
    function ToString: string;
    function GetFechaHoraEntrada: TDateTime;
    function GetFechaHoraSalida: TDateTime;
  end;

implementation

{ TRegistro }

constructor TRegistro.Create;
begin
  inherited Create;
  FIDRegistro := 0;
  FIDVehiculo := 0;
  FMatricula := '';
  FFechaEntrada := 0;
  FHoraEntrada := 0;
  FFechaSalida := 0;
  FHoraSalida := 0;
  FCampus := cPlazaSanFrancisco;
  FLocalidad := lZaragoza;
end;

destructor TRegistro.Destroy;
begin
  inherited Destroy;
end;

procedure TRegistro.RegistrarEntrada(const AMatricula: string; 
  AIDVehiculo: Integer; ACampus: TCampus);
var
  AhoraCompleto: TDateTime;
begin
  AhoraCompleto := Now;
  FMatricula := AMatricula;
  FIDVehiculo := AIDVehiculo;
  FFechaEntrada := Trunc(AhoraCompleto);  // Solo la fecha
  FHoraEntrada := Frac(AhoraCompleto);     // Solo la hora
  FCampus := ACampus;
  FLocalidad := CampusToLocalidad(ACampus);
  FFechaSalida := 0;
  FHoraSalida := 0;
end;

procedure TRegistro.RegistrarSalida;
var
  AhoraCompleto: TDateTime;
begin
  AhoraCompleto := Now;
  FFechaSalida := Trunc(AhoraCompleto);  // Solo la fecha
  FHoraSalida := Frac(AhoraCompleto);     // Solo la hora
end;

function TRegistro.GetDuracionEstancia: Int64;
var
  FechaHoraEntrada, FechaHoraSalida: TDateTime;
begin
  Result := 0;
  if FFechaEntrada = 0 then
    Exit;
    
  FechaHoraEntrada := FFechaEntrada + FHoraEntrada;
  
  if FFechaSalida = 0 then
    FechaHoraSalida := Now
  else
    FechaHoraSalida := FFechaSalida + FHoraSalida;
  
  Result := MinutesBetween(FechaHoraSalida, FechaHoraEntrada);
end;

function TRegistro.GetDuracionEstanciaStr: string;
var
  Minutos, Horas, Dias: Int64;
begin
  Minutos := GetDuracionEstancia;
  Dias := Minutos div (24 * 60);
  Minutos := Minutos mod (24 * 60);
  Horas := Minutos div 60;
  Minutos := Minutos mod 60;
  
  if Dias > 0 then
    Result := Format('%d día(s), %d hora(s), %d minuto(s)', [Dias, Horas, Minutos])
  else if Horas > 0 then
    Result := Format('%d hora(s), %d minuto(s)', [Horas, Minutos])
  else
    Result := Format('%d minuto(s)', [Minutos]);
end;

function TRegistro.EstaActivo: Boolean;
begin
  Result := (FFechaEntrada > 0) and (FFechaSalida = 0);
end;

function TRegistro.ToString: string;
begin
  Result := Format('Registro #%d - Matrícula: %s - Campus: %s - Localidad: %s', 
    [FIDRegistro, FMatricula, CampusToStr(FCampus), LocalidadToStr(FLocalidad)]);
  Result := Result + #13#10 + Format('  Entrada: %s %s', 
    [DateToStr(FFechaEntrada), TimeToStr(FHoraEntrada)]);
  if FFechaSalida > 0 then
    Result := Result + #13#10 + Format('  Salida: %s %s - Duración: %s', 
      [DateToStr(FFechaSalida), TimeToStr(FHoraSalida), GetDuracionEstanciaStr])
  else
    Result := Result + #13#10 + '  Salida: (Aún en parking)';
end;

function TRegistro.GetFechaHoraEntrada: TDateTime;
begin
  Result := FFechaEntrada + FHoraEntrada;
end;

function TRegistro.GetFechaHoraSalida: TDateTime;
begin
  if FFechaSalida > 0 then
    Result := FFechaSalida + FHoraSalida
  else
    Result := 0;
end;

end.
