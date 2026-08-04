# HU-009 — Comparar versiones de protocolo

**Tipo:** historia-usuario
**Actor:** coordinador
**Estado:** implementada
**Última actualización:** 2026-07-31
**Feature relacionada:** [Estudios, protocolos y criterios](../../features/completadas/estudios-protocolos.md)
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/12
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **coordinador de estudios**, quiero comparar datos y criterios estructurados de dos versiones para preparar una revisión humana de los cambios.

## Criterios de aceptación

- [x] Solo se comparan versiones del mismo estudio.
- [x] La vista identifica campos y criterios agregados, retirados o modificados mediante correspondencias explícitas.
- [x] Los criterios copiados conservan un identificador de origen que permite correspondencia determinista.
- [x] No se compara ni interpreta automáticamente el contenido de archivos adjuntos.
- [x] La comparación no modifica versiones, criterios o estados.
- [x] Se muestran número, estado, fecha y responsable de cada versión.
- [x] El resultado es accesible por teclado y no depende solo del color.

## Impacto sobre funcionalidades existentes

| Funcionalidad | ¿Se toca? | Riesgo | Cómo se protege |
|---|---:|---|---|
| Versiones/criterios | Sí, lectura | Medio | Tests de correspondencia y no mutación |
| Permisos | Sí | Alto | Alcance de lectura validado en backend |
| UI | Sí | Medio | Componentes accesibles y Playwright |

## Contratos que deben preservarse

- Comparación determinista sobre datos estructurados.
- Sin IA, OCR ni inferencia semántica.
- Sin mutaciones ni decisiones clínicas.

## No alcance

- comparación de PDFs o documentos completos;
- resumen automático;
- publicación o reevaluación;
- exportación.

## Riesgo clínico/legal

La vista es una ayuda administrativa y puede no capturar cambios semánticos. Debe advertir que no reemplaza la revisión del protocolo oficial.

## Código relacionado

- `gestion-estudios-backend/app/dominios/protocolos/` — consulta de comparación.
- `gestion-estudios-backend/app/api/v1/protocolos.py` — endpoint de solo lectura.
- `gestion-estudios-frontend/src/dominios/protocolos/` — vista comparativa accesible.

## Verificación esperada y regresión

- [ ] Tests de versiones distintas, criterios agregados/retirados/modificados y permisos.
- [ ] Test que prueba ausencia de mutaciones.
- [ ] Playwright de comparación en escritorio y viewport estrecho.
- [ ] Regresión de detalle de versión y navegación.
