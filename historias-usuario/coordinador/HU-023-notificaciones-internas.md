# HU-023 — Recibir notificaciones internas

**Tipo:** historia-usuario
**Actor:** coordinador
**Estado:** propuesta
**Bloqueada por:** HU-004, HU-021 y catálogo de eventos validado
**Última actualización:** 2026-07-17
**Feature relacionada:** [Tareas, comités y notificaciones](../../features/backlog/tareas-comites-notificaciones.md)
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/26
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **coordinador de estudios**, quiero una bandeja interna de avisos operativos para identificar trabajo pendiente sin recibir decisiones o alertas clínicas automáticas.

## Criterios de aceptación

- [ ] Eventos permitidos usan catálogo aprobado: asignación/vencimiento de tarea y cambios operativos explícitos.
- [ ] Notificación contiene mínimo dato y enlace autorizado, nunca información clínica en el título.
- [ ] Abrir enlace vuelve a validar permisos; la notificación no concede acceso.
- [ ] Usuario puede marcar leída/no leída y consultar fecha/origen.
- [ ] Desactivar o perder acceso impide ver contexto aunque exista un aviso previo.
- [ ] Generación es idempotente para evitar duplicados.
- [ ] No se envía por correo, SMS, mensajería o push externo.

## Impacto sobre funcionalidades existentes

| Área | Riesgo | Protección |
|---|---|---|
| Permisos/privacidad | Alto | Revalidación y contenido mínimo |
| Tareas/cupos | Medio | Eventos explícitos e idempotencia |
| Barra superior | Bajo | Contador accesible y tests |

## Contratos que deben preservarse

- Aviso informativo interno, no alerta clínica.
- No concede permisos ni incluye datos sensibles en título.
- Sin canales externos.
- Idempotencia y auditoría de lectura cuando aplique.

## No alcance

- correo, SMS, WhatsApp o push;
- notificaciones críticas;
- escalamiento automático;
- preferencias complejas.

## Riesgo clínico/legal

El contenido puede exponerse en pantalla compartida. Debe minimizarse y validarse con responsables de privacidad.

## Código relacionado

- `gestion-estudios-backend/app/dominios/notificaciones/` — eventos y bandeja.
- `gestion-estudios-backend/app/api/v1/notificaciones.py` — endpoints.
- `gestion-estudios-backend/migrations/versions/` — notificaciones e idempotencia.
- `gestion-estudios-frontend/src/dominios/notificaciones/` — bandeja y contador superior.

## Verificación esperada y regresión

- [ ] Tests de idempotencia, mínimo dato, permisos revocados y estados leído/no leído.
- [ ] Test que no se invoca canal externo.
- [ ] Playwright de contador y bandeja accesible.
