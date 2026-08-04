# HU-041 — Gestionar preselección manual sintética

**Tipo:** historia-usuario  
**Actor:** medico  
**Estado:** implementada  
**Última actualización:** 2026-08-04  
**Feature relacionada:** [Preselección manual](../../features/backlog/preseleccion-manual.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/44  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **médico en la demo**, quiero revisar manualmente criterios de un paciente sintético contra una versión de estudio para demostrar trazabilidad sin emitir elegibilidad.

## Criterios verificables

- [x] La preselección referencia paciente sintético, estudio y versión exacta.
- [x] Cada criterio se marca manualmente con estado, comentario, fuente, autor y fecha.
- [x] Médico crea/evalúa; investigador confirma/cierra/reabre; administrador puede ejecutar todo.
- [x] Transiciones y reapertura exigen motivo y auditoría.
- [x] La interfaz evita conclusiones de elegibilidad y muestra “revisión administrativa sintética”.
- [x] No existe cálculo, matching ni recomendación automática.

## Impacto, contratos y riesgos

Agrega modelos, migración, API y frontend. Conserva versiones históricas y autorización backend. Riesgo de interpretación clínica mitigado por lenguaje de incertidumbre y datos exclusivamente ficticios.

## No alcance

- Screening formal, elegibilidad o pacientes reales.

## Código relacionado y verificación

- Nuevo dominio backend de preselección, rutas `/api/v1/preselecciones-demo` y tests.
- Frontend de detalle y evaluación manual con Playwright.

## Evidencia

- Backend: `3949a55da5f030f44046f52665174056d7fe8c17` y corrección CI `7e559c06490e67cfe67c83afb2482c1728462b72`.
- Frontend: `c4fbbf28dbbdb8268dbcd39eb83a0273dce390b2`.
- Backend: 23 pruebas, Ruff, formato, MyPy, migración y Docker aprobados en [CI](https://github.com/CICUC-2026/gestion-estudios-backend/actions/runs/30947456775).
- Frontend: ESLint, TypeScript, Vitest, build y 12 Playwright aprobados en [CI](https://github.com/CICUC-2026/gestion-estudios-frontend/actions/runs/30947329183).
- Despliegues AWS: [backend](https://github.com/CICUC-2026/gestion-estudios-backend/actions/runs/30947456643) y [frontend](https://github.com/CICUC-2026/gestion-estudios-frontend/actions/runs/30947329865).
- Producción: salud OK, endpoint protegido con HTTP 401 sin sesión y bundle con pantalla/acciones HU-041.
