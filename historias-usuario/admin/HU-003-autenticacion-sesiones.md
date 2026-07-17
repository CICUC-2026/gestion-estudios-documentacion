# HU-003 — Administrar autenticación y sesiones

**Tipo:** historia-usuario  
**Actor:** admin  
**Estado:** propuesta  
**Última actualización:** 2026-07-17  
**Feature relacionada:** [Fundamentos de la plataforma](../../features/en-desarrollo/fundamentos-plataforma.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/3  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **administrador**, quiero cuentas y sesiones controladas para que solo usuarios autorizados ingresen a la plataforma.

## Criterios de aceptación

- [ ] No existe registro público.
- [ ] Un administrador crea, activa y desactiva cuentas.
- [ ] Login, logout, expiración y revocación funcionan.
- [ ] Contraseñas se almacenan con hash robusto.
- [ ] Intentos fallidos generan bloqueo temporal configurable.
- [ ] Respuestas y logs no revelan credenciales ni existencia innecesaria de cuentas.

## Impacto y contratos

Protege todas las rutas posteriores. Debe conservar el prefijo `/api/v1` y devolver errores consistentes.

## No alcance

- SSO institucional;
- registro público;
- autenticación multifactor, pendiente de evaluación.

## Riesgo clínico/legal

Una sesión comprometida puede exponer datos sensibles; requiere pruebas negativas y revocación real.

## Código relacionado

- Backend: dominio `autenticacion`, modelos de usuario/sesión y migraciones.
- Frontend: dominio `autenticacion` y rutas protegidas.

## Verificación y regresión

- [ ] Tests API de éxito, denegación, expiración y revocación.
- [ ] Tests frontend de login y ruta protegida.
- [ ] E2E de sesión completa.
