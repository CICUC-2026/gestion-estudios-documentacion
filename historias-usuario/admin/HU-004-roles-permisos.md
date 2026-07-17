# HU-004 — Administrar roles y permisos

**Tipo:** historia-usuario  
**Actor:** admin  
**Estado:** propuesta  
**Última actualización:** 2026-07-17  
**Feature relacionada:** [Fundamentos de la plataforma](../../features/en-desarrollo/fundamentos-plataforma.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/4  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **administrador**, quiero asignar roles y alcances para aplicar mínimo privilegio sobre funciones y datos.

## Criterios de aceptación

- [ ] Roles y permisos se administran sin cambiar código.
- [ ] La autorización combina acción, unidad y relación con el recurso.
- [ ] Un administrador no recibe acceso clínico completo por defecto.
- [ ] Cada endpoint niega acciones no autorizadas aunque el frontend sea manipulado.
- [ ] Los cambios de permisos quedan auditados.

## Impacto y contratos

Afecta toda capacidad protegida. Las denegaciones deben usar el contrato de errores común sin filtrar existencia de recursos sensibles.

## No alcance

- matriz definitiva sin validación de CICUC;
- delegación temporal avanzada;
- federación de identidad.

## Riesgo clínico/legal

Riesgo alto de exposición o bloqueo operativo. Requiere validación de actores y pruebas negativas por rol.

## Código relacionado

- Backend: dominios `usuarios`, `autenticacion` y políticas de autorización.
- Frontend: controles de navegación por capacidad.

## Verificación y regresión

- [ ] Matriz de tests positivos y negativos.
- [ ] E2E de administración de rol.
- [ ] Auditoría de cambio de permisos.
