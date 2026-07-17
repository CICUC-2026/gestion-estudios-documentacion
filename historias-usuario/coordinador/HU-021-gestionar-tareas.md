# HU-021 — Gestionar tareas y seguimiento

**Tipo:** historia-usuario  
**Actor:** coordinador  
**Estado:** propuesta  
**Bloqueada por:** HU-004 y definición de visibilidad/recordatorios  
**Última actualización:** 2026-07-17  
**Feature relacionada:** [Tareas, comités y notificaciones](../../features/backlog/tareas-comites-notificaciones.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/24  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **coordinador de estudios**, quiero crear y asignar tareas con fecha y estado para hacer visible el seguimiento administrativo pendiente.

## Criterios de aceptación

- [ ] Tarea registra título, descripción, creador, responsable, prioridad operativa, vencimiento, estado y vínculos autorizados.
- [ ] Estados: pendiente, en curso, bloqueada, completada y cancelada, sujetos a transición validada.
- [ ] Responsable solo ve contexto del recurso si tiene permiso independiente para él.
- [ ] Completar/cancelar registra fecha, autor y comentario.
- [ ] Vencimiento genera indicador interno, no acción clínica.
- [ ] Cambios de responsable, fecha, prioridad y estado quedan auditados.
- [ ] No se incluyen datos sensibles en título de notificación.

## Impacto sobre funcionalidades existentes

| Área | Riesgo | Protección |
|---|---|---|
| Permisos | Alto | Vínculos no amplían acceso |
| Notificaciones | Medio | Contenido mínimo y tests |
| Auditoría | Alto | Historial de asignación/estado |

## Contratos que deben preservarse

- Tarea administrativa, no orden clínica.
- Asignación no concede acceso al recurso.
- Indicadores internos sin acción automática.
- Contenido mínimo en avisos.

## No alcance

- correo, SMS, mensajería o push;
- tareas recurrentes;
- órdenes o alertas clínicas.

## Riesgo clínico/legal

Una tarea puede contener contexto sensible o confundirse con una indicación clínica. Requiere lenguaje y visibilidad validados.

## Código relacionado

- `gestion-estudios-backend/app/dominios/tareas/` — reglas y transiciones.
- `gestion-estudios-backend/app/api/v1/tareas.py` — endpoints.
- `gestion-estudios-backend/migrations/versions/` — tarea e historial.
- `gestion-estudios-frontend/src/dominios/tareas/` — bandeja y formulario.

## Verificación esperada y regresión

- [ ] Tests de permisos cruzados, transiciones, vencimiento y auditoría.
- [ ] Tests que la tarea no amplía acceso ni ejecuta acciones.
- [ ] Playwright de asignación, bloqueo y cierre.
