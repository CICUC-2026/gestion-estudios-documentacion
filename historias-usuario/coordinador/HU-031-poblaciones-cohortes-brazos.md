# HU-031 — Modelar poblaciones, cohortes y brazos del estudio

**Tipo:** historia-usuario
**Actor:** coordinador
**Estado:** implementada
**Feature relacionada:** [Evolución del inventario operativo](../../features/backlog/evolucion-inventario-operativo.md)
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/32
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **coordinador de estudios**, quiero estructurar poblaciones, cohortes y
brazos para representar un estudio una sola vez aunque opere en varias
patologías, líneas o intervenciones.

## Contexto

El catálogo repite estudios pantumorales por indicación. El protocolo trazador
confirma que una ficha plana no representa adecuadamente poblaciones y brazos.

## Criterios de aceptación

- [ ] Un estudio contiene una o más poblaciones/cohortes sin duplicar su identidad.
- [ ] Una cohorte registra nombre, patología, subtipo, escenario, línea y requisitos de biomarcadores.
- [ ] Una cohorte puede contener uno o más brazos con nombre y descripción administrativa.
- [ ] Estado y disponibilidad pueden definirse en estudio o cohorte con precedencia explícita.
- [ ] Los criterios indican si aplican al estudio, cohorte o brazo.
- [ ] API entrega relaciones estables, ordenadas y paginables cuando corresponda.
- [ ] La interfaz distingue estudio, cohorte y brazo semántica y visualmente.
- [ ] Cambios conservan historial y no reescriben versiones publicadas.

## Permisos requeridos

Lectura y modificación según alcance definido por HU-004.

## Dependencias y bloqueos

- HU-005 a HU-009;
- HU-030;
- definición institucional de cuándo la disponibilidad pertenece a cohorte.

## Impacto y contratos

- evoluciona `CohorteEstudio` y agrega brazo/alcance de criterio;
- biomarcadores aquí son requisitos del estudio, no resultados de pacientes;
- no copia tratamientos ni texto confidencial del protocolo al seed público.

## No alcance

- calendario de tratamiento;
- dosificación clínica;
- asignación o randomización de participantes.

## Riesgos

Una jerarquía ambigua puede asociar criterios a la población incorrecta. Toda
relación debe mostrar su alcance y versión de origen.

## Código relacionado

- dominio y migraciones de estudios del backend;
- tipos y cliente API de estudios del frontend;
- futuras vistas de detalle del estudio.

## Verificación y regresión

- [ ] Tests de restricciones, cascadas e historial.
- [ ] Test de un estudio con varias cohortes y brazos.
- [ ] Test de criterio con alcance de cohorte y brazo.
- [ ] Comparación de versiones y seed continúan funcionando.
