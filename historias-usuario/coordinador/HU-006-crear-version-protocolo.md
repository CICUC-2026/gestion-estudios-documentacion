# HU-006 — Crear versiones de protocolo

**Tipo:** historia-usuario  
**Actor:** coordinador  
**Estado:** propuesta  
**Última actualización:** 2026-07-17  
**Feature relacionada:** [Estudios, protocolos y criterios](../../features/backlog/estudios-protocolos.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/9  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **coordinador de estudios**, quiero crear y preparar versiones de protocolo para mantener cambios ordenados sin alterar el historial.

## Criterios de aceptación

- [ ] Una versión pertenece a un único estudio y comienza en `borrador`.
- [ ] Registra nombre/número, fecha oficial, fecha de carga, autor, observaciones, resumen, motivo y versión reemplazada propuesta.
- [ ] Número o nombre de versión es único por estudio.
- [ ] Solo `borrador` y `en_revision` admiten edición autorizada.
- [ ] Una versión puede copiar criterios desde otra versión del mismo estudio, creando identificadores nuevos y conservando origen.
- [ ] No es obligatorio adjuntar el protocolo completo.
- [ ] Toda creación, edición, copia y cambio a revisión queda auditado.

## Impacto sobre funcionalidades existentes

| Funcionalidad | ¿Se toca? | Riesgo | Cómo se protege |
|---|---:|---|---|
| Estudios | Sí | Alto | FK, permisos por estudio y tests de detalle |
| Autenticación/autorización | Sí | Alto | Tests negativos por rol/alcance |
| Auditoría | Sí | Alto | Comparar valores y autor por mutación |

## Contratos que deben preservarse

- No modificar versiones `vigente`, `reemplazada` o `archivada`.
- Copiar no comparte filas mutables entre versiones.
- Sin documento completo cuando la política no lo autorice.
- Ninguna extracción automática o IA.

## No alcance

- publicación como vigente;
- comparación visual;
- reevaluación de pacientes;
- notificaciones externas.

## Riesgo clínico/legal

Una versión en borrador no representa protocolo aprobado. La interfaz debe mostrar estado y autor de forma inequívoca.

## Código relacionado

- `gestion-estudios-backend/app/dominios/protocolos/` — modelos y servicio.
- `gestion-estudios-backend/app/api/v1/protocolos.py` — endpoints.
- `gestion-estudios-backend/migrations/versions/` — versión y restricciones.
- `gestion-estudios-frontend/src/dominios/protocolos/` — lista y formulario.

## Verificación esperada y regresión

- [ ] Migración PostgreSQL arriba/abajo.
- [ ] Tests de unicidad, estados editables, copia profunda, permisos y auditoría.
- [ ] Tests frontend y Playwright desde detalle del estudio.
- [ ] Regresión de estudio, sesión y navegación.
