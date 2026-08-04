# HU-028 — Verificar respaldo y recuperación

**Tipo:** historia-usuario  
**Actor:** admin  
**Estado:** propuesta  
**Bloqueada por:** RPO/RTO, política de retención y arquitectura de respaldo aprobados para EC2/PostgreSQL  
**Última actualización:** 2026-08-04  
**Feature relacionada:** [Reportes y auditoría](../../features/backlog/reportes-auditoria.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/31  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **administrador técnico**, quiero ejecutar y documentar una restauración con datos ficticios para demostrar que base, documentos y auditoría pueden recuperarse coherentemente.

## Criterios de aceptación

- [ ] CICUC aprueba RPO, RTO, retención, responsables y ubicación permitida.
- [ ] Backups están cifrados, con acceso mínimo y sin secretos versionados.
- [ ] Prueba restaura en entorno aislado usando datos ficticios.
- [ ] Base y documentos corresponden a un punto coherente.
- [ ] Se validan migraciones, restricciones, conteos y smoke tests críticos.
- [ ] Se registra tiempo real, evidencia, desviaciones y acciones correctivas.
- [ ] Entorno de restauración se destruye de forma segura.
- [ ] Runbook contempla fallo parcial y escalamiento, sin acoplar aplicación al proveedor.

## Impacto sobre funcionalidades existentes

Infraestructura y todos los datos; riesgo crítico. La prueba nunca usa ni sobrescribe producción.

## Contratos que deben preservarse

- Backup no probado no cuenta como recuperable.
- Ambientes y credenciales separados.
- Datos reales nunca llegan a desarrollo/CI/demo.
- Restauración no altera producción.

## No alcance

- seleccionar proveedor;
- ejecutar sobre producción;
- continuidad institucional completa fuera de la plataforma.

## Riesgo clínico/legal

Pérdida, corrupción o restauración indebida puede afectar continuidad y privacidad. Requiere aprobación institucional e infraestructura aislada.

## Código relacionado

- `gestion-estudios-backend/migrations/` — compatibilidad de esquema.
- configuración de infraestructura futura — scripts/runbooks sin secretos.
- `06-operacion/respaldo-y-recuperacion.md` — procedimiento y evidencia.

## Verificación esperada y regresión

- [ ] Restauración reproducible y smoke tests.
- [ ] Medición RPO/RTO real.
- [ ] Verificación de cifrado, accesos, destrucción y auditoría.
