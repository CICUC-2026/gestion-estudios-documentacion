# HU-017 — Gestionar estados, cierre y reapertura de preselección

**Tipo:** historia-usuario  
**Actor:** investigador  
**Estado:** propuesta  
**Bloqueada por:** HU-015 y validación de estados/transiciones en `04-flujos/preseleccion.md`  
**Última actualización:** 2026-08-04  
**Feature relacionada:** [Preselección manual](../../features/backlog/preseleccion-manual.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/20  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **investigador principal**, quiero cambiar estados mediante transiciones validadas y reabrir excepcionalmente un caso cerrado para conservar un proceso administrativo coherente y auditable.

## Criterios de aceptación

- [ ] Solo transiciones aprobadas se ejecutan; no existe edición directa del estado.
- [ ] Cada transición registra anterior, nuevo, autor, fecha, motivo y comentario.
- [ ] Cierre y descarte exigen motivo de catálogo o texto justificado.
- [ ] Una preselección cerrada, descartada o derivada según regla queda inmutable.
- [ ] Reapertura requiere capacidad específica, motivo y conserva el cierre anterior.
- [ ] Concurrencia aplica control para impedir transiciones sobre estado obsoleto.
- [ ] Ningún estado se denomina elegible/no elegible/califica.

## Impacto sobre funcionalidades existentes

| Área | Riesgo | Protección |
|---|---|---|
| Preselección/evaluaciones | Alto | Máquina de estados y bloqueo optimista |
| Permisos | Alto | Capacidades por transición/reapertura |
| Auditoría | Alto | Historial inmutable y rollback |

## Contratos que deben preservarse

- Estados administrativos, no conclusión clínica.
- Cierre inmutable salvo reapertura explícita.
- Transiciones atómicas y auditadas.
- No automatizar derivaciones o notificaciones críticas.

## No alcance

- definir resultado del screening formal;
- notificaciones externas;
- automatización por criterios.

## Riesgo clínico/legal

Estados incorrectos pueden detener o desviar trabajo. La máquina debe validarse con usuarios reales antes de implementación.

## Código relacionado

- `gestion-estudios-backend/app/dominios/preselecciones/` — máquina de estados y concurrencia.
- `gestion-estudios-backend/app/api/v1/preselecciones.py` — comandos de transición.
- `gestion-estudios-backend/migrations/versions/` — historial y versión de concurrencia.
- `gestion-estudios-frontend/src/dominios/preselecciones/` — acciones y confirmaciones.

## Verificación esperada y regresión

- [ ] Tabla completa de transiciones válidas/inválidas por capacidad.
- [ ] Tests de concurrencia, cierre, reapertura, rollback y auditoría.
- [ ] Playwright de confirmación y mensajes de conflicto.
