# ADR-005 — Sesiones opacas revocables y contraseñas Argon2

**Estado:** aceptada  
**Fecha:** 2026-07-17

## Contexto

La plataforma necesita expiración y revocación inmediata de sesiones, desactivación administrativa de cuentas y trazabilidad. Los datos que protegerá son sensibles y no existe identidad institucional integrada en la primera versión.

## Decisión

- usar tokens opacos generados criptográficamente;
- almacenar únicamente SHA-256 del token, nunca el token recuperable;
- conservar el token en `sessionStorage` del navegador durante la pestaña;
- validar cuenta activa, revocación y expiración en cada solicitud;
- utilizar Argon2 para contraseñas;
- aplicar bloqueo temporal configurable por intentos fallidos;
- devolver el mismo error público para cuenta inexistente, contraseña incorrecta, cuenta inactiva o bloqueada;
- registrar ingreso, creación, activación, desactivación, revocación y cambio de contraseña en auditoría.

## Consecuencias

- el backend consulta la sesión en cada solicitud protegida;
- la revocación y desactivación tienen efecto inmediato;
- el frontend no puede reconstruir una sesión perdida al cerrar la pestaña;
- la recuperación automática de contraseña requerirá un canal institucional aprobado y una HU posterior;
- los roles clínicos y alcances no quedan resueltos por esta ADR y pertenecen a HU-004.
