# Sesion_1_HDS - Sistema de Gestión de Parking UNIZAR

Repositorio de prueba para la práctica de la primera sesión de HDS

## Descripción

Proyecto en Delphi para la gestión de plazas de parking en la Universidad de Zaragoza (Unizar). El sistema permite registrar entradas y salidas de vehículos, gestionar usuarios, vehículos, y controlar el acceso a diferentes campus universitarios.

## Estructura del Proyecto

```
/docs
  └── proyecto_parking_unizar.md  - Documentación completa del proyecto
  
/src
  ├── ParkingUnizar.dpr           - Proyecto principal de Delphi
  ├── ParkingUnizar.dof           - Configuración del proyecto
  ├── UnitMain.pas/dfm            - Formulario principal de la aplicación
  ├── UnitTipos.pas               - Definiciones de tipos y enumeraciones
  ├── UnitUsuario.pas             - Clase para gestión de usuarios
  ├── UnitVehiculo.pas            - Clase para gestión de vehículos
  └── UnitRegistro.pas            - Clase para registros de entrada/salida
```

## Funcionalidades

- ✅ Registro de entrada de vehículos con matrícula, campus y localidad
- ✅ Registro de salida con cálculo automático de duración de estancia
- ✅ Consulta de vehículos actualmente en el parking
- ✅ Gestión de múltiples campus (Plaza San Francisco, Río Ebro, San Vicente, Teruel)
- ✅ Separación de fecha y hora para entrada y salida
- ✅ Asignación automática de localidad según el campus seleccionado

## Entidades Gestionadas

- **Usuario**: Nombre, Apellidos, DNI, Email, Teléfono, Tipo de usuario
- **Vehículo**: Matrícula, Marca, Modelo, Color, Tipo de vehículo
- **Registro**: Fecha de Entrada, Hora de Entrada, Fecha de Salida, Hora de Salida
- **Campus**: Plaza San Francisco, Río Ebro, San Vicente, Teruel
- **Localidad**: Zaragoza, Huesca, Teruel

## Requisitos

- Delphi 7 o superior
- Windows 7 o superior

## Compilación

1. Abrir `src/ParkingUnizar.dpr` en Delphi
2. Compilar el proyecto (Project → Compile)
3. Ejecutar (Run → Run)

## Documentación

Para más información, consultar el archivo `/docs/proyecto_parking_unizar.md` que contiene la documentación completa del proyecto.

## Autor

Repositorio creado por el agente y por Gabriel Fuertes.