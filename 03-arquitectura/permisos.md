# Modelo inicial de permisos

Esta matriz es una propuesta técnica pendiente de validación operacional.

| Capacidad | Admin | Investigador principal | Médico investigador | Enfermería | Coordinador | Auditor |
|---|---:|---:|---:|---:|---:|---:|
| Administrar cuentas y roles | Sí | No | No | No | No | No |
| Configurar institución | Sí | No | No | No | No | No |
| Crear/editar estudio | Configurable | Sí | No | No | Sí | No |
| Aprobar versión vigente | No por defecto | Sí | No | No | Preparar | No |
| Registrar paciente | No por defecto | Sí | Sí | Configurable | Configurable | No |
| Ejecutar preselección manual | No | Sí | Sí | Configurable | Configurable | No |
| Gestionar cupos/lista | No | Sí | Consulta | Sí | Sí | No |
| Ver auditoría | Administración | Estudios propios | Casos propios | Casos asignados | Estudios asignados | Alcance autorizado |

## Regla de aplicación

Un rol no concede acceso global automáticamente. La autorización debe combinar acción, institución/unidad y relación con el recurso. Las denegaciones se prueban explícitamente en backend.
