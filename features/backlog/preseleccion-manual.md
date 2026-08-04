# Feature — Preselección manual

**Estado:** demo sintética lista; alcance real bloqueado  
**Tanda:** 4

## Objetivo

Relacionar un paciente con un estudio y registrar la revisión manual de criterios contra una versión específica del protocolo.

## Dependencias bloqueantes

- HU-004 está implementada; Issue #5 mantiene pendiente la validación institucional de roles y alcances clínicos.
- ADR-007 e Issue #6: tratamiento de datos de pacientes.
- HU-005 a HU-008: implementadas y verificadas.
- HU-010/HU-011: paciente mínimo y consulta autorizada.
- validación clínica de estados y transiciones descritos en `04-flujos/preseleccion.md`.

La asociación sintética de HU-038 sirve solo para demostración administrativa y no constituye HU-014 ni una preselección clínica. ADR-008 permite desarrollar HU-041 como flujo sintético independiente.

## HUs propuestas

- HU-014 — Asociar un paciente con un estudio.
- HU-015 — Crear una preselección manual ligada a versión.
- HU-016 — Evaluar manualmente criterios.
- HU-017 — Gestionar estados, cierre y reapertura.
- HU-018 — Elaborar y confirmar un resumen manual.
- HU-041 — Gestionar preselección manual sintética: lista.

## Contratos

- cada evaluación conserva la versión exacta utilizada;
- una nueva versión no reescribe evaluaciones anteriores;
- cada marca de criterio tiene profesional, fecha, comentario y evidencia/fuente cuando corresponda;
- el sistema no emite elegibilidad ni completa criterios automáticamente;
- cerrar vuelve inmutable la evaluación hasta una reapertura autorizada y auditada.

El sistema puede mostrar información pendiente y posibles barreras, pero nunca emitir elegibilidad o una recomendación clínica automática.
