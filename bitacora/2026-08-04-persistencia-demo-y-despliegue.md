# Bitácora — Persistencia demo y despliegue coordinado

**Fecha:** 2026-08-04

## Resultado

- HU-037 desplegó el backend vigente en EC2 con migraciones y verificación de salud.
- HU-038 reemplazó el almacenamiento local por pacientes sintéticos persistentes en PostgreSQL.
- HU-039 completó creación y actualización de tareas, con vínculos opcionales a paciente o estudio.
- HU-021 quedó completada por el incremento de HU-039.
- ADR-007 permite explícitamente esta demo sintética minimizada sin habilitar pacientes reales.

## Evidencia

- Backend desplegado: `fe8177d00e8f52776bbc33b709199cad013faea6`.
- Frontend desplegado: `955992cf98b1fec1cf920aa5cb43c45e2dccfcb9`.
- CI backend: 21 pruebas, análisis estático, migración y build aprobados.
- CI frontend: ESLint, TypeScript, 6 pruebas unitarias, build y 10 pruebas Playwright aprobados.
- Producción: lectura de pacientes semilla y creación/actualización de una tarea vinculada confirmadas contra la API autenticada.

## Contratos preservados

- Solo códigos `PX-DEMO-*`; sin nombre, RUT, contacto ni fecha de nacimiento.
- Las asociaciones son administrativas y no calculan elegibilidad ni matching.
- Issues #5/#6 siguen siendo obligatorios antes de almacenar o procesar pacientes reales.
