# HU-025 — Consultar reportes operativos

**Tipo:** historia-usuario  
**Actor:** coordinador  
**Estado:** propuesta  
**Bloqueada por:** dominios fuente, HU-004 y catálogo de reportes validado  
**Última actualización:** 2026-07-17  
**Feature relacionada:** [Reportes y auditoría](../../features/backlog/reportes-auditoria.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/28  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **coordinador de estudios**, quiero consultar reportes operativos con fecha de corte para identificar trabajo pendiente sin producir métricas clínicas interpretativas.

## Criterios de aceptación

- [ ] Cada reporte tiene finalidad, definición, fecha de corte, filtros y campos documentados.
- [ ] Backend aplica permisos y alcance de cada dominio antes de agregar.
- [ ] Primer catálogo prioriza estudios, reclutamiento, cupos, espera, preselecciones y tareas.
- [ ] Métricas diferencian estados tentativos, desactualizados y confirmados.
- [ ] Grupos pequeños o datos identificatorios se suprimen/minimizan según política aprobada.
- [ ] Filtros combinables son reproducibles y visibles.
- [ ] No se presentan conclusiones de eficacia, elegibilidad o riesgo clínico.

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

- `gestion-estudios-backend/app/dominios/reportes/` — consultas de solo lectura.
- `gestion-estudios-backend/app/api/v1/reportes.py` — endpoints.
- `gestion-estudios-frontend/src/dominios/reportes/` — filtros y tablas.

## Verificación esperada y regresión

- [ ] Tests de definiciones, corte, alcance, supresión y no mutación.
- [ ] Tests de rendimiento con volumen ficticio.
- [ ] Playwright de filtros y estados diferenciados.
