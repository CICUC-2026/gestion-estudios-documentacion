# HU-042 — Gestionar cupos y reservas sintéticas

**Tipo:** historia-usuario  
**Actor:** enfermeria  
**Estado:** lista  
**Última actualización:** 2026-08-04  
**Feature relacionada:** [Cupos y lista de espera](../../features/backlog/cupos-lista-espera.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/45  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **enfermería en la demo**, quiero confirmar disponibilidad y reservar un cupo para un paciente sintético sin representar elegibilidad clínica.

## Criterios verificables

- [ ] `confirmado`, `reservado`, `ocupado` y `pendiente_reconfirmacion` son estados distintos.
- [ ] Confirmar registra fuente, responsable y vigencia de 30 días por defecto, configurable entre 15 y 90.
- [ ] Reservar vincula un paciente sintético y vence en 30 días por defecto.
- [ ] Se advierte siete días antes y el vencimiento nunca reasigna automáticamente.
- [ ] Cambios, cancelaciones y renovaciones conservan historial y motivo.
- [ ] Enfermería gestiona y administrador puede ejecutar todo; frontend no usa lenguaje de elegibilidad.

## Impacto, contratos y riesgos

Agrega persistencia, API y UI de cupos/reservas. Riesgo: confundir disponibilidad con asignación; ambos conceptos permanecen separados y auditados.

## No alcance

- Reserva clínica, priorización automática o pacientes reales.

## Código relacionado y verificación

- Backend de cupos/reservas, tarea de vencimiento segura y tests de tiempo.
- Frontend con estados, vigencia, avisos y Playwright.
