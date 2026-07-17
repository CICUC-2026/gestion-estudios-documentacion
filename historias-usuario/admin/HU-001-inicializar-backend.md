# HU-001 — Inicializar base técnica del backend

**Tipo:** historia-usuario  
**Actor:** admin  
**Estado:** propuesta  
**Última actualización:** 2026-07-17  
**Feature relacionada:** [Fundamentos de la plataforma](../../features/backlog/fundamentos-plataforma.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/1  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **administrador técnico**, quiero una API ejecutable y verificable para construir capacidades del sistema sobre una base segura y reproducible.

## Criterios de aceptación

- [ ] FastAPI expone `/api/v1/salud` y OpenAPI.
- [ ] PostgreSQL se configura mediante variables de entorno.
- [ ] Alembic puede aplicar y revertir una migración inicial.
- [ ] La estructura está separada por dominios.
- [ ] Docker Compose levanta servicios de desarrollo sin datos reales.
- [ ] CI ejecuta lint, tipos y tests.

## Impacto

No existe funcionalidad previa. Define contratos técnicos que usarán todas las features.

## Contratos que deben preservarse

- prefijo `/api/v1`;
- configuración sin secretos versionados;
- JSON de error consistente, por definir en ADR antes de dominios funcionales.

## No alcance

- autenticación funcional;
- modelos clínicos;
- despliegue productivo.

## Riesgo clínico/legal

No se usarán datos reales. Logs y fixtures deben ser ficticios.

## Código relacionado

- `gestion-estudios-backend/app/` — aplicación FastAPI.
- `gestion-estudios-backend/migrations/` — Alembic.
- `gestion-estudios-backend/tests/` — pruebas.

## Verificación y regresión

- [ ] Lint y tipos.
- [ ] Pytest.
- [ ] Migración arriba/abajo.
- [ ] Inicio mediante Docker Compose.
