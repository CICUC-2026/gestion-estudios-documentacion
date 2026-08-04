# HU-042 — Gestionar cupos y reservas sintéticas

**Tipo:** historia-usuario  
**Actor:** enfermeria  
**Estado:** implementada
**Última actualización:** 2026-08-04  
**Feature relacionada:** [Cupos y lista de espera](../../features/backlog/cupos-lista-espera.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/45  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **enfermería en la demo**, quiero confirmar disponibilidad y reservar un cupo para un paciente sintético sin representar elegibilidad clínica.

## Criterios verificables

- [x] `confirmado`, `reservado`, `ocupado` y `pendiente_reconfirmacion` son estados distintos.
- [x] Confirmar registra fuente, responsable y vigencia de 30 días por defecto, configurable entre 15 y 90.
- [x] Reservar vincula un paciente sintético y vence en 30 días por defecto.
- [x] Se advierte siete días antes y el vencimiento nunca reasigna automáticamente.
- [x] Cambios, cancelaciones y renovaciones conservan historial y motivo.
- [x] Enfermería gestiona y administrador puede ejecutar todo; frontend no usa lenguaje de elegibilidad.

## Impacto, contratos y riesgos

Agrega persistencia, API y UI de cupos/reservas. Riesgo: confundir disponibilidad con asignación; ambos conceptos permanecen separados y auditados.

## No alcance

- Reserva clínica, priorización automática o pacientes reales.

## Código relacionado y verificación

- Backend de cupos/reservas, tarea de vencimiento segura y tests de tiempo.
- Frontend con estados, vigencia, avisos y Playwright.

## Evidencia de implementación

- Backend `0c0cf03`: persistencia, migración `20260804_0006`, API, expiración segura y auditoría.
- Frontend `84fd866`: pantalla `/cupos`, reserva, ocupación, reconfirmación y avisos.
- Verificación local: 28 pruebas backend, migración ida/vuelta, Ruff, MyPy, ESLint, TypeScript,
  6 pruebas Vitest, build y 14 escenarios Playwright.
