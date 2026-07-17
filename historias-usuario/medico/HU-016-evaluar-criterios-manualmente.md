# HU-016 — Evaluar manualmente criterios

**Tipo:** historia-usuario  
**Actor:** medico  
**Estado:** propuesta  
**Bloqueada por:** HU-004, HU-007, HU-015 y validación clínica  
**Última actualización:** 2026-07-17  
**Feature relacionada:** [Preselección manual](../../features/backlog/preseleccion-manual.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/19  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **médico investigador**, quiero registrar mi revisión manual de cada criterio para documentar información aparente, pendiente y dudosa con su evidencia.

## Criterios de aceptación

- [ ] La lista proviene exactamente de la versión fijada en la preselección.
- [ ] Cada evaluación usa estados administrativos validados y registra comentario, evidencia/fuente, fecha, autor y motivo.
- [ ] `aparentemente_no_cumplido` exige comentario; no cierra automáticamente el caso.
- [ ] Ningún estado se calcula desde datos clínicos.
- [ ] Cambios conservan historial completo y motivo.
- [ ] Una preselección cerrada no admite edición.
- [ ] UI muestra texto del criterio, fuente, estado y autor; no depende solo del color.

## Impacto sobre funcionalidades existentes

| Área | Riesgo | Protección |
|---|---|---|
| Criterios/versiones | Alto | Lectura inmutable por versión |
| Datos clínicos | Alto | Referencias explícitas, sin inferencia |
| Auditoría | Alto | Historial por criterio |

## Contratos que deben preservarse

- Revisión exclusivamente humana y atribuida.
- Estados expresan apariencia/incertidumbre, no elegibilidad.
- No mutar criterio fuente o dato clínico.
- Cierre bloquea edición.

## No alcance

- extracción o comparación automática;
- cálculo de puntaje;
- cierre automático;
- carga funcional de documentos.

## Riesgo clínico/legal

Riesgo alto de interpretar una marca como conclusión. Requiere terminología validada, fuente visible y capacitación de usuarios.

## Código relacionado

- `gestion-estudios-backend/app/dominios/preselecciones/` — evaluación e historial.
- `gestion-estudios-backend/app/api/v1/evaluaciones_criterio.py` — endpoints.
- `gestion-estudios-backend/migrations/versions/` — evaluación e historial.
- `gestion-estudios-frontend/src/dominios/preselecciones/` — editor manual.

## Verificación esperada y regresión

- [ ] Tests de estados, comentario obligatorio, inmutabilidad, permisos y auditoría.
- [ ] Tests que prueban ausencia de automatización y mutaciones laterales.
- [ ] Playwright accesible de revisión manual.
