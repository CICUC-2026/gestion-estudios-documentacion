# HU-001 — Inicializar base técnica del backend

**Tipo:** historia-usuario  
**Actor:** admin  
**Estado:** implementada  
**Última actualización:** 2026-07-17  
**Feature relacionada:** [Fundamentos de la plataforma](../../features/en-desarrollo/fundamentos-plataforma.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/1  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **administrador técnico**, quiero una API ejecutable y verificable para construir capacidades del sistema sobre una base segura y reproducible.

## Criterios de aceptación

- [x] FastAPI expone `/api/v1/salud` y OpenAPI.
- [x] PostgreSQL se configura mediante variables de entorno.
- [x] Alembic puede aplicar y revertir una migración inicial.
- [x] La estructura está separada por dominios.
- [x] Docker Compose define servicios de desarrollo sin datos reales y la imagen fue construida en CI.
- [x] CI ejecuta lint, tipos, tests, migración offline y build Docker.

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

## Implementado en

- Commit: https://github.com/CICUC-2026/gestion-estudios-backend/commit/1d10d6186914c0a953eed41bdd85f69cef4477b4
- CI: https://github.com/CICUC-2026/gestion-estudios-backend/actions/runs/29587451347

## Verificación y regresión

- [x] Ruff y MyPy.
- [x] Pytest: 2 pruebas, 69 % de cobertura inicial.
- [x] Migración aplicada y revertida contra PostgreSQL 16 temporal.
- [x] `docker build` verificado en GitHub Actions.

`docker compose up` no se ejecutó localmente porque el host no dispone de Docker; la configuración fue revisada y la imagen se construyó correctamente en CI.
