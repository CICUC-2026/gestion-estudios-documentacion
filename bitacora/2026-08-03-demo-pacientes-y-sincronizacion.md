# Bitácora — Demo de pacientes y sincronización

**Fecha:** 2026-08-03

## Resultado

- Se sincronizaron HU-004 a HU-009 y HU-030 a HU-035 en Markdown, issues y Project 1 como `Done`.
- Se implementó HU-036 como prototipo frontend local para casos completamente ficticios.
- HU-010 a HU-018 continúan bloqueadas para persistencia real por Issues #5/#6 y ADR-007.
- La demo permite crear, recargar y reiniciar casos ficticios sin API ni PostgreSQL.

## Evidencia

- Frontend: `f153111829e3a0df69de66f401b67eb500e8f8de`.
- ESLint, TypeScript, Vitest y build aprobados.
- Playwright: 10 pruebas aprobadas y 2 integradas omitidas por configuración.
- Validador de trazabilidad documental aprobado.

## Contratos preservados

- No se solicitan ni almacenan identificadores de personas reales.
- El prototipo se rotula como local, ficticio y no clínico.
- No determina elegibilidad ni resuelve decisiones clínicas o legales pendientes.
