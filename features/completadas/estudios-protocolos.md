# Feature — Estudios, protocolos y criterios

**Estado:** completada  
**Tanda:** 2

## Objetivo

Mantener fichas de estudios, responsables, versiones de protocolo y criterios ingresados manualmente. Solo una versión puede estar vigente; versiones y evaluaciones históricas se conservan.

## Alcance

- ficha estructurada y estados operativos del estudio;
- versiones de protocolo en borrador, revisión, vigente, reemplazada o archivada;
- criterios manuales de inclusión y exclusión ligados a una versión;
- publicación transaccional de una nueva versión;
- comparación estructurada entre versiones;
- auditoría de mutaciones y conservación histórica.

## Dependencias

- HU-003 autenticación y sesiones: implementada;
- HU-004 roles y permisos técnicos: implementada; validación institucional de alcances clínicos pendiente en Issue #5;
- decisión sobre almacenamiento de documentos confidenciales: pendiente.

## HUs propuestas

- HU-005 — Registrar y mantener estudios clínicos.
- HU-006 — Crear versiones de protocolo.
- HU-007 — Mantener criterios manuales de una versión.
- HU-008 — Publicar una versión vigente.
- HU-009 — Comparar versiones de protocolo.

## Contratos

- una versión publicada es histórica y no se edita;
- publicar no elimina ni reescribe versiones o criterios anteriores;
- los permisos se validan en backend;
- una nueva versión puede señalar reevaluaciones pendientes, pero no decide resultados ni envía comunicaciones críticas automáticamente;
- los documentos completos solo se almacenan si la política institucional lo autoriza.

No incluye extracción automática, inferencia clínica ni procesamiento de documentos mediante IA.
