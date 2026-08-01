# HU-030 — Separar estado operacional y disponibilidad del estudio

**Tipo:** historia-usuario
**Actor:** coordinador
**Estado:** propuesta
**Feature relacionada:** [Evolución del inventario operativo](../../features/backlog/evolucion-inventario-operativo.md)
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/34
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **coordinador de estudios**, quiero registrar por separado el estado
operacional y la disponibilidad de cada estudio o cohorte para evitar que
expresiones como activo, hold, con cupo o slot asignado se interpreten como una
sola condición.

## Contexto

El modelo actual combina un enum de estado con un booleano `disponible`. El
catálogo real utiliza estados operacionales y situaciones de disponibilidad
distintas que cambian de forma independiente.

## Criterios de aceptación

- [ ] Estado operacional y disponibilidad se almacenan en campos independientes.
- [ ] El catálogo inicial de estados es configurable y queda marcado como provisional hasta validación de CICUC.
- [ ] Cada cambio conserva valor anterior, valor nuevo, fecha, autor, fuente y motivo.
- [ ] La migración transforma datos existentes sin perderlos y permite rollback probado.
- [ ] API y frontend filtran ambas dimensiones de manera independiente.
- [ ] La interfaz no muestra `activo` como sinónimo de `con cupo`.
- [ ] Transiciones no autorizadas son rechazadas por backend.
- [ ] Archivo lógico conserva historial y relaciones.

## Permisos requeridos

- lectura: usuario con alcance sobre el centro o estudio;
- modificación: coordinador autorizado;
- configuración de catálogos: administrador autorizado.

## Dependencias y bloqueos

- HU-004 y HU-005;
- validación institucional del catálogo y transiciones.

## Impacto y contratos

- modifica modelo, migración, esquemas, filtros, seed y vistas de estudios;
- preserva UUID, auditoría, archivo lógico y API bajo `/api/v1`;
- disponibilidad nunca produce una conclusión clínica.

## No alcance

- reserva automática de cupos;
- lista de espera;
- evaluación de pacientes.

## Riesgos

Un mapeo incorrecto puede presentar un estudio como disponible. La migración
debe usar un estado `sin_confirmar` cuando no exista equivalencia segura.

## Código relacionado

- `gestion-estudios-backend/app/dominios/estudios/modelos.py`;
- `gestion-estudios-backend/app/dominios/estudios/esquemas.py`;
- `gestion-estudios-backend/app/api/v1/estudios.py`;
- `gestion-estudios-frontend/src/dominios/estudios/`.

## Verificación y regresión

- [ ] Migración arriba/abajo y prueba de datos existentes.
- [ ] Tests API de filtros, transiciones, permisos y auditoría.
- [ ] Tests frontend para combinaciones de estado y disponibilidad.
- [ ] Login, versiones y comparación de protocolos continúan funcionando.
