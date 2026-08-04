# HU-035 — Importar un catálogo sanitizado de estudios

**Tipo:** historia-usuario
**Actor:** coordinador
**Estado:** implementada
**Feature relacionada:** [Evolución del inventario operativo](../../features/completadas/evolucion-inventario-operativo.md)
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/35
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **coordinador de estudios**, quiero importar una planilla sanitizada y
revisada para cargar la fotografía inicial del inventario sin copiar protocolos,
contactos personales ni datos de pacientes.

## Contexto

El PDF de julio de 2026 es una fuente histórica visual, no una base de datos ni
confirmación de disponibilidad actual.

## Criterios de aceptación

- [ ] Existe una plantilla CSV versionada con campos y catálogos documentados.
- [ ] La importación admite validación previa o `dry-run` sin escribir datos.
- [ ] Filas inválidas producen reporte con fila, campo y causa.
- [ ] Se rechazan nombres de pacientes, teléfonos, correos y columnas no autorizadas.
- [ ] Toda carga registra archivo lógico, fecha de corte, autor y resultado, sin guardar el PDF fuente.
- [ ] La operación es idempotente mediante una clave estable y no duplica estudios pantumorales.
- [ ] Registros importados quedan `sin_confirmar` hasta revisión humana.
- [ ] La publicación requiere confirmación explícita de un coordinador autorizado.

## Permisos requeridos

Importar y publicar son permisos separados; solo coordinadores autorizados.

## Dependencias y bloqueos

- HU-030 a HU-032;
- aprobación de plantilla y responsables de revisión.

## Impacto y contratos

- agrega comando o endpoint administrativo, validador, reporte y auditoría;
- el PDF original permanece fuera de GitHub y almacenamiento público;
- no existe OCR ni extracción automática en esta historia.

## No alcance

- importación de protocolos;
- sincronización periódica;
- contactos personales;
- datos clínicos de pacientes.

## Riesgos

La presentación mezcla estado y disponibilidad y puede estar desactualizada.
Ninguna fila debe publicarse como vigente sin confirmación humana.

## Código relacionado

- script/servicio de importación del backend;
- esquema CSV en documentación;
- auditoría y seed de demostración.

## Verificación y regresión

- [ ] Tests de archivo válido, columnas prohibidas y filas inválidas.
- [ ] Test de idempotencia y rollback transaccional.
- [ ] Test de permisos y auditoría.
- [ ] Seed, migraciones y API de estudios continúan pasando.
