# HU-027 — Endurecer seguridad, accesibilidad y calidad

**Tipo:** historia-usuario  
**Actor:** admin  
**Estado:** propuesta  
**Bloqueada por:** flujos críticos implementados y entorno de preproducción  
**Última actualización:** 2026-07-17  
**Feature relacionada:** [Reportes y auditoría](../../features/backlog/reportes-auditoria.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/30  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **administrador técnico**, quiero verificar seguridad, accesibilidad, dependencias y flujos críticos para preparar una versión candidata a validación operacional.

## Criterios de aceptación

- [ ] CI ejecuta lint, tipos, tests, build, migración, dependencias y análisis básico de seguridad.
- [ ] Ramas protegidas exigen PR, checks y revisión según capacidad de GitHub acordada.
- [ ] Flujos E2E del prompt pasan con datos ficticios y permisos negativos.
- [ ] Navegación, formularios, tablas, estados y errores cumplen revisión WCAG 2.2 AA documentada.
- [ ] Se ejecuta modelado de amenazas para autenticación, autorización, exportación, documentos y auditoría.
- [ ] Logs se revisan para ausencia de secretos y datos sensibles.
- [ ] Rendimiento y límites se prueban con volumen ficticio representativo.
- [ ] Hallazgos se registran y los críticos bloquean release.

## Impacto sobre funcionalidades existentes

Todo el sistema; riesgo alto de falsos positivos o cobertura insuficiente. Cada control debe vincular evidencia y alcance.

## Contratos que deben preservarse

- Sin datos reales fuera de producción.
- Checks no sustituyen revisión clínica/operacional.
- Barra superior y experiencia accesible.
- Hallazgos críticos bloquean release, no se silencian.

## No alcance

- certificación formal;
- pentest de tercero;
- despliegue productivo;
- cambios funcionales no documentados.

## Riesgo clínico/legal

Declarar seguridad o accesibilidad sin cobertura suficiente crea falsa confianza. La evidencia debe registrar herramientas, fecha, versión y limitaciones.

## Código relacionado

- `.github/workflows/` de backend/frontend — CI.
- `gestion-estudios-backend/tests/` — integración, permisos y reglas.
- `gestion-estudios-frontend/tests/` — Playwright y accesibilidad.
- documentación `07-calidad/` — evidencia y criterios.

## Verificación esperada y regresión

- [ ] Matriz completa de requisitos → tests/evidencia.
- [ ] E2E de los diez flujos mínimos del prompt.
- [ ] Revisión de seguridad, accesibilidad, dependencias y logs.
