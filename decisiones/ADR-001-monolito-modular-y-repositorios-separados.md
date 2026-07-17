# ADR-001 — Monolito modular y repositorios separados

**Estado:** aceptada  
**Fecha:** 2026-07-17

## Contexto

La plataforma necesita separación de responsabilidades sin asumir el costo operativo de microservicios durante su primera etapa.

## Decisión

Mantener tres repositorios independientes dentro de `CICUC-2026`: documentación, backend y frontend. El backend será un monolito modular desplegable como una unidad.

## Consecuencias

- límites claros entre interfaz, API y fuente documental;
- despliegue y transacciones más simples;
- módulos internos deben evitar dependencias circulares;
- no se crearán microservicios sin evidencia y un ADR posterior.
