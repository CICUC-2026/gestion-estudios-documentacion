# HU-024 — Consultar auditoría autorizada

**Tipo:** historia-usuario  
**Actor:** auditor  
**Estado:** propuesta  
**Bloqueada por:** Issue #5, catálogo de eventos consultables y política de retención  
**Última actualización:** 2026-08-04  
**Feature relacionada:** [Reportes y auditoría](../../features/backlog/reportes-auditoria.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/27  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **auditor autorizado**, quiero consultar eventos inmutables dentro de mi alcance para reconstruir quién realizó una acción, cuándo, sobre qué entidad y con qué resultado.

## Criterios de aceptación

- [ ] Consulta paginada filtra por fecha, acción, entidad, resultado y usuario autorizado.
- [ ] Acceso a auditoría exige capacidad y alcance específicos; auditor no modifica eventos ni datos fuente.
- [ ] Evento registra actor, acción, entidad/ID, fecha, IP cuando corresponda, anterior/nuevo minimizados, contexto y resultado.
- [ ] Credenciales, tokens, hash, documentos y datos clínicos innecesarios nunca forman parte del evento.
- [ ] La consulta de auditoría queda auditada sin recursión ilimitada.
- [ ] No existe endpoint convencional de editar o borrar eventos.
- [ ] Filtros no permiten enumerar recursos fuera de alcance.

## Impacto sobre funcionalidades existentes

| Área | Riesgo | Protección |
|---|---|---|
| Auditoría inicial | Alto | Migración compatible e inmutabilidad |
| Permisos/privacidad | Alto | Tests negativos y minimización |
| Rendimiento | Medio | Índices, paginación y límites |

## Contratos que deben preservarse

- Inmutabilidad desde interfaz/API convencional.
- Sin secretos ni datos sensibles innecesarios.
- Alcance reconstruido en backend.
- Paginación y límites obligatorios.

## No alcance

- exportación;
- SIEM o integración externa;
- modificación, purga o retención automática.

## Riesgo clínico/legal

La auditoría también es sensible y puede revelar patrones de atención. Alcance y retención deben aprobarse antes de implementación.

## Código relacionado

- `gestion-estudios-backend/app/dominios/auditoria/` — consulta y serialización.
- `gestion-estudios-backend/app/api/v1/auditoria.py` — endpoint de solo lectura.
- `gestion-estudios-backend/migrations/versions/` — índices y evolución del registro actual.
- `gestion-estudios-frontend/src/dominios/auditoria/` — tabla y filtros.

## Verificación esperada y regresión

- [ ] Tests de inmutabilidad, alcance, minimización, filtros y volumen.
- [ ] Test de ausencia de secretos/tokens.
- [ ] Playwright de consulta accesible.
- [ ] Regresión de eventos de autenticación ya implementados.
