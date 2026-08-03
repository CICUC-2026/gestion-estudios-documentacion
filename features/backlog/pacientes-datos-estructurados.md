# Feature — Pacientes y datos estructurados

**Estado:** backlog  
**Tanda:** 3

## Objetivo

Registrar el mínimo de datos necesarios, separando información identificatoria, clínica y operativa. Cada dato clínico debe conservar fecha, fuente, autor y estado de verificación.

## Dependencias bloqueantes

- Issue #5: validar roles y alcances.
- Issue #6: validar fundamento, minimización, retención y disposición.
- ADR-007: permanece `propuesta` hasta completar la validación clínica, legal y de seguridad.

## HUs propuestas

- HU-010 — Registrar un paciente con datos mínimos.
- HU-011 — Consultar pacientes con identificación minimizada.
- HU-012 — Registrar diagnóstico y biomarcadores estructurados.
- HU-013 — Registrar antecedentes terapéuticos y datos clínicos fechados.

## Prototipo de demostración permitido

- HU-036 — Prototipo local con casos completamente ficticios, implementado sin API ni persistencia de servidor.

HU-036 no desbloquea las HUs clínicas ni resuelve las decisiones pendientes.

## Contratos

- identificadores, datos clínicos y operación se consultan mediante permisos separados;
- listados no exponen nombres completos, contacto ni identificador institucional por defecto;
- todo dato clínico conserva fecha, fuente, autor y estado de verificación;
- no reemplaza la ficha clínica;
- no calcula elegibilidad ni interpreta automáticamente resultados;
- eliminación lógica y accesos auditables.

Requiere validación legal y operacional sobre fundamento, retención y acceso antes de implementación.
