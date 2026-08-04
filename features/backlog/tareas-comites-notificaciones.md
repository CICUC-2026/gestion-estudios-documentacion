# Feature — Tareas, comités y notificaciones

**Estado:** implementación parcial  
**Tanda:** 5

## Objetivo

Registrar tareas, responsables, acuerdos de comité y recordatorios internos vinculados a estudios o casos autorizados.

## HUs

- HU-021 — Gestionar tareas y seguimiento: implementada y ampliada por HU-039.
- HU-022 — Registrar reuniones y acuerdos de comité.
- HU-023 — Recibir notificaciones internas.

## Dependencias pendientes

- HU-022 requiere validar alcance documental y roles para comités; si incluye pacientes reales, también Issues #5/#6 y ADR-007 completa.
- HU-023 requiere un catálogo aprobado de eventos, destinatarios y visibilidad.
- Las tareas persistentes y sus vínculos sintéticos ya no son bloqueo para estas historias.

## Contratos

- una tarea no constituye orden clínica ni ejecución automática;
- el comité registrado no reemplaza acta o documentación clínica oficial;
- notificaciones son internas, informativas y no críticas;
- visibilidad hereda los permisos del recurso vinculado;
- no enviar correo, SMS, mensajería ni push externo en esta etapa.

No incluye automatización de comunicaciones clínicas críticas ni envío externo sin una decisión posterior.
