# HU-012 — Registrar diagnóstico y biomarcadores estructurados

**Tipo:** historia-usuario  
**Actor:** medico  
**Estado:** propuesta  
**Bloqueada por:** Issues #5 y #6; aceptación completa de ADR-007 para datos clínicos reales  
**Última actualización:** 2026-08-04  
**Feature relacionada:** [Pacientes y datos estructurados](../../features/backlog/pacientes-datos-estructurados.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/15  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

**Aclaración de alcance:** los diagnósticos y biomarcadores ficticios de HU-038 son datos de demostración. Esta HU permanece pendiente para información clínica real, fuente oficial, verificación y permisos diferenciados.

## Historia

Como **médico investigador**, quiero registrar diagnósticos y biomarcadores fechados para documentar información disponible sin reemplazar la fuente clínica oficial.

## Criterios de aceptación

- [ ] Diagnóstico registra patología, histología, etapa, fecha, fuente, autor y estado de verificación.
- [ ] Biomarcador y resultado se almacenan como entidades repetibles, con valor, unidad/método cuando aplique, fecha de muestra, sitio y fuente.
- [ ] Estados permitidos: `informado`, `pendiente_verificar`, `verificado`, `desactualizado`, `no_disponible`, `no_corresponde`.
- [ ] Cambiar un valor verificado crea historial y exige motivo; no borra el valor anterior.
- [ ] La interfaz diferencia dato informado de verificado y siempre muestra fecha/fuente.
- [ ] No se interpreta automáticamente el resultado ni se asocia a elegibilidad.
- [ ] Permisos de lectura y escritura se aplican en backend.

## Impacto sobre funcionalidades existentes

| Funcionalidad | ¿Se toca? | Riesgo | Cómo se protege |
|---|---:|---|---|
| Paciente mínimo | Sí | Alto | FK, archivo y permisos |
| Auditoría | Sí | Alto | Historial de correcciones y verificación |
| UI | Sí | Alto | Estados textuales y fuente visible |

## Contratos que deben preservarse

- Datos fechados, con fuente y autor.
- Historial inmutable de correcciones.
- Sin inferencia, normalización clínica automática o elegibilidad.
- No reemplaza la ficha clínica.

## No alcance

- tratamientos, laboratorios generales o comorbilidades;
- importación automática;
- documentos de respaldo;
- preselección.

## Riesgo clínico/legal

**Bloqueante:** requiere catálogo y estados validados, ADR-007 y Issues #5/#6. Un dato desactualizado o sin método puede inducir a error si la interfaz no muestra contexto.

## Código relacionado

- `gestion-estudios-backend/app/dominios/datos_clinicos/` — diagnóstico y biomarcadores.
- `gestion-estudios-backend/app/api/v1/datos_clinicos.py` — endpoints.
- `gestion-estudios-backend/migrations/versions/` — entidades e historial.
- `gestion-estudios-frontend/src/dominios/datos-clinicos/` — formularios y línea temporal.

## Verificación esperada y pruebas de regresión

- [ ] Tests de estados, fechas, fuentes, historial, permisos y auditoría.
- [ ] Tests frontend para informado/verificado/desactualizado.
- [ ] Playwright de registro y corrección con datos ficticios.
- [ ] Regresión de identidad minimizada y sesión.
