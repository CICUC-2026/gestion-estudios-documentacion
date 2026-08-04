# HU-043 — Exportar información sintética autorizada

**Tipo:** historia-usuario  
**Actor:** admin  
**Estado:** lista  
**Última actualización:** 2026-08-04  
**Feature relacionada:** [Reportes y auditoría](../../features/backlog/reportes-auditoria.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/46  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **administrador**, quiero exportar toda la información sintética de la demo en formatos estructurados o texto para preparar demostraciones y respaldos verificables.

## Criterios verificables

- [ ] Solo administrador autoriza y genera exportaciones.
- [ ] Formatos: XLSX, CSV, JSON y TXT compuesto desde campos/filtros permitidos.
- [ ] Puede incluir pacientes sintéticos, antecedentes ficticios, estudios, asociaciones, tareas, preselecciones y cupos.
- [ ] Registra finalidad, autor, fecha, filtros, campos, cantidad, formato y hash.
- [ ] Descarga privada, temporal y sin SQL ni acceso directo a base de datos.
- [ ] Se rechaza cualquier registro que no cumpla el contrato sintético.

## Impacto, contratos y riesgos

Afecta reportes, autorización, auditoría y generación de archivos. Riesgo de crear un canal futuro para datos reales; el endpoint valida modo demo y contenido sintético.

## No alcance

- Exportación de pacientes reales o enlaces públicos permanentes.

## Código relacionado y verificación

- Backend de exportación y auditoría; frontend de selección/descarga.
- Tests de formatos, permisos, contenido, expiración y Playwright.
