# HU-008 — Publicar una versión vigente

**Tipo:** historia-usuario  
**Actor:** investigador  
**Estado:** implementada  
**Última actualización:** 2026-07-31  
**Feature relacionada:** [Estudios, protocolos y criterios](../../features/completadas/estudios-protocolos.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/11  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **investigador principal**, quiero publicar una versión revisada para declarar cuál protocolo y criterios deben usarse en nuevas preselecciones.

## Criterios de aceptación

- [x] Solo una versión completa y autorizada puede publicarse.
- [x] Publicar cambia la versión objetivo a `vigente` y la vigente anterior a `reemplazada` en una transacción.
- [x] Una restricción PostgreSQL / lógica de base de datos impide dos versiones vigentes.
- [x] Versiones y criterios publicados quedan inmutables.
- [x] Se registra responsable, instante, versión anterior, motivo y resultado en auditoría.
- [x] Se marca que existen casos potencialmente pendientes de reevaluación sin modificar evaluaciones históricas.
- [x] La interfaz exige confirmación explícita y muestra el efecto antes de ejecutar.
- [x] Un fallo deja ambas versiones en su estado anterior.

## Impacto sobre funcionalidades existentes

| Funcionalidad | ¿Se toca? | Riesgo | Cómo se protege |
|---|---:|---|---|
| Versiones/criterios | Sí | Alto | Transacción, restricción parcial y concurrencia |
| Permisos | Sí | Alto | Solo capacidad validada de publicación |
| Auditoría | Sí | Alto | Registro atómico y test de rollback |

## Contratos que deben preservarse

- Una única versión vigente por estudio.
- Historial y criterios anteriores no cambian.
- No recalcular ni decidir evaluaciones.
- No enviar notificaciones clínicas críticas automáticamente.

## No alcance

- reevaluar pacientes;
- notificaciones externas;
- firma electrónica o aprobación regulatoria;
- comparación de documentos binarios.

## Riesgo clínico/legal

Publicar afecta futuras revisiones administrativas. Requiere rol validado, confirmación humana, auditoría y recuperación transaccional.

## Código relacionado

- `gestion-estudios-backend/app/dominios/protocolos/` — comando transaccional de publicación.
- `gestion-estudios-backend/app/api/v1/protocolos.py` — endpoint protegido.
- `gestion-estudios-backend/migrations/versions/` — índice único parcial.
- `gestion-estudios-frontend/src/dominios/protocolos/` — confirmación y estado.

## Verificación esperada y regresión

- [ ] Tests de precondición, permiso, concurrencia, rollback e inmutabilidad.
- [ ] Migración y restricción verificadas en PostgreSQL.
- [ ] Playwright de confirmación y publicación.
- [ ] Regresión de versiones anteriores, criterios, sesión y auditoría.
