# HU-015 — Crear una preselección manual ligada a versión

**Tipo:** historia-usuario  
**Actor:** medico  
**Estado:** propuesta  
**Bloqueada por:** HU-004, HU-006/HU-008, HU-014 y validación del flujo  
**Última actualización:** 2026-07-17  
**Feature relacionada:** [Preselección manual](../../features/backlog/preseleccion-manual.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/18  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **médico investigador**, quiero iniciar una preselección manual usando una versión específica para mantener trazabilidad sobre los criterios revisados.

## Criterios de aceptación

- [ ] Se crea desde una asociación paciente-estudio activa.
- [ ] Por defecto usa la versión vigente, mostrándola antes de confirmar.
- [ ] Elegir otra versión requiere capacidad y motivo explícitos.
- [ ] Registra responsable, fecha, estado inicial, próxima acción/revisión y versión inmutable.
- [ ] No copia resultados de evaluaciones anteriores.
- [ ] Dos preselecciones activas equivalentes se impiden según regla validada.
- [ ] Crear queda auditado sin duplicar datos identificatorios.

## Impacto sobre funcionalidades existentes

| Área | Riesgo | Protección |
|---|---|---|
| Versiones | Alto | FK inmutable y test de reemplazo posterior |
| Asociación/paciente | Alto | Alcance cruzado y mínimo dato |
| Auditoría | Alto | Autor, versión, fecha y origen |

## Contratos que deben preservarse

- La versión utilizada nunca cambia en una preselección existente.
- Una nueva versión no altera evaluaciones históricas.
- Estado inicial administrativo, sin conclusión.
- Sin IA ni precarga automática de resultados.

## No alcance

- evaluación de criterios;
- resumen o cierre;
- reevaluación automática.

## Riesgo clínico/legal

Usar una versión incorrecta puede invalidar la revisión administrativa. Debe mostrarse claramente y conservarse en auditoría.

## Código relacionado

- `gestion-estudios-backend/app/dominios/preselecciones/` — entidad y creación.
- `gestion-estudios-backend/app/api/v1/preselecciones.py` — endpoint protegido.
- `gestion-estudios-backend/migrations/versions/` — FK e índices.
- `gestion-estudios-frontend/src/dominios/preselecciones/` — inicio y confirmación.

## Verificación esperada y regresión

- [ ] Tests de versión vigente/no vigente, duplicidad, permisos y auditoría.
- [ ] Test que una publicación posterior no modifica la preselección.
- [ ] Playwright de confirmación con versión visible.
