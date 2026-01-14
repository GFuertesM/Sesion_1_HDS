unit UnitVehiculo;

interface

uses
  UnitTipos, SysUtils;

type
  TVehiculo = class
  private
    FIDVehiculo: Integer;
    FMatricula: string;
    FMarca: string;
    FModelo: string;
    FColor: string;
    FTipoVehiculo: TTipoVehiculo;
    FIDUsuario: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    
    // Propiedades
    property IDVehiculo: Integer read FIDVehiculo write FIDVehiculo;
    property Matricula: string read FMatricula write FMatricula;
    property Marca: string read FMarca write FMarca;
    property Modelo: string read FModelo write FModelo;
    property Color: string read FColor write FColor;
    property TipoVehiculo: TTipoVehiculo read FTipoVehiculo write FTipoVehiculo;
    property IDUsuario: Integer read FIDUsuario write FIDUsuario;
    
    // Métodos
    function ToString: string;
    function EsValido: Boolean;
    function GetDescripcion: string;
  end;

implementation

{ TVehiculo }

constructor TVehiculo.Create;
begin
  inherited Create;
  FIDVehiculo := 0;
  FMatricula := '';
  FMarca := '';
  FModelo := '';
  FColor := '';
  FTipoVehiculo := tvCoche;
  FIDUsuario := 0;
end;

destructor TVehiculo.Destroy;
begin
  inherited Destroy;
end;

function TVehiculo.ToString: string;
begin
  Result := Format('Vehículo: %s - %s %s (%s) - Tipo: %s', 
    [FMatricula, FMarca, FModelo, FColor, TipoVehiculoToStr(FTipoVehiculo)]);
end;

function TVehiculo.EsValido: Boolean;
begin
  Result := (Trim(FMatricula) <> '') and (Length(Trim(FMatricula)) >= 4);
end;

function TVehiculo.GetDescripcion: string;
begin
  Result := Format('%s %s', [FMarca, FModelo]);
  if Result = ' ' then
    Result := 'Vehículo sin descripción';
end;

end.
