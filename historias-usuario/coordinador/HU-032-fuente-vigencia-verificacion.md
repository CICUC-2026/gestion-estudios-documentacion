# HU-032 — Registrar fuente, vigencia y responsable de verificación

**Tipo:** historia-usuario
**Actor:** coordinador
**Estado:** implementada
**Feature relacionada:** [Evolución del inventario operativo](../../features/backlog/evolucion-inventario-operativo.md)
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/36
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **coordinador de estudios**, quiero conocer la fuente, fecha de corte,
responsable y próxima revisión de la información para distinguir datos vigentes
de fotografías históricas o pendientes de confirmación.

## Contexto

`actualizado_en` solo indica una mutación técnica. No demuestra que el dato haya
sido confirmado contra una fuente operacional autorizada.

## Criterios de aceptación

- [ ] Estudio, cohorte y disponibilidad pueden registrar fuente y fecha de corte.
- [ ] Se registra quién verificó, cuándo y cuándo corresponde revisar nuevamente.
- [ ] La fuente se clasifica sin exponer documentos confidenciales o contactos personales.
- [ ] El sistema calcula una etiqueta informativa `vigente`, `por_revisar` o `desactualizada` usando una regla configurable.
- [ ] La etiqueta no cambia automáticamente el estado operacional ni la disponibilidad.
- [ ] Listado y detalle muestran fecha, fuente, responsable y advertencia.
- [ ] Toda reconfirmación queda auditada.

## Permisos requeridos

Lectura según alcance; verificación por coordinador autorizado.

## Dependencias y bloqueos

- HU-005 y HU-030;
- CICUC debe definir frecuencia o SLA de revisión.

## Impacto y contratos

- agrega metadatos y filtros sin usar `actualizado_en` como evidencia clínica;
- una fuente puede referenciar un identificador interno, pero no publicar el PDF.

## No alcance

- sincronización automática;
- firma electrónica;
- verificación de autenticidad del documento fuente.

## Riesgos

La etiqueta de vigencia puede inducir confianza indebida. Siempre debe mostrar
fecha de corte y no declarar que el estudio está abierto sin confirmación.

## Código relacionado

- modelos, esquemas, servicios y filtros de estudios;
- listado y detalle del dominio estudios en frontend.

## Verificación y regresión

- [ ] Tests de cálculo temporal con zona horaria.
- [ ] Tests de permisos y auditoría de reconfirmación.
- [ ] Tests visuales de vigente, por revisar y desactualizada.
- [ ] Estado y disponibilidad permanecen independientes.
