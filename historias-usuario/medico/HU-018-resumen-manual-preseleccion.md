# HU-018 — Elaborar y confirmar un resumen manual de preselección

**Tipo:** historia-usuario  
**Actor:** medico  
**Estado:** propuesta  
**Bloqueada por:** HU-016 y validación clínica del contenido y lenguaje permitido  
**Última actualización:** 2026-08-04  
**Feature relacionada:** [Preselección manual](../../features/backlog/preseleccion-manual.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/21  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **médico investigador**, quiero elaborar y confirmar un resumen de mi revisión para comunicar pendientes, posibles barreras y siguiente paso sin emitir elegibilidad.

## Criterios de aceptación

- [ ] La interfaz agrupa estados registrados por humanos sin generar interpretación nueva.
- [ ] Profesional redacta información faltante, posibles barreras, siguiente paso, responsable y fecha de revisión.
- [ ] Antes de guardar debe confirmar que revisó el contenido.
- [ ] Resumen conserva autor, fecha, versión y revisiones anteriores.
- [ ] No usa frases de elegibilidad ni recomendación automática.
- [ ] Cambios posteriores generan nueva revisión, no sobrescritura silenciosa.
- [ ] Exportación o envío no forman parte de esta HU.

## Impacto sobre funcionalidades existentes

| Área | Riesgo | Protección |
|---|---|---|
| Evaluaciones | Alto | Solo lectura y agrupación determinista |
| Auditoría | Alto | Revisiones inmutables y confirmación |
| UX | Alto | Advertencias y lenguaje validado |

## Contratos que deben preservarse

- Resumen humano, nunca generado por IA.
- Agrupación no transforma estados ni decide.
- Autor, versión y fecha siempre visibles.
- Historial de revisiones.

## No alcance

- exportar, enviar o notificar;
- cerrar automáticamente;
- resumen mediante modelos de lenguaje.

## Riesgo clínico/legal

El resumen puede circular fuera de contexto. Requiere lenguaje validado y advertencia visible de que no reemplaza screening formal.

## Código relacionado

- `gestion-estudios-backend/app/dominios/preselecciones/` — revisiones de resumen.
- `gestion-estudios-backend/app/api/v1/preselecciones.py` — endpoints.
- `gestion-estudios-backend/migrations/versions/` — historial de resúmenes.
- `gestion-estudios-frontend/src/dominios/preselecciones/` — editor y confirmación.

## Verificación esperada y regresión

- [ ] Tests de agrupación determinista, revisiones, permisos y auditoría.
- [ ] Test que prohíbe campos/estados automáticos de elegibilidad.
- [ ] Playwright de edición, confirmación e historial.
