# Feature — Preselección manual

**Estado:** backlog  
**Tanda:** 4

## Objetivo

Relacionar un paciente con un estudio y registrar la revisión manual de criterios contra una versión específica del protocolo.

## Dependencias bloqueantes

- HU-004 y Issue #5: roles, capacidades y alcances.
- ADR-007 e Issue #6: tratamiento de datos de pacientes.
- HU-005 a HU-008: estudio, versiones, criterios y versión vigente.
- HU-010/HU-011: paciente mínimo y consulta autorizada.
- validación clínica de estados y transiciones descritos en `04-flujos/preseleccion.md`.

## HUs propuestas

- HU-014 — Asociar un paciente con un estudio.
- HU-015 — Crear una preselección manual ligada a versión.
- HU-016 — Evaluar manualmente criterios.
- HU-017 — Gestionar estados, cierre y reapertura.
- HU-018 — Elaborar y confirmar un resumen manual.

## Contratos

- cada evaluación conserva la versión exacta utilizada;
- una nueva versión no reescribe evaluaciones anteriores;
- cada marca de criterio tiene profesional, fecha, comentario y evidencia/fuente cuando corresponda;
- el sistema no emite elegibilidad ni completa criterios automáticamente;
- cerrar vuelve inmutable la evaluación hasta una reapertura autorizada y auditada.

El sistema puede mostrar información pendiente y posibles barreras, pero nunca emitir elegibilidad o una recomendación clínica automática.
