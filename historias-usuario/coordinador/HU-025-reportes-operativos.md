# HU-025 — Consultar reportes operativos

**Tipo:** historia-usuario
**Actor:** coordinador
**Estado:** implementada
**Última actualización:** 2026-08-04
**Feature relacionada:** [Reportes y auditoría](../../features/backlog/reportes-auditoria.md)
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/28
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **coordinador de estudios**, quiero consultar reportes operativos con fecha de corte para identificar trabajo pendiente sin producir métricas clínicas interpretativas.

## Criterios de aceptación

- [x] Cada reporte tiene finalidad, definición, fecha de corte, filtros y campos documentados.
- [x] Backend aplica permisos y alcance de cada dominio antes de agregar.
- [x] Primer catálogo prioriza estudios, reclutamiento, cupos, espera, preselecciones y tareas.
- [x] Métricas diferencian estados tentativos, desactualizados y confirmados.
- [x] Grupos pequeños o datos identificatorios se suprimen/minimizan según política aprobada.
- [x] Filtros combinables son reproducibles y visibles.
- [x] No se presentan conclusiones de eficacia, elegibilidad o riesgo clínico.

## Impacto sobre funcionalidades existentes

| Área | Riesgo | Protección |
|---|---|---|
| Dominios fuente | Alto | Consultas de solo lectura y contratos |
| Permisos | Alto | Agregación dentro de alcance |
| Rendimiento | Alto | Planes, índices, límites y pruebas |

## Contratos que deben preservarse

- Métricas operativas con definición y corte.
- Sin interpretación clínica.
- Mismos permisos que fuentes.
- Consulta no muta datos.

## No alcance

- exportación;
- dashboards configurables;
- analítica predictiva;
- actividad individual como evaluación de desempeño.

## Riesgo clínico/legal

Agregados pueden reidentificar o inducir interpretaciones. Catálogo y supresión requieren validación antes de desarrollo.

## Código relacionado

- `gestion-estudios-backend/app/dominios/operacion/servicio.py` — agregaciones de solo lectura.
- `gestion-estudios-backend/app/api/v1/operacion.py` — endpoints autorizados.
- `gestion-estudios-frontend/src/dominios/operacion/` — filtros y tablas.

## Verificación esperada y regresión

- [x] Tests de definiciones, corte, alcance, supresión y no mutación.
- [x] Tests de agregación con 250 tareas ficticias.
- [x] Playwright de preparación persistente y filtros visibles.

## Incremento implementado 2026-07-31

- preparación y listado persistente de cortes operativos;
- fecha de corte, finalidad, autor y snapshot de estudios/tareas en PostgreSQL;
- autorización backend y auditoría de preparación;
- interfaz responsiva conectada a la API.

## Incremento completado 2026-08-04

- Backend `11a6451` y test de volumen `3aa37da`: catálogo operativo de estudios, pacientes
  sintéticos, asociaciones, espera declarada sin fuente, preselecciones, cupos y tareas.
- Corte reproducible, filtros combinables, estados de calidad y supresión `<5`.
- Frontend `b6593da`: fecha de corte, estudio y estado de tarea visibles.
