# HU-019 — Mantener cupos con fuente e historial

**Tipo:** historia-usuario  
**Actor:** enfermeria  
**Estado:** propuesta  
**Bloqueada por:** validación institucional de fuente, vigencia y transiciones en `04-flujos/cupos-lista-espera.md`  
**Última actualización:** 2026-08-04  
**Feature relacionada:** [Cupos y lista de espera](../../features/backlog/cupos-lista-espera.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/22  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **enfermera coordinadora**, quiero registrar y actualizar cupos con fuente, fecha y responsable para distinguir disponibilidad confirmada de información tentativa o desactualizada.

## Criterios de aceptación

- [ ] Cupo pertenece a estudio y brazo cuando corresponde; registra cantidad, fechas, estado, fuente, confirmación, responsable y observaciones.
- [ ] Solo transiciones aprobadas cambian el estado.
- [ ] `confirmado` y `disponible` exigen fuente y fecha de confirmación.
- [ ] La interfaz nunca agrupa `tentativo` como disponible.
- [ ] Antigüedad y responsable son visibles en lista y detalle.
- [ ] Cada cambio conserva anterior/nuevo, autor, fecha y motivo.
- [ ] Concurrencia impide sobrescribir una actualización más reciente.
- [ ] Alertas de antigüedad o fecha no cambian estados automáticamente.

## Impacto sobre funcionalidades existentes

| Área | Riesgo | Protección |
|---|---|---|
| Estudios/permisos | Alto | Alcance y estado activo |
| Auditoría | Alto | Historial por transición |
| Panel/UI | Medio | Etiquetas textuales y antigüedad |

## Contratos que deben preservarse

- Tentativo no equivale a confirmado/disponible.
- Fuente, fecha y responsable siempre visibles.
- Sin reserva/asignación automática.
- Eliminación lógica e historial.

## No alcance

- lista de espera;
- comunicaciones externas;
- asignación clínica o recomendación.

## Riesgo clínico/legal

Información desactualizada puede desviar trabajo. Estados y antigüedad requieren validación operacional antes de implementación.

## Código relacionado

- `gestion-estudios-backend/app/dominios/cupos/` — modelo, estados y concurrencia.
- `gestion-estudios-backend/app/api/v1/cupos.py` — endpoints.
- `gestion-estudios-backend/migrations/versions/` — cupos e historial.
- `gestion-estudios-frontend/src/dominios/cupos/` — tabla y formulario.

## Verificación esperada y regresión

- [ ] Tests de transiciones, fuente, antigüedad, permisos, concurrencia y auditoría.
- [ ] Playwright que diferencia tentativo/disponible y alerta visual.
- [ ] Regresión de estudios, sesión y navegación.
