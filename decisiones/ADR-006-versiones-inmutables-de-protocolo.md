# ADR-006 — Versiones publicadas de protocolo inmutables

**Estado:** aceptada  
**Fecha:** 2026-07-17

## Contexto

Una evaluación administrativa debe poder demostrar exactamente qué versión y criterios fueron utilizados. Editar una versión ya publicada destruiría esa trazabilidad y podría alterar retrospectivamente el significado de evaluaciones anteriores.

## Decisión

- las versiones en `borrador` y `en_revision` pueden modificarse por usuarios autorizados;
- al publicar, la versión pasa a `vigente` y sus criterios quedan inmutables;
- la versión vigente anterior pasa a `reemplazada` dentro de la misma transacción;
- solo puede existir una versión vigente por estudio, protegida con una restricción parcial en PostgreSQL;
- corregir contenido publicado requiere crear una nueva versión;
- evaluaciones, asociaciones y auditorías conservan el identificador de versión utilizado;
- los documentos históricos no se eliminan desde la interfaz.

## Consecuencias

- publicar requiere transacción, bloqueo y prueba de concurrencia;
- copiar criterios crea nuevos identificadores y registra la versión de origen;
- comparar versiones usa información estructurada, sin inferencia automática;
- una nueva versión puede marcar casos para revisión, pero no recalcula ni modifica evaluaciones históricas;
- la autorización de publicación depende de HU-004 y no se presume en el modelo de datos.
