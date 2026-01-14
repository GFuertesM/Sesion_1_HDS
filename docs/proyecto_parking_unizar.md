# Sistema de Gestión de Plazas de Parking - Universidad de Zaragoza

## Descripción del Proyecto

Sistema desarrollado en Delphi para la gestión de plazas de parking en los diferentes campus de la Universidad de Zaragoza (Unizar).

## Objetivo

Controlar y administrar el uso de las plazas de parking disponibles en los diferentes campus universitarios, registrando la información de los usuarios, vehículos y el tiempo de permanencia.

## Funcionalidades Principales

### 1. Gestión de Usuarios
- Registro de usuarios autorizados para utilizar el parking
- Almacenamiento de datos personales del usuario
- Vinculación con vehículos

### 2. Gestión de Vehículos
- Registro de vehículos asociados a usuarios
- Almacenamiento de matrícula del vehículo
- Información del tipo de vehículo

### 3. Control de Acceso
- Registro de fecha y hora de entrada
- Registro de fecha y hora de salida
- Cálculo automático del tiempo de permanencia

### 4. Gestión de Campus
- Control de diferentes campus de Unizar:
  - Campus Plaza San Francisco
  - Campus Río Ebro
  - Campus San Vicente
- Gestión de localidades donde se encuentran los campus

## Entidades del Sistema

### Usuario
- ID Usuario
- Nombre
- Apellidos
- DNI/NIE
- Email
- Teléfono
- Tipo de usuario (Estudiante, Personal Docente, Personal Administrativo)

### Vehículo
- ID Vehículo
- Matrícula
- Marca
- Modelo
- Color
- Tipo (Coche, Moto, Bicicleta)
- ID Usuario (propietario)

### Registro de Entrada/Salida
- ID Registro
- ID Vehículo
- Matrícula
- Fecha de Entrada
- Hora de Entrada
- Fecha de Salida
- Hora de Salida
- Campus
- Localidad
- Duración de estancia

### Campus
Enumeración de campus disponibles:
- Campus Plaza San Francisco (Zaragoza)
- Campus Río Ebro (Zaragoza)
- Campus San Vicente (Huesca)
- Campus de Teruel (Teruel)

### Localidad
Ciudades donde se ubican los campus:
- Zaragoza
- Huesca
- Teruel

## Estructura del Proyecto

```
/docs
  └── proyecto_parking_unizar.md  (Este archivo)
  
/src
  ├── ParkingUnizar.dpr           (Proyecto principal)
  ├── UnitMain.pas                (Formulario principal)
  ├── UnitMain.dfm                (Diseño del formulario)
  ├── UnitUsuario.pas             (Clase Usuario)
  ├── UnitVehiculo.pas            (Clase Vehículo)
  ├── UnitRegistro.pas            (Clase Registro de entrada/salida)
  └── UnitTipos.pas               (Tipos y enumeraciones)
```

## Tecnología

- **Lenguaje**: Object Pascal (Delphi)
- **IDE**: Delphi (versiones 7 o superiores)
- **Plataforma**: Windows
- **Base de datos**: Implementación futura (SQLite, MySQL, o archivos)

## Requisitos del Sistema

- Windows 7 o superior
- Delphi 7 o versiones superiores instalado
- 512 MB RAM mínimo
- 100 MB de espacio en disco

## Instalación y Compilación

1. Abrir el archivo `ParkingUnizar.dpr` en Delphi
2. Compilar el proyecto (Project → Compile)
3. Ejecutar (Run → Run)

## Uso del Sistema

### Inicio de Sesión
1. Ejecutar la aplicación
2. Acceder con credenciales de administrador

### Registro de Entrada
1. Seleccionar campus
2. Ingresar matrícula del vehículo
3. Confirmar entrada (se registra automáticamente fecha y hora)

### Registro de Salida
1. Ingresar matrícula del vehículo
2. Confirmar salida (se registra automáticamente fecha y hora)
3. El sistema calcula el tiempo de permanencia

### Consultas
- Listado de vehículos actualmente en el parking
- Historial de entradas/salidas
- Estadísticas de uso por campus
- Reportes de ocupación

## Mejoras Futuras

- Integración con base de datos
- Sistema de reservas de plazas
- Control de pago por estacionamiento
- Interfaz web para consultas
- Aplicación móvil para usuarios
- Sistema de barreras automáticas
- Reconocimiento automático de matrículas (OCR)
- Notificaciones push a usuarios
- Estadísticas avanzadas y reportes

## Autores

Proyecto desarrollado para la asignatura de Herramientas de Desarrollo de Software (HDS)
Universidad de Zaragoza

## Licencia

Proyecto académico - Universidad de Zaragoza
