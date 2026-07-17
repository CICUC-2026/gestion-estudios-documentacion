# HU-002 — Inicializar aplicación web y navegación superior

**Tipo:** historia-usuario  
**Actor:** admin  
**Estado:** propuesta  
**Última actualización:** 2026-07-17  
**Feature relacionada:** [Fundamentos de la plataforma](../../features/backlog/fundamentos-plataforma.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/2  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **usuario de la plataforma**, quiero una interfaz navegable con barra superior horizontal para acceder con claridad a los módulos autorizados.

## Criterios de aceptación

- [ ] React/TypeScript/Vite ejecuta en desarrollo y producción.
- [ ] Existe layout responsivo con barra horizontal superior.
- [ ] La interfaz utiliza una identidad propia de CICUC y no reutiliza estilos de otro producto.
- [ ] Rutas y errores base son accesibles mediante teclado.
- [ ] Tokens neutrales cumplen contraste AA.
- [ ] CI ejecuta lint, tipos, tests y build.

## Impacto

No existe interfaz previa. Define layout y navegación para todos los dominios.

## Contratos que deben preservarse

- navegación superior en escritorio;
- textos visibles en español;
- permisos visuales nunca sustituyen autorización backend.

## No alcance

- identidad de marca definitiva;
- formularios clínicos;
- autenticación real.

## Riesgo clínico/legal

Usar datos ficticios en prototipos y tests.

## Código relacionado

- `gestion-estudios-frontend/src/aplicacion/` — layout.
- `gestion-estudios-frontend/src/rutas/` — rutas.
- `gestion-estudios-frontend/tests/` — pruebas E2E.

## Verificación y regresión

- [ ] Lint, tipos, tests y build.
- [ ] Playwright en viewport escritorio y móvil.
- [ ] Verificación de teclado y contraste.
