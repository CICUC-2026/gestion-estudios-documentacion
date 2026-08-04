# HU-041 — Gestionar preselección manual sintética

**Tipo:** historia-usuario  
**Actor:** medico  
**Estado:** lista  
**Última actualización:** 2026-08-04  
**Feature relacionada:** [Preselección manual](../../features/backlog/preseleccion-manual.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/44  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **médico en la demo**, quiero revisar manualmente criterios de un paciente sintético contra una versión de estudio para demostrar trazabilidad sin emitir elegibilidad.

## Criterios verificables

- [ ] La preselección referencia paciente sintético, estudio y versión exacta.
- [ ] Cada criterio se marca manualmente con estado, comentario, fuente, autor y fecha.
- [ ] Médico crea/evalúa; investigador confirma/cierra/reabre; administrador puede ejecutar todo.
- [ ] Transiciones y reapertura exigen motivo y auditoría.
- [ ] La interfaz evita las palabras elegible/no elegible y muestra “revisión administrativa sintética”.
- [ ] No existe cálculo, matching ni recomendación automática.

## Impacto, contratos y riesgos

Agrega modelos, migración, API y frontend. Conserva versiones históricas y autorización backend. Riesgo de interpretación clínica mitigado por lenguaje de incertidumbre y datos exclusivamente ficticios.

## No alcance

- Screening formal, elegibilidad o pacientes reales.

## Código relacionado y verificación

- Nuevo dominio backend de preselección, rutas `/api/v1/preselecciones-demo` y tests.
- Frontend de detalle y evaluación manual con Playwright.
