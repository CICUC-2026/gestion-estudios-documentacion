# Feature — Pacientes y datos estructurados

**Estado:** implementación parcial; alcance real bloqueado  
**Tanda:** 3

## Objetivo

Registrar el mínimo de datos necesarios, separando información identificatoria, clínica y operativa. Cada dato clínico debe conservar fecha, fuente, autor y estado de verificación.

## Dependencias bloqueantes

- Issue #5: validar roles y alcances.
- Issue #6: validar fundamento, minimización, retención y disposición.
- ADR-007: aceptada solo para demo sintética; el alcance con datos reales continúa propuesto.

## HUs propuestas

- HU-010 — Registrar un paciente con datos mínimos.
- HU-011 — Consultar pacientes con identificación minimizada.
- HU-012 — Registrar diagnóstico y biomarcadores estructurados.
- HU-013 — Registrar antecedentes terapéuticos y datos clínicos fechados.

## Incremento de demostración implementado

- HU-036 — prototipo local histórico con casos ficticios, reemplazado como fuente de verdad.
- HU-038 — pacientes sintéticos `PX-DEMO-*`, diagnósticos/biomarcadores ficticios y asociaciones administrativas persistentes en PostgreSQL.

HU-038 no desbloquea las HUs clínicas ni resuelve Issues #5/#6. HU-010 a HU-013 corresponden exclusivamente al futuro tratamiento autorizado de pacientes y datos clínicos reales.

## Contratos

- identificadores, datos clínicos y operación se consultan mediante permisos separados;
- listados no exponen nombres completos, contacto ni identificador institucional por defecto;
- todo dato clínico conserva fecha, fuente, autor y estado de verificación;
- no reemplaza la ficha clínica;
- no calcula elegibilidad ni interpreta automáticamente resultados;
- eliminación lógica y accesos auditables.

Requiere validación legal y operacional sobre fundamento, retención y acceso antes de implementación.
