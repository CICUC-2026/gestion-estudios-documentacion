# HU-013 — Registrar antecedentes terapéuticos y datos clínicos fechados

**Tipo:** historia-usuario  
**Actor:** medico  
**Estado:** propuesta  
**Bloqueada por:** Issues #5 y #6; ADR-007 pendiente de aceptación  
**Última actualización:** 2026-07-17  
**Feature relacionada:** [Pacientes y datos estructurados](../../features/backlog/pacientes-datos-estructurados.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/16  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **médico investigador**, quiero registrar antecedentes terapéuticos y mediciones clínicas fechadas para disponer de contexto verificable durante la revisión administrativa.

## Criterios de aceptación

- [ ] Tratamientos, cirugías y radioterapia son registros repetibles con inicio/fin, respuesta, fuente, autor y verificación.
- [ ] Laboratorios registran tipo, valor, unidad, rango/contexto cuando aplique, fecha de muestra, fuente y verificación.
- [ ] Estado funcional, enfermedad medible, metástasis, toxicidades, comorbilidades y medicamentos se modelan como registros fechados, no como una única verdad sobrescribible.
- [ ] Correcciones conservan historial, motivo y responsable.
- [ ] La interfaz agrupa por categoría y orden cronológico, mostrando desactualización.
- [ ] No se calculan umbrales, compatibilidad ni conclusiones clínicas automáticamente.
- [ ] Permisos se validan por paciente, unidad y acción.

## Impacto sobre funcionalidades existentes

| Funcionalidad | ¿Se toca? | Riesgo | Cómo se protege |
|---|---:|---|---|
| Pacientes/datos clínicos | Sí | Alto | FK, temporalidad e historial |
| Permisos/auditoría | Sí | Alto | Matriz negativa y registros de cambio |
| Rendimiento | Sí | Medio | Paginación/límites por categoría e índices |

## Contratos que deben preservarse

- Valor, unidad, fecha, fuente, autor y verificación cuando corresponda.
- Historial antes que sobrescritura.
- Sin interpretación automática o reemplazo de la ficha clínica.
- Campos sensibles específicos requieren validación adicional antes de incorporarse.

## No alcance

- motor de reglas;
- cálculo de elegibilidad;
- integración con laboratorio o ficha clínica;
- alertas clínicas automáticas.

## Riesgo clínico/legal

**Bloqueante:** requiere ADR-007, Issues #5/#6 y validación de cada categoría. Datos parciales o unidades incorrectas deben presentarse como información no verificada, nunca como conclusión.

## Código relacionado

- `gestion-estudios-backend/app/dominios/datos_clinicos/` — antecedentes y mediciones.
- `gestion-estudios-backend/app/api/v1/datos_clinicos.py` — endpoints.
- `gestion-estudios-backend/migrations/versions/` — registros temporales e índices.
- `gestion-estudios-frontend/src/dominios/datos-clinicos/` — formularios y cronología.

## Verificación esperada y pruebas de regresión

- [ ] Tests de temporalidad, unidades, estados, historial, permisos y auditoría.
- [ ] Tests de volumen/paginación por categoría.
- [ ] Playwright con registros ficticios y corrección.
- [ ] Regresión de paciente minimizado, autenticación y navegación.
