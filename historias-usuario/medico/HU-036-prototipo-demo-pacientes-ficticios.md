# HU-036 — Prototipo de demostración con pacientes ficticios

**Tipo:** historia-usuario  
**Actor:** medico  
**Estado:** implementada  
**Última actualización:** 2026-08-03  
**Feature relacionada:** [Pacientes y datos estructurados](../../features/backlog/pacientes-datos-estructurados.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/39  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **médico investigador en una demostración**, quiero crear y revisar casos completamente ficticios para mostrar el flujo previsto sin persistir pacientes en el servidor ni presentar el prototipo como una función clínica aprobada.

## Contexto

ADR-007 permite prototipos con datos ficticios, pero prohíbe implementar o desplegar persistencia real antes de resolver las decisiones #5 y #6. Esta historia separa explícitamente la demostración navegable de HU-010 a HU-018, que continúan bloqueadas.

## Criterios de aceptación

- [x] La pantalla se identifica visiblemente como prototipo no clínico.
- [x] Solo admite código ficticio, rango etario, patología ficticia y estado administrativo.
- [x] Los casos creados se guardan únicamente en `localStorage` del navegador.
- [x] No se solicitan nombre, RUT, fecha de nacimiento, contacto ni identificador institucional.
- [x] La persona usuaria puede agregar y reiniciar los casos ficticios de demo.
- [x] La interfaz aclara que no existe persistencia ni sincronización con el servidor.
- [x] Ningún estado representa elegibilidad, recomendación o resultado clínico.
- [x] Existen pruebas de creación, recarga y reinicio del prototipo.

## Impacto, contratos y permisos

- Afecta solo el módulo frontend `Pacientes` y su regresión de navegación.
- Conserva autenticación y ruta protegida existentes.
- No relaja autorización backend porque no agrega endpoints.
- Usa exclusivamente datos ficticios y minimizados.

## No alcance

- Persistencia API o PostgreSQL.
- Identidad, ficha clínica, asociación paciente-estudio o preselección.
- Resolución de Issues #5/#6 o aceptación de ADR-007.
- Elegibilidad, recomendaciones o automatización clínica.

## Riesgo clínico/legal

El prototipo podría confundirse con funcionalidad real. Debe mostrar de forma persistente su condición ficticia, local y no clínica, y ofrecer borrado inmediato de los datos de demostración.

## Código relacionado

- `gestion-estudios-frontend/src/dominios/pacientes/`.
- `gestion-estudios-frontend/src/paginas/PaginaPacientesDemo.tsx`.
- `gestion-estudios-frontend/src/rutas/RutasAplicacion.tsx`.
- `gestion-estudios-frontend/tests/`.

## Verificación y regresión

- [x] ESLint, TypeScript, 6 pruebas Vitest y build.
- [x] Playwright: creación, recarga y reinicio en escritorio y móvil; 10 pruebas aprobadas y 2 integradas omitidas por configuración.
- [x] Login, navegación superior y módulos persistentes continúan funcionando.

## Implementado en

- Frontend: https://github.com/CICUC-2026/gestion-estudios-frontend/commit/f153111829e3a0df69de66f401b67eb500e8f8de
- Issue: https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/39
- Project 1: `Status=Done`, `Flujo=Done`, verificado el 2026-08-03.
