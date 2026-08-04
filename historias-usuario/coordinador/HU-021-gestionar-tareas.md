# HU-021 — Gestionar tareas y seguimiento

**Tipo:** historia-usuario
**Actor:** coordinador
**Estado:** implementada
**Última actualización:** 2026-08-04
**Feature relacionada:** [Tareas, comités y notificaciones](../../features/backlog/tareas-comites-notificaciones.md)
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/24
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **coordinador de estudios**, quiero crear y asignar tareas con fecha y estado para hacer visible el seguimiento administrativo pendiente.

## Criterios de aceptación

- [x] Tarea registra título, descripción, creador, responsable, prioridad operativa, vencimiento, estado y vínculos autorizados.
- [x] Estados: pendiente, en curso, bloqueada, completada y cancelada.
- [x] Responsable solo ve contexto del recurso si tiene permiso independiente para él.
- [x] Completar/cancelar registra fecha de actualización y autor en auditoría.
- [x] Vencimiento genera indicador interno, no acción clínica.
- [x] Cambios de responsable, fecha, prioridad y estado quedan auditados.
- [x] La demo no envía notificaciones externas ni expone datos reales.

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

- [x] Tests de creación, actualización, estados y auditoría.
- [x] Tests que la tarea no amplía acceso ni ejecuta acciones.
- [x] Playwright de creación y cierre.

## Incremento implementado 2026-07-31

- creación y listado persistente de tareas administrativas;
- prioridad, estado inicial, vencimiento y responsable almacenados en PostgreSQL;
- autorización backend para crear y sesión requerida para consultar;
- auditoría de creación;
- formulario web responsivo conectado a la API.

El incremento se completó el 2026-08-04 mediante HU-039: edición, vínculos opcionales, transiciones y cierre están conectados de extremo a extremo y desplegados.
