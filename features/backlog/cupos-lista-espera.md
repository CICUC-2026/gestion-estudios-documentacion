# Feature — Cupos y lista de espera

**Estado:** demo sintética lista; alcance real bloqueado  
**Tanda:** 5

## Objetivo

Administrar cupos por estudio y brazo, su fuente, confirmación, vigencia e historial. Mantener una lista de espera con prioridad exclusivamente operativa y cambios justificados.

## Dependencias

- HU-004 permisos y HU-005 estudios: implementadas;
- HU-014 asociación paciente-estudio;
- HU-017 estados validados;
- reglas operativas de fuente, vigencia, reserva y prioridad aprobadas por CICUC.

ADR-008 aprueba para la demo sintética estados separados y vigencia configurable; HU-042 puede implementarse sin desbloquear el alcance real.

## HUs

- HU-019 — Mantener cupos con fuente e historial.
- HU-020 — Gestionar lista de espera operativa.
- HU-042 — Gestionar cupos y reservas sintéticas: lista.

## Contratos

- tentativo nunca se presenta como confirmado;
- estado visible siempre incluye fuente, responsable y antigüedad;
- prioridad y orden son operativos, no recomendación clínica;
- cambios y cierres conservan historial y motivo.

Los cupos tentativos no se muestran como confirmados y la prioridad no representa recomendación clínica.
