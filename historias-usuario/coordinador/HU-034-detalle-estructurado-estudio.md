# HU-034 — Consultar el detalle estructurado de un estudio

**Tipo:** historia-usuario
**Actor:** coordinador
**Estado:** implementada
**Feature relacionada:** [Evolución del inventario operativo](../../features/backlog/evolucion-inventario-operativo.md)
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/37
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **coordinador de estudios**, quiero consultar una ficha estructurada con
resumen, cohortes, brazos, versiones, criterios y trazabilidad para comprender
el contexto operacional sin revisar un protocolo completo en cada consulta.

## Criterios de aceptación

- [ ] Existe una ruta estable `/estudios/:id` conectada a la API.
- [ ] La cabecera muestra identidad, estado, disponibilidad, fuente y vigencia.
- [ ] La ficha separa resumen, cohortes/brazos, versiones, criterios e historial.
- [ ] La versión vigente se distingue sin ocultar versiones reemplazadas.
- [ ] Los criterios muestran tipo, orden, alcance y sección fuente cuando exista.
- [ ] La comparación de versiones usa el endpoint implementado.
- [ ] Ausencia de datos se muestra como pendiente, no se completa con inferencias.
- [ ] Acceso fuera de alcance recibe denegación consistente.

## Permisos requeridos

Lectura por alcance; acciones de publicación solo para rol autorizado.

## Dependencias y bloqueos

- HU-006 a HU-009, HU-031 a HU-033.

## Impacto y contratos

- consume APIs existentes y las extensiones aprobadas;
- no enlaza documentos completos mientras la custodia siga pendiente;
- no presenta criterios como evaluación de un paciente.

## No alcance

- visor de PDF;
- evaluación de elegibilidad;
- edición simultánea colaborativa.

## Riesgos

Un resumen incompleto puede confundirse con el protocolo. La vista debe declarar
la versión y que el documento oficial prevalece.

## Código relacionado

- nuevas páginas/componentes del dominio estudios;
- `apiEstudios.ts`, `tipos.ts` y `RutasAplicacion.tsx`.

## Verificación y regresión

- [ ] Vitest de pestañas, faltantes y permisos.
- [ ] Playwright de detalle y comparación de versiones.
- [ ] Prueba móvil, teclado y contraste.
- [ ] El inventario conserva filtros al volver desde el detalle.
