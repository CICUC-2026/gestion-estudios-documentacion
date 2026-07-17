# HU-022 — Registrar reuniones y acuerdos de comité

**Tipo:** historia-usuario  
**Actor:** coordinador  
**Estado:** propuesta  
**Bloqueada por:** HU-004, ADR-007 y validación del alcance documental  
**Última actualización:** 2026-07-17  
**Feature relacionada:** [Tareas, comités y notificaciones](../../features/backlog/tareas-comites-notificaciones.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/25  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **coordinador de estudios**, quiero registrar una reunión de comité, casos, acuerdos y responsables para dar seguimiento administrativo sin reemplazar el acta clínica oficial.

## Criterios de aceptación

- [ ] Reunión registra nombre, fecha, participantes autorizados y estado.
- [ ] Cada caso vincula paciente minimizado, estudios considerados, acuerdo administrativo, faltantes, responsable y seguimiento.
- [ ] Participantes no obtienen acceso por aparecer en el registro.
- [ ] Acuerdos no usan estados de elegibilidad ni sustituyen decisión formal.
- [ ] Cerrar reunión vuelve inmutable su contenido; correcciones son anexos auditados.
- [ ] Tareas pueden crearse manualmente desde acuerdos con confirmación.
- [ ] No se almacenan transcripciones ni grabaciones.

## Impacto sobre funcionalidades existentes

| Área | Riesgo | Protección |
|---|---|---|
| Pacientes/estudios | Alto | Mínimo dato y permisos independientes |
| Tareas | Medio | Creación manual confirmada |
| Auditoría | Alto | Cierre y anexos inmutables |

## Contratos que deben preservarse

- No reemplaza acta o ficha clínica oficial.
- Participación no concede permisos.
- Sin transcripción, grabación o resumen automático.
- Cierre inmutable y corrección mediante anexo.

## No alcance

- videoconferencia;
- firma electrónica;
- decisiones clínicas automatizadas;
- archivos del acta oficial.

## Riesgo clínico/legal

El registro puede contener información sensible y ser confundido con documentación oficial. Alcance, retención y acceso deben validarse.

## Código relacionado

- `gestion-estudios-backend/app/dominios/comites/` — reunión, casos y anexos.
- `gestion-estudios-backend/app/api/v1/comites.py` — endpoints.
- `gestion-estudios-backend/migrations/versions/` — entidades e historial.
- `gestion-estudios-frontend/src/dominios/comites/` — registro y detalle.

## Verificación esperada y regresión

- [ ] Tests de permisos, cierre, anexos, mínimo dato y auditoría.
- [ ] Test que participantes no ganan acceso.
- [ ] Playwright de reunión, caso, tarea confirmada y cierre.
