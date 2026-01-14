unit UnitTipos;

interface

type
  // Enumeración de tipos de usuario
  TTipoUsuario = (tuEstudiante, tuDocentePDI, tuAdministrativoPAS, tuVisitante);

  // Enumeración de tipos de vehículo
  TTipoVehiculo = (tvCoche, tvMoto, tvBicicleta, tvPatinete);

  // Enumeración de campus de Unizar
  TCampus = (cPlazaSanFrancisco, cRioEbro, cSanVicente, cTeruel);

  // Enumeración de localidades
  TLocalidad = (lZaragoza, lHuesca, lTeruel);

// Funciones auxiliares para convertir enumeraciones a strings
function TipoUsuarioToStr(ATipo: TTipoUsuario): string;
function TipoVehiculoToStr(ATipo: TTipoVehiculo): string;
function CampusToStr(ACampus: TCampus): string;
function LocalidadToStr(ALocalidad: TLocalidad): string;

// Funciones para obtener la localidad de un campus
function CampusToLocalidad(ACampus: TCampus): TLocalidad;

implementation

function TipoUsuarioToStr(ATipo: TTipoUsuario): string;
begin
  case ATipo of
    tuEstudiante:       Result := 'Estudiante';
    tuDocentePDI:       Result := 'Personal Docente (PDI)';
    tuAdministrativoPAS: Result := 'Personal Administrativo (PAS)';
    tuVisitante:        Result := 'Visitante';
  else
    Result := 'Desconocido';
  end;
end;

function TipoVehiculoToStr(ATipo: TTipoVehiculo): string;
begin
  case ATipo of
    tvCoche:     Result := 'Coche';
    tvMoto:      Result := 'Moto';
    tvBicicleta: Result := 'Bicicleta';
    tvPatinete:  Result := 'Patinete';
  else
    Result := 'Desconocido';
  end;
end;

function CampusToStr(ACampus: TCampus): string;
begin
  case ACampus of
    cPlazaSanFrancisco: Result := 'Campus Plaza San Francisco';
    cRioEbro:           Result := 'Campus Río Ebro';
    cSanVicente:        Result := 'Campus San Vicente';
    cTeruel:            Result := 'Campus de Teruel';
  else
    Result := 'Desconocido';
  end;
end;

function LocalidadToStr(ALocalidad: TLocalidad): string;
begin
  case ALocalidad of
    lZaragoza: Result := 'Zaragoza';
    lHuesca:   Result := 'Huesca';
    lTeruel:   Result := 'Teruel';
  else
    Result := 'Desconocida';
  end;
end;

function CampusToLocalidad(ACampus: TCampus): TLocalidad;
begin
  case ACampus of
    cPlazaSanFrancisco,
    cRioEbro:    Result := lZaragoza;
    cSanVicente: Result := lHuesca;
    cTeruel:     Result := lTeruel;
  else
    Result := lZaragoza;
  end;
end;

end.
