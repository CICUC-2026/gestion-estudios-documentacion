# HU-011 — Consultar pacientes con identificación minimizada

**Tipo:** historia-usuario  
**Actor:** medico  
**Estado:** propuesta  
**Bloqueada por:** Issues #5 y #6; ADR-007 pendiente de aceptación  
**Última actualización:** 2026-07-17  
**Feature relacionada:** [Pacientes y datos estructurados](../../features/backlog/pacientes-datos-estructurados.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/14  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **médico investigador**, quiero buscar y consultar los casos dentro de mi alcance mostrando solo la identificación necesaria para trabajar con seguridad.

## Criterios de aceptación

- [ ] Listado paginado muestra por defecto código interno, edad calculada, patología, estado y responsable.
- [ ] Nombres, contacto e identificador institucional no forman parte del contrato de listado general.
- [ ] Búsqueda identificatoria usa un endpoint/capacidad separados y queda auditada.
- [ ] Filtros y orden no permiten inferir registros fuera del alcance autorizado.
- [ ] Un recurso fuera de alcance devuelve un error sin confirmar su existencia.
- [ ] El frontend conserva filtros al entrar y volver del detalle.
- [ ] Los estados archivados se ocultan por defecto y requieren filtro autorizado.

## Impacto sobre funcionalidades existentes

| Funcionalidad | ¿Se toca? | Riesgo | Cómo se protege |
|---|---:|---|---|
| Permisos | Sí | Alto | Tests contra enumeración e inferencia |
| Auditoría | Sí | Alto | Test de búsqueda/acceso identificatorio |
| Layout horizontal | Sí | Medio | Tabla amplia, responsive y teclado |

## Contratos que deben preservarse

- Mínimo dato por defecto.
- Error uniforme para inexistente o fuera de alcance.
- Paginación, filtros y orden explícitos.
- Sin exportación incluida.

## No alcance

- alta o edición;
- ficha clínica completa;
- exportaciones;
- búsqueda automática de compatibilidad.

## Riesgo clínico/legal

**Bloqueante:** requiere ADR-007 y Issues #5/#6. La minimización debe validarse con usuarios para evitar identificación errónea sin ampliar exposición.

## Código relacionado

- `gestion-estudios-backend/app/dominios/pacientes/` — consultas por alcance.
- `gestion-estudios-backend/app/api/v1/pacientes.py` — contratos de lista/detalle/identidad.
- `gestion-estudios-frontend/src/dominios/pacientes/` — tabla y filtros.

## Verificación esperada y pruebas de regresión

- [ ] Tests de serialización mínima, enumeración, filtros, paginación y permisos.
- [ ] Auditoría de consulta identificatoria.
- [ ] Playwright escritorio/móvil y navegación atrás.
- [ ] Regresión de login, sesión revocada y barra superior.
