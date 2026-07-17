# Modelo de datos conceptual

## Núcleos

- Institución y unidad clínica.
- Usuario, rol, permiso y alcance.
- Estudio, responsables, versión de protocolo, criterio y documento.
- Paciente, dato identificatorio, dato clínico y fuente.
- Asociación paciente-estudio, preselección y evaluación de criterio.
- Cupo, lista de espera, tarea, comité y notificación.
- Historial de estado y registro de auditoría.

## Relaciones esenciales

- una institución contiene unidades; una unidad gestiona estudios y usuarios autorizados;
- un estudio tiene muchas versiones, pero solo una puede estar vigente;
- una versión tiene muchos criterios inmutables cuando deja de ser borrador;
- un paciente se asocia a muchos estudios mediante una entidad explícita;
- una preselección pertenece a una asociación y versión determinadas;
- cada evaluación corresponde a un criterio de esa versión;
- cupos y listas de espera pertenecen a estudio y, cuando aplica, brazo;
- historial y auditoría referencian entidad, autor, instante y contexto.

## Invariantes de implementación

- identificadores UUID;
- fechas almacenadas con zona horaria;
- restricciones e índices definidos en base de datos además de validación de aplicación;
- eliminación lógica mediante estado y fecha;
- cambios sensibles ejecutados dentro de transacciones;
- datos identificatorios consultables por separado de los datos operativos.

El diagrama físico se completará antes de la primera migración del dominio correspondiente.
