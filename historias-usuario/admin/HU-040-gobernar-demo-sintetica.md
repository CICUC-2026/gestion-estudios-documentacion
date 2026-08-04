# HU-040 — Gobernar la demo sintética con acceso administrador

**Tipo:** historia-usuario  
**Actor:** admin  
**Estado:** lista  
**Última actualización:** 2026-08-04  
**Feature relacionada:** [Fundamentos de la plataforma](../../features/en-desarrollo/fundamentos-plataforma.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/43  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **administrador**, quiero administrar todos los recursos sintéticos de la demo para operar y corregir la demostración sin depender de alcances clínicos todavía no aprobados.

## Criterios verificables

- [ ] El administrador puede ejecutar todas las capacidades de pacientes, estudios, tareas, preselección, cupos, exportación y auditoría sintética.
- [ ] Los permisos continúan separados y los usuarios no administradores conservan restricciones por rol.
- [ ] Cada mutación sensible registra autor, fecha, acción, entidad y resultado.
- [ ] Solo se aceptan códigos `PX-DEMO-*`; no existe ingreso de identidad real.
- [ ] Los registros se archivan lógicamente y pueden reiniciarse de forma controlada.

## Impacto, contratos y riesgos

Afecta autorización, auditoría, seeds y operación. El bypass administrativo ya existe y debe cubrirse con regresión. Riesgo: confundirlo con política productiva; la interfaz debe rotular siempre el modo sintético.

## No alcance

- Autorizar pacientes reales o acceso clínico global en producción.
- Desactivar controles o auditoría.

## Código relacionado y verificación

- Backend `app/dominios/autenticacion/`, dependencias de autorización y tests negativos.
- Frontend sesión, navegación y rotulado de demo.
- Tests de administrador, roles restringidos, auditoría y rechazo de códigos no sintéticos.
