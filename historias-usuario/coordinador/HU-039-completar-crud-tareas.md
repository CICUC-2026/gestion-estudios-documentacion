# HU-039 — Completar CRUD de tareas relacionadas

**Tipo:** historia-usuario  
**Actor:** coordinador  
**Estado:** implementada  
**Última actualización:** 2026-08-04  
**Feature relacionada:** [Tareas, comités y notificaciones](../../features/backlog/tareas-comites-notificaciones.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/42  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **coordinador**, quiero crear, editar, completar y cancelar tareas vinculadas opcionalmente a un paciente sintético o estudio para gestionar el trabajo de la demostración.

## Criterios verificables

- [x] API lista, crea y modifica título, prioridad, vencimiento y estado.
- [x] Una tarea puede vincularse opcionalmente a paciente sintético o estudio.
- [x] Estados disponibles: pendiente, en curso, bloqueada, completada y cancelada.
- [x] No existe borrado físico; cada cambio queda auditado.
- [x] Frontend ofrece formulario completo y acciones visibles con error real.
- [x] La relación no concede acceso ni constituye indicación clínica.

## Impacto, contratos, permisos y riesgos

Modifica tarea, migración, servicio, API y frontend. Mutaciones requieren rol operativo; lectura requiere sesión. Títulos deben usar contenido administrativo mínimo. Riesgo de contexto sensible: la demo solo utiliza datos sintéticos.

## No alcance

- Notificaciones externas, recurrencia u órdenes clínicas.
- Eliminación física.

## Código relacionado y verificación

- Backend `app/dominios/operacion/`, API, migración y tests.
- Frontend `src/dominios/operacion/` y página Operación.
- Tests de transiciones, permisos, auditoría y Playwright.

## Evidencia de implementación

- Backend: `b51eb4e` a `fe8177d00e8f52776bbc33b709199cad013faea6`.
- Frontend: `3acdda8` a `955992cf98b1fec1cf920aa5cb43c45e2dccfcb9`.
- [Despliegue frontend](https://github.com/CICUC-2026/gestion-estudios-frontend/actions/runs/30942456149) y [validación frontend](https://github.com/CICUC-2026/gestion-estudios-frontend/actions/runs/30942456274) aprobados.
- Verificación productiva autenticada: tarea vinculada a paciente creada y cambiada a `completada` con respuestas 201/200.
