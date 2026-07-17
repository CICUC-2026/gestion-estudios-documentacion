# ADR-002 — API REST con FastAPI

**Estado:** aceptada  
**Fecha:** 2026-07-17

## Decisión

Usar Python, FastAPI, Pydantic, SQLAlchemy, Alembic y PostgreSQL. Exponer una API REST bajo `/api/v1` y documentación OpenAPI.

## Razones

- coincide con la arquitectura propuesta para este producto;
- contratos y errores explícitos por recurso;
- ecosistema maduro para validación y pruebas;
- migraciones y restricciones relacionales reproducibles.

## Consecuencias

No se copiarán implementaciones de otros productos. La estructura se organizará por dominios y cada endpoint delegará reglas a servicios de aplicación.
