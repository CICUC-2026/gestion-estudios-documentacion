# HU-040 — Gobernar la demo sintética con acceso administrador

**Tipo:** historia-usuario  
**Actor:** admin  
**Estado:** implementada  
**Última actualización:** 2026-08-04  
**Feature relacionada:** [Fundamentos de la plataforma](../../features/en-desarrollo/fundamentos-plataforma.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/43  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **administrador**, quiero administrar todos los recursos sintéticos de la demo para operar y corregir la demostración sin depender de alcances clínicos todavía no aprobados.

## Criterios verificables

- [x] El administrador omite restricciones por rol en todas las capacidades disponibles y futuras protegidas por `requerir_roles`.
- [x] Los permisos continúan separados y los usuarios no administradores conservan restricciones por rol.
- [x] Cada mutación sensible disponible registra autor, fecha, acción, entidad y resultado.
- [x] Solo se aceptan códigos `PX-DEMO-*`; no existe ingreso de identidad real.
- [x] Los registros se archivan lógicamente y los seeds se restauran de forma idempotente y controlada.

## Impacto, contratos y riesgos

Afecta autorización, auditoría, seeds y operación. El bypass administrativo ya existe y debe cubrirse con regresión. Riesgo: confundirlo con política productiva; la interfaz debe rotular siempre el modo sintético.

## No alcance

- Autorizar pacientes reales o acceso clínico global en producción.
- Desactivar controles o auditoría.

## Código relacionado y verificación

- Backend `app/dominios/autenticacion/`, dependencias de autorización y tests negativos.
- Frontend sesión, navegación y rotulado de demo.
- Tests de administrador, roles restringidos, auditoría y rechazo de códigos no sintéticos.

## Evidencia

- Backend: bypass administrativo genérico en `requerir_roles`, archivo lógico, auditoría y carga idempotente desplegados hasta `fe8177d00e8f52776bbc33b709199cad013faea6`.
- Frontend: rotulado persistente de datos de demostración desplegado hasta `955992cf98b1fec1cf920aa5cb43c45e2dccfcb9`.
- Verificación 2026-08-04: 4 pruebas backend de roles/pacientes y 3 pruebas frontend de layout aprobadas; TypeScript aprobado.
