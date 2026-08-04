# Modelo inicial de permisos

Esta matriz es una propuesta técnica pendiente de validación operacional.

## Decisión vigente para la demo sintética

ADR-008 autoriza al administrador del sistema a ejecutar todas las capacidades sobre recursos sintéticos. El backend conserva permisos separados y auditoría. Esta apertura no autoriza acceso global cuando existan pacientes reales.

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

Asignación provisional de demo: médico registra y revisa; investigador confirma, cierra y reabre; enfermería gestiona cupos/lista; coordinador gestiona tareas y comités; auditor mantiene solo lectura. El administrador puede intervenir excepcionalmente en todas ellas con auditoría.

## Regla de aplicación

Un rol no concede acceso global automáticamente. La autorización debe combinar acción, institución/unidad y relación con el recurso. Las denegaciones se prueban explícitamente en backend.
