# HU-003 — Administrar autenticación y sesiones

**Tipo:** historia-usuario  
**Actor:** admin  
**Estado:** implementada  
**Última actualización:** 2026-07-17  
**Feature relacionada:** [Fundamentos de la plataforma](../../features/en-desarrollo/fundamentos-plataforma.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/3  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **administrador**, quiero cuentas y sesiones controladas para que solo usuarios autorizados ingresen a la plataforma.

## Criterios de aceptación

- [x] No existe registro público.
- [x] Un administrador crea, activa y desactiva cuentas.
- [x] Login, logout, expiración y revocación funcionan.
- [x] Contraseñas se almacenan con Argon2.
- [x] Intentos fallidos generan bloqueo temporal configurable.
- [x] Respuestas y logs no revelan credenciales ni existencia innecesaria de cuentas.

## Impacto y contratos

Protege todas las rutas posteriores. Debe conservar el prefijo `/api/v1` y devolver errores consistentes.

| Funcionalidad existente | ¿Se toca? | Riesgo | Cómo se protege |
|---|---:|---|---|
| Salud y OpenAPI | Sí | Bajo | Test de regresión de `/api/v1/salud` y OpenAPI |
| Layout y navegación | Sí | Medio | Tests de ruta protegida, login y navegación superior |
| Configuración PostgreSQL | Sí | Medio | Migración real arriba/abajo y tests de persistencia |

## Contratos que deben preservarse

- El endpoint de salud continúa público y sin datos sensibles.
- La API permanece bajo `/api/v1`.
- Las rutas protegidas no renderizan contenido antes de validar la sesión.
- La barra horizontal superior se mantiene tras autenticar.
- Los errores de credenciales no revelan si una cuenta existe, está inactiva o bloqueada.

## No alcance

- SSO institucional;
- registro público;
- autenticación multifactor, pendiente de evaluación.

## Riesgo clínico/legal

Una sesión comprometida puede exponer datos sensibles; requiere pruebas negativas y revocación real.

## Código relacionado

- `gestion-estudios-backend/app/dominios/autenticacion/` — modelos, esquemas y servicio.
- `gestion-estudios-backend/app/api/v1/autenticacion.py` — endpoints de sesión.
- `gestion-estudios-backend/app/api/v1/usuarios.py` — creación y activación administrativa.
- `gestion-estudios-backend/migrations/versions/` — migración de usuarios, sesiones y auditoría.
- `gestion-estudios-frontend/src/dominios/autenticacion/` — cliente y contexto de sesión.
- `gestion-estudios-frontend/src/paginas/PaginaIngreso.tsx` — login.
- `gestion-estudios-frontend/src/rutas/` — protección de rutas.

## Implementado en

- Backend: https://github.com/CICUC-2026/gestion-estudios-backend/commit/4bdacb5b5a1623861a4469b0c0e5368dccfd046b
- Frontend: https://github.com/CICUC-2026/gestion-estudios-frontend/commit/03d0fb6a65cd71c4071670b73d962c0d70e738e3
- CI backend: https://github.com/CICUC-2026/gestion-estudios-backend/actions/runs/29588791762
- CI frontend: https://github.com/CICUC-2026/gestion-estudios-frontend/actions/runs/29588822804

## Verificación y regresión

- [x] Backend: 11 tests sobre PostgreSQL, con éxito, denegación, expiración, revocación, bloqueo, cambio de contraseña y auditoría.
- [x] Frontend: 5 tests de componentes para login, error y rutas protegidas.
- [x] Playwright: 6 pruebas simuladas en escritorio/móvil y 1 E2E contra API/PostgreSQL reales.
- [x] Regresión de salud/OpenAPI y navegación horizontal.
- [x] Migración `upgrade → downgrade → upgrade` verificada sobre PostgreSQL 16.
- [x] Pantalla de ingreso revisada visualmente en escritorio.
