# ADR-008 — Gobierno operativo de la demo sintética

**Estado:** aceptada para demo sintética  
**Fecha:** 2026-08-04

## Contexto

CICUC decidió continuar exclusivamente con pacientes sintéticos para completar una demostración funcional sin autorizar tratamiento de personas reales. Se requieren reglas consistentes para permisos, conservación, preselección, cupos y exportación.

## Decisión

- Solo se admiten pacientes ficticios con código `PX-DEMO-*`; no se almacena identidad real.
- El administrador del sistema tiene acceso global a todas las capacidades y recursos de la demo.
- Los permisos permanecen separados técnicamente para permitir una futura política de mínimo privilegio.
- Los demás roles siguen esta asignación provisional: médico registra/revisa; investigador confirma/cierra/reabre; enfermería gestiona cupos/espera; coordinador gestiona operación; auditor consulta trazabilidad.
- Los registros sintéticos y su auditoría se conservan sin vencimiento automático; pueden archivarse y reiniciarse de forma controlada.
- Esta aceptación no resuelve la política de retención ni autorización aplicable a datos reales.

## Cupos y asignación sintética

- `confirmado`: disponibilidad verificada por una persona autorizada; no implica paciente ni elegibilidad.
- `reservado`: cupo apartado administrativamente para un paciente sintético.
- `ocupado`: asignación administrativa confirmada manualmente.
- Confirmaciones y reservas vencen por defecto a los 30 días, configurables entre 15 y 90 días.
- Se advierte siete días antes; al vencer pasan a `pendiente_reconfirmacion` sin borrar ni reasignar automáticamente.

## Exportaciones

- Solo el administrador genera y autoriza exportaciones.
- Puede exportar toda la información sintética autorizada en XLSX, CSV, JSON o TXT.
- “Texto libre” significa un informe compuesto desde campos/filtros permitidos; no habilita SQL ni acceso directo a la base.
- Cada exportación registra finalidad, autor, fecha, filtros, campos, cantidad, formato y hash; la descarga es privada y temporal.

## Consecuencias

La demo puede implementar preselección manual, cupos, lista de espera y exportaciones completas sin representar decisiones clínicas. Issues #5/#6 permanecen abiertos para pacientes reales.
