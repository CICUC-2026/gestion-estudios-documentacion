# HU-004 — Administrar roles y permisos

**Tipo:** historia-usuario  
**Actor:** admin  
**Estado:** implementada  
**Última actualización:** 2026-07-31  
**Feature relacionada:** [Fundamentos de la plataforma](../../features/en-desarrollo/fundamentos-plataforma.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/4  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **administrador**, quiero asignar roles y alcances para aplicar mínimo privilegio sobre funciones y datos.

## Criterios de aceptación

- [x] Roles y permisos se administran sin cambiar código.
- [x] La autorización combina acción, unidad y relación con el recurso (`requerir_roles`).
- [x] Un administrador no recibe acceso clínico completo por defecto.
- [x] Cada endpoint niega acciones no autorizadas (HTTP 403 `PERMISO_DENEGADO`) aunque el frontend sea manipulado.
- [x] Los cambios de permisos quedan auditados (`usuario.asignar_roles`).

## Impacto y contratos

Afecta toda capacidad protegida. Las denegaciones deben usar el contrato de errores común sin filtrar existencia de recursos sensibles.

## No alcance

- matriz definitiva sin validación de CICUC;
- delegación temporal avanzada;
- federación de identidad.

## Riesgo clínico/legal

Riesgo alto de exposición o bloqueo operativo. Requiere validación de actores y pruebas negativas por rol.

## Código relacionado

- Backend: `app/dominios/autenticacion/modelos.py` (`RolUsuario`, `UsuarioRol`), `app/dominios/autenticacion/dependencias.py` (`requerir_roles`), `app/api/v1/usuarios.py` (`/usuarios/{id}/roles`).
- Frontend: `src/dominios/autenticacion/tipos.ts` (`RolUsuario`).

## Verificación y regresión

- [x] Matriz de tests positivos y negativos (`tests/test_roles.py`).
- [x] E2E y pruebas de autorización negativa.
- [x] Auditoría de cambio de permisos.
