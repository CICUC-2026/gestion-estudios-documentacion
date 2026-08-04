# HU-014 — Asociar un paciente con un estudio

**Tipo:** historia-usuario  
**Actor:** medico  
**Estado:** propuesta  
**Bloqueada por:** Issues #5/#6, aceptación completa de ADR-007 y HU-010/HU-011  
**Última actualización:** 2026-08-04  
**Feature relacionada:** [Preselección manual](../../features/backlog/preseleccion-manual.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/17  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

**Aclaración de alcance:** HU-038 permite una asociación manual exclusivamente sintética y administrativa. Esta HU corresponde a la asociación autorizada de un paciente real y no representa compatibilidad, elegibilidad ni recomendación.

## Historia

Como **médico investigador**, quiero asociar un paciente con un estudio para registrar que el caso requiere revisión administrativa.

## Criterios de aceptación

- [ ] Usuario, paciente y estudio deben estar activos y dentro del alcance autorizado.
- [ ] La relación registra origen, responsable, prioridad operativa, observaciones, última/próxima revisión y estado.
- [ ] Origen usa catálogo validado: comité, consulta, derivación interna/externa, revisión de base, lista de espera u otro justificado.
- [ ] Duplicados activos paciente-estudio se impiden mediante restricción y mensaje no revelador.
- [ ] Prioridad se presenta siempre como operativa, no clínica.
- [ ] Crear, cambiar prioridad o cerrar queda auditado con motivo.
- [ ] La respuesta usa identificación minimizada del paciente.

## Impacto sobre funcionalidades existentes

| Área | Riesgo | Protección |
|---|---|---|
| Pacientes/estudios | Alto | FK, estados activos, permisos cruzados |
| Privacidad | Alto | Serialización mínima y tests de alcance |
| Auditoría | Alto | Eventos de alta, prioridad y cierre |

## Contratos que deben preservarse

- Asociación no implica compatibilidad ni elegibilidad.
- Prioridad es operativa y configurable.
- No confirmar existencia de paciente/estudio fuera de alcance.
- Eliminación lógica e historial.

## No alcance

- crear preselección o revisar criterios;
- cupos o lista de espera funcional;
- sugerencias automáticas.

## Riesgo clínico/legal

Una asociación puede interpretarse erróneamente como recomendación. UI, API y auditoría deben mantener lenguaje administrativo.

## Código relacionado

- `gestion-estudios-backend/app/dominios/preselecciones/` — asociación y reglas.
- `gestion-estudios-backend/app/api/v1/preselecciones.py` — endpoints.
- `gestion-estudios-backend/migrations/versions/` — relación e índice único parcial.
- `gestion-estudios-frontend/src/dominios/preselecciones/` — formulario y lista.

## Verificación esperada y regresión

- [ ] Tests de duplicidad, estados, permisos, minimización y auditoría.
- [ ] Playwright con datos ficticios desde paciente y estudio.
- [ ] Regresión de estudios, pacientes, sesión y navegación.
