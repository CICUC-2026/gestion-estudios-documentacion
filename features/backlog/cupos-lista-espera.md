# Feature — Cupos y lista de espera

**Estado:** backlog  
**Tanda:** 5

## Objetivo

Administrar cupos por estudio y brazo, su fuente, confirmación, vigencia e historial. Mantener una lista de espera con prioridad exclusivamente operativa y cambios justificados.

## Dependencias

- HU-004 permisos y alcances;
- HU-005 estudios;
- HU-014 asociación paciente-estudio;
- HU-017 estados validados;
- reglas operativas de fuente, vigencia, reserva y prioridad aprobadas por CICUC.

## HUs

- HU-019 — Mantener cupos con fuente e historial.
- HU-020 — Gestionar lista de espera operativa.

## Contratos

- tentativo nunca se presenta como confirmado;
- estado visible siempre incluye fuente, responsable y antigüedad;
- prioridad y orden son operativos, no recomendación clínica;
- cambios y cierres conservan historial y motivo.

Los cupos tentativos no se muestran como confirmados y la prioridad no representa recomendación clínica.
