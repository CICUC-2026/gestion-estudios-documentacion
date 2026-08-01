# HU-005 — Registrar y mantener estudios clínicos

**Tipo:** historia-usuario
**Actor:** coordinador
**Estado:** implementada
**Última actualización:** 2026-07-31
**Feature relacionada:** [Estudios, protocolos y criterios](../../features/backlog/estudios-protocolos.md)
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/8
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **coordinador de estudios**, quiero registrar y mantener una ficha estructurada para conocer el estado, responsables y contexto operativo de cada estudio.

## Criterios de aceptación

- [x] Un usuario autorizado crea un estudio inicialmente en `borrador`.
- [x] Código interno e identificador son únicos dentro de la institución definida.
- [x] La ficha registra título, patrocinador, organización, patología, subtipo, fase, diseño, objetivo, fechas, centro, observaciones y estados.
- [x] Listado y detalle muestran responsable, estado, versión vigente, última revisión y pendientes disponibles.
- [x] Listado admite paginación, búsqueda, filtros y orden explícitos.
- [x] Actualizar y archivar conservan autor, instante, valores anteriores/nuevos y motivo cuando corresponde.
- [x] No se elimina físicamente un estudio desde la API o interfaz.
- [x] Backend deniega creación, edición o lectura fuera del alcance autorizado.

## Impacto sobre funcionalidades existentes

| Funcionalidad | ¿Se toca? | Riesgo | Cómo se protege |
|---|---:|---|---|
| Autenticación | Sí | Medio | Tests de sesión válida, expirada y revocada |
| Autorización | Sí | Alto | Matriz positiva/negativa por acción y alcance |
| Auditoría | Sí | Alto | Tests de creación, actualización y archivo |
| Navegación superior | Sí | Bajo | Playwright desde `Estudios` y regresión móvil |

## Contratos que deben preservarse

- API bajo `/api/v1` y errores estructurados.
- El backend valida permisos y alcance.
- Archivo lógico, nunca borrado físico desde el producto.
- No mostrar cupos o pacientes inexistentes como datos reales.

## No alcance

- versiones y criterios;
- cupos, pacientes, tareas o documentos;
- cambios automáticos de estado;
- importación desde fuentes externas.

## Riesgo clínico/legal

La ficha es administrativa. No debe interpretarse como aprobación del protocolo ni estado regulatorio sin fuente y responsable explícitos.

## Código relacionado

Rutas previstas tras inspeccionar la arquitectura existente:

- `gestion-estudios-backend/app/dominios/estudios/` — modelo, esquemas y servicio.
- `gestion-estudios-backend/app/api/v1/estudios.py` — endpoints REST.
- `gestion-estudios-backend/migrations/versions/` — tablas, restricciones e índices.
- `gestion-estudios-frontend/src/dominios/estudios/` — consultas, listado y formularios.
- `gestion-estudios-frontend/src/rutas/RutasAplicacion.tsx` — rutas protegidas.

## Verificación esperada

- [ ] Migración arriba/abajo sobre PostgreSQL.
- [ ] Tests unitarios, API, permisos y auditoría.
- [ ] ESLint, tipos, tests y build frontend.
- [ ] Playwright de crear, listar, editar y archivar.

## Pruebas de regresión

- [ ] Salud y OpenAPI continúan disponibles.
- [ ] Login, logout y revocación siguen funcionando.
- [ ] Barra horizontal funciona en escritorio y móvil.
