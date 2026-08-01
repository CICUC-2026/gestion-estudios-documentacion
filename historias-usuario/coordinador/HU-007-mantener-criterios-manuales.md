# HU-007 — Mantener criterios manuales de una versión

**Tipo:** historia-usuario
**Actor:** coordinador
**Estado:** implementada
**Última actualización:** 2026-07-31
**Feature relacionada:** [Estudios, protocolos y criterios](../../features/backlog/estudios-protocolos.md)
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/10
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **coordinador de estudios**, quiero ingresar y ordenar manualmente criterios de inclusión y exclusión para preparar una versión revisable por el equipo responsable.

## Criterios de aceptación

- [x] Cada criterio pertenece a una versión y registra tipo, categoría, título, descripción, obligatoriedad, orden, estado, fuente, observaciones e instrucciones internas.
- [x] El tipo solo puede ser `inclusion` o `exclusion`.
- [x] Crear, editar, reordenar y desactivar solo está permitido mientras la versión sea editable.
- [x] El orden es estable, único dentro de tipo/versión y se actualiza transaccionalmente.
- [x] Puede marcarse como crítico y como requeridor de respaldo, sin producir decisión automática.
- [x] Fuente o sección del protocolo es obligatoria antes de enviar la versión a revisión.
- [x] Toda mutación queda auditada.
- [x] La interfaz diferencia visual y textualmente inclusión, exclusión, desactivado y crítico.

## Impacto sobre funcionalidades existentes

| Funcionalidad | ¿Se toca? | Riesgo | Cómo se protege |
|---|---:|---|---|
| Versiones | Sí | Alto | Inmutabilidad y tests de estado |
| Auditoría | Sí | Alto | Tests por operación y reordenamiento |
| Navegación | Sí | Medio | Flujo estudio → versión → criterios |

## Contratos que deben preservarse

- Los criterios son entrada manual humana.
- Una versión publicada y sus criterios son inmutables.
- `crítico` no significa elegibilidad ni recomendación.
- Texto visible en español; valores persistidos se documentan y versionan.

## No alcance

- evaluación contra pacientes;
- extracción desde PDF;
- interpretación de texto clínico;
- documentos de respaldo funcionales.

## Riesgo clínico/legal

La digitación puede contener errores. Debe existir revisión humana antes de publicar y siempre mostrarse la fuente del criterio.

## Código relacionado

- `gestion-estudios-backend/app/dominios/criterios/` — modelo y reglas.
- `gestion-estudios-backend/app/api/v1/criterios.py` — endpoints.
- `gestion-estudios-backend/migrations/versions/` — criterios, orden y restricciones.
- `gestion-estudios-frontend/src/dominios/criterios/` — editor manual accesible.

## Verificación esperada y regresión

- [ ] Tests de tipo/categoría, orden transaccional, estado de versión, permisos y auditoría.
- [ ] Tests de formulario, teclado y estados visuales.
- [ ] Playwright de alta, edición, orden y desactivación.
- [ ] Regresión de versiones y autenticación.
