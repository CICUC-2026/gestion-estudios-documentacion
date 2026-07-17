# HU-002 — Inicializar aplicación web y navegación superior

**Tipo:** historia-usuario  
**Actor:** admin  
**Estado:** implementada  
**Última actualización:** 2026-07-17  
**Feature relacionada:** [Fundamentos de la plataforma](../../features/en-desarrollo/fundamentos-plataforma.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/2  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **usuario de la plataforma**, quiero una interfaz navegable con barra superior horizontal para acceder con claridad a los módulos autorizados.

## Criterios de aceptación

- [x] React/TypeScript/Vite ejecuta en desarrollo y producción.
- [x] Existe layout responsivo con barra horizontal superior.
- [x] La interfaz utiliza una identidad propia de CICUC y no reutiliza estilos de otro producto.
- [x] Rutas y errores base son accesibles mediante teclado.
- [x] Tokens neutrales usan contrastes AA en los elementos implementados.
- [x] CI ejecuta lint, tipos, tests, build y Playwright.

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

## Implementado en

- Commit principal: https://github.com/CICUC-2026/gestion-estudios-frontend/commit/051fbdfddd7eb3efdf8295f64f20194ded89767f
- CI: https://github.com/CICUC-2026/gestion-estudios-frontend/actions/runs/29587567802

## Verificación y regresión

- [x] ESLint, TypeScript, 2 pruebas de componentes y build.
- [x] Playwright: 4 pruebas en viewport escritorio y móvil.
- [x] Verificación visual de barra, navegación, estados vacíos y contenido ficticio.
- [x] Navegación principal y ruta 404 verificadas por roles accesibles.
