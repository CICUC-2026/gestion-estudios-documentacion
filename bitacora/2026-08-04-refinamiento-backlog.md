# Bitácora — Refinamiento integral del backlog

**Fecha:** 2026-08-04

## Resultado

- Se revisaron las 18 HUs en `Todo/Backlog` y HU-025 en desarrollo contra Project 1, ADR-007 y los incrementos desplegados.
- Se eliminaron dependencias documentales hacia HUs ya implementadas.
- HU-010 a HU-014 quedaron explícitamente acotadas a pacientes reales; HU-038 conserva el alcance sintético de demo.
- Las features de pacientes y tareas se marcaron como implementación parcial.
- HU-029 quedó refinada y pasó a `Todo/Ready`; el resto conserva bloqueos institucionales o dependencias funcionales explícitas.

## Decisiones que continúan pendientes

- Issue #5: validación institucional de roles y alcances clínicos.
- Issue #6: tratamiento, minimización, retención y disposición de datos reales.
- Issue #7: identidad visual oficial; no bloquea implementar accesibilidad con tokens reemplazables.

## Contratos preservados

- La demo sintética no autoriza pacientes reales.
- Las asociaciones no implican elegibilidad ni recomendación.
- Ninguna HU bloqueada se movió a `Ready` sin resolver su dependencia.
