unit UnitUsuario;

interface

uses
  UnitTipos, SysUtils;

type
  TUsuario = class
  private
    FIDUsuario: Integer;
    FNombre: string;
    FApellidos: string;
    FDNI: string;
    FEmail: string;
    FTelefono: string;
    FTipoUsuario: TTipoUsuario;
  public
    constructor Create;
    destructor Destroy; override;
    
    // Propiedades
    property IDUsuario: Integer read FIDUsuario write FIDUsuario;
    property Nombre: string read FNombre write FNombre;
    property Apellidos: string read FApellidos write FApellidos;
    property DNI: string read FDNI write FDNI;
    property Email: string read FEmail write FEmail;
    property Telefono: string read FTelefono write FTelefono;
    property TipoUsuario: TTipoUsuario read FTipoUsuario write FTipoUsuario;
    
    // Métodos
    function GetNombreCompleto: string;
    function ToString: string;
    function EsValido: Boolean;
  end;

implementation

{ TUsuario }

constructor TUsuario.Create;
begin
  inherited Create;
  FIDUsuario := 0;
  FNombre := '';
  FApellidos := '';
  FDNI := '';
  FEmail := '';
  FTelefono := '';
  FTipoUsuario := tuEstudiante;
end;

destructor TUsuario.Destroy;
begin
  inherited Destroy;
end;

function TUsuario.GetNombreCompleto: string;
begin
  Result := Trim(FNombre + ' ' + FApellidos);
end;

function TUsuario.ToString: string;
begin
  Result := Format('Usuario: %s - DNI: %s - Tipo: %s', 
    [GetNombreCompleto, FDNI, TipoUsuarioToStr(FTipoUsuario)]);
end;

function TUsuario.EsValido: Boolean;
begin
  Result := (Trim(FNombre) <> '') and 
            (Trim(FApellidos) <> '') and 
            (Trim(FDNI) <> '');
end;

end.
