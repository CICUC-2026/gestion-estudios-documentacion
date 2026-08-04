# HU-020 — Gestionar lista de espera operativa

**Tipo:** historia-usuario  
**Actor:** enfermeria  
**Estado:** propuesta  
**Bloqueada por:** HU-014, HU-017, HU-019 y validación operacional de prioridad/orden  
**Última actualización:** 2026-08-04  
**Feature relacionada:** [Cupos y lista de espera](../../features/backlog/cupos-lista-espera.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/23  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **enfermera coordinadora**, quiero mantener una lista de espera con prioridad y orden operativos para organizar revisiones cuando cambie la disponibilidad.

## Criterios de aceptación

- [ ] Registro pertenece a asociación paciente-estudio y puede indicar brazo/cupo.
- [ ] Registra ingreso, motivo, responsable, información faltante, última/próxima revisión y estado.
- [ ] Prioridad y orden muestran explícitamente “operativo”.
- [ ] Cambiar prioridad u orden exige motivo y queda auditado.
- [ ] Vincular un cupo no reserva, asigna ni notifica automáticamente.
- [ ] Cierre conserva razón, fecha y autor.
- [ ] Lista usa identificación minimizada y alcance backend.

## Impacto sobre funcionalidades existentes

| Área | Riesgo | Protección |
|---|---|---|
| Pacientes/preselección | Alto | FK, mínimo dato y estados |
| Cupos | Alto | Vínculo sin mutación automática |
| Auditoría | Alto | Historial de prioridad/orden |

## Contratos que deben preservarse

- Prioridad no es recomendación clínica.
- Orden manual justificado y auditable.
- Sin reserva o cambio de estado implícito.
- Identidad minimizada.

## No alcance

- asignación de cupo;
- ranking automático;
- notificación externa;
- resultado de screening.

## Riesgo clínico/legal

El orden puede ser interpretado como prioridad clínica. Terminología, permisos y motivos deben validarse con usuarios.

## Código relacionado

- `gestion-estudios-backend/app/dominios/listas_espera/` — reglas e historial.
- `gestion-estudios-backend/app/api/v1/listas_espera.py` — endpoints.
- `gestion-estudios-backend/migrations/versions/` — lista, orden e índices.
- `gestion-estudios-frontend/src/dominios/listas-espera/` — tabla y reordenamiento accesible.

## Verificación esperada y regresión

- [ ] Tests de duplicidad, prioridad/orden, cierre, permisos y auditoría.
- [ ] Test que vincular cupo no cambia cupo ni preselección.
- [ ] Playwright de reordenamiento por teclado y viewport móvil.
