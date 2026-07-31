# Feature — Reportes y auditoría

**Estado:** backlog  
**Tanda:** 6

## Objetivo

Entregar visibilidad operativa y trazabilidad sobre accesos, modificaciones, transiciones y exportaciones.

## Dependencias

- HU-004 y matriz de alcance aprobada;
- dominios fuente implementados y auditados;
- ADR-007 y política de minimización/retención aceptadas;
- finalidad y formatos de exportación aprobados;
- objetivos de recuperación y continuidad definidos.

## HUs

- HU-024 — Consultar auditoría autorizada.
- HU-025 — Consultar reportes operativos.
- HU-026 — Exportar información autorizada.
- HU-027 — Endurecer seguridad, accesibilidad y calidad.
- HU-028 — Verificar respaldo y recuperación.

## Contratos

- auditoría no se modifica desde la interfaz convencional;
- reportes aplican los mismos permisos y alcance que los datos fuente;
- exportar requiere capacidad adicional, justificación y auditoría;
- archivos exportados nunca se enlazan públicamente ni permanecen indefinidamente;
- métricas son operativas, no interpretaciones clínicas.

Todo reporte debe minimizar datos, respetar alcance institucional y auditar las exportaciones sensibles.
