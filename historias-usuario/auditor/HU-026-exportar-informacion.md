# HU-026 — Exportar información autorizada

**Tipo:** historia-usuario  
**Actor:** auditor  
**Estado:** propuesta  
**Bloqueada por:** Issue #6, aceptación completa de ADR-007, finalización de HU-025 y política de exportación  
**Última actualización:** 2026-08-04  
**Feature relacionada:** [Reportes y auditoría](../../features/backlog/reportes-auditoria.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/29  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **usuario expresamente autorizado**, quiero exportar un reporte mínimo y trazable para una finalidad aprobada, con descarga privada y temporal.

## Criterios de aceptación

- [ ] Exportar requiere capacidad adicional a consultar y una finalidad registrada.
- [ ] Usuario confirma filtros, columnas, alcance y advertencia antes de generar.
- [ ] Backend vuelve a aplicar permisos y minimización, sin confiar en el frontend.
- [ ] CSV neutraliza celdas que podrían ejecutar fórmulas; otros formatos requieren HU/validación específica.
- [ ] Archivo se almacena privado, cifrado según infraestructura, con enlace temporal y expiración.
- [ ] Solicitud y cada descarga registran autor, filtros, cantidad, finalidad, resultado y huella.
- [ ] Nombre, URL y logs no contienen datos sensibles.
- [ ] Archivo expirado no puede descargarse y se elimina según política.

## Impacto sobre funcionalidades existentes

| Área | Riesgo | Protección |
|---|---|---|
| Privacidad/permisos | Alto | Capacidad separada y revisión backend |
| Auditoría | Alto | Solicitud/descarga/resultado |
| Storage | Alto | Privado, temporal, sin URL pública |

## Contratos que deben preservarse

- Exportación explícita, justificada y auditada.
- Mínimo dato y alcance backend.
- Sin correo o distribución automática.
- Retención temporal aprobada.

## No alcance

- PDF/XLSX iniciales;
- envíos programados;
- enlaces compartibles;
- exportaciones masivas sin límite.

## Riesgo clínico/legal

Riesgo crítico de exfiltración y reidentificación. No implementar hasta aprobar finalidad, campos, retención, infraestructura y respuesta ante incidentes.

## Código relacionado

- `gestion-estudios-backend/app/dominios/exportaciones/` — generación y ciclo de vida.
- `gestion-estudios-backend/app/api/v1/exportaciones.py` — solicitud/descarga.
- `gestion-estudios-backend/migrations/versions/` — registro y expiración.
- `gestion-estudios-frontend/src/dominios/exportaciones/` — confirmación y estado.

## Verificación esperada y regresión

- [ ] Tests de permisos, minimización, CSV injection, expiración y auditoría.
- [ ] Tests que no existen URL pública, secreto o PII en logs/nombre.
- [ ] Playwright de confirmación y descarga temporal con datos ficticios.
