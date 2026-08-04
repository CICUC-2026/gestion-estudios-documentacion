# HU-038 — Gestionar pacientes sintéticos persistentes

**Tipo:** historia-usuario  
**Actor:** medico  
**Estado:** implementada  
**Última actualización:** 2026-08-04  
**Feature relacionada:** [Pacientes y datos estructurados](../../features/backlog/pacientes-datos-estructurados.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/41  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **médico investigador en la demo**, quiero crear, editar, listar y archivar pacientes sintéticos, registrar antecedentes ficticios y asociarlos manualmente con estudios para demostrar un flujo administrativo persistente.

## Contexto y criterios verificables

- [x] PostgreSQL persiste paciente sintético con UUID, código `PX-DEMO-*`, rango etario, patología y estado administrativo.
- [x] API permite listar, crear, consultar, editar y archivar lógicamente.
- [x] Se pueden registrar diagnósticos y biomarcadores ficticios con fecha y fuente.
- [x] Se puede asociar manualmente un paciente con un estudio sin implicar compatibilidad ni elegibilidad.
- [x] Mutaciones se auditan y backend exige roles autorizados.
- [x] Frontend consume la API, informa errores y no usa `localStorage` como fuente de verdad.
- [x] Existe reinicio reproducible de datos sintéticos de demo.

## Impacto, contratos, permisos y riesgos

Impacta modelos, migración, API, frontend y datos demo. Solo médico, coordinador e investigador autorizados mutan; usuarios autenticados pueden consultar datos minimizados según esta demo. Cada pantalla indica “sintético/no clínico”. Riesgo: uso de datos reales o interpretación clínica; se rechazan códigos fuera de `PX-DEMO-*` y no se almacenan identidad, RUT, contacto ni fecha de nacimiento.

## No alcance

- Pacientes reales, identidad o ficha clínica.
- Recomendación, elegibilidad, matching o inferencia.
- Resolver Issues #5/#6 para operación clínica.

## Código relacionado y verificación

- Backend `app/dominios/pacientes/`, rutas, migración y tests.
- Frontend `src/dominios/pacientes/`, páginas y Playwright.
- Migración arriba/abajo; pruebas de permisos, auditoría, minimización y regresión.

## Evidencia de implementación

- Backend: `b51eb4e` a `fe8177d00e8f52776bbc33b709199cad013faea6`.
- Frontend: `3acdda8` a `955992cf98b1fec1cf920aa5cb43c45e2dccfcb9`.
- [Validación backend](https://github.com/CICUC-2026/gestion-estudios-backend/actions/runs/30941868570) y [validación frontend](https://github.com/CICUC-2026/gestion-estudios-frontend/actions/runs/30942456274) aprobadas.
- Verificación productiva autenticada: dos pacientes semilla recuperados desde PostgreSQL.
