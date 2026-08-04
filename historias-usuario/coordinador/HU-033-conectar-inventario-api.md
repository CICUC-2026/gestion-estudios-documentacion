# HU-033 — Conectar el inventario web con la API de estudios

**Tipo:** historia-usuario
**Actor:** coordinador
**Estado:** implementada
**Feature relacionada:** [Evolución del inventario operativo](../../features/completadas/evolucion-inventario-operativo.md)
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/33
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **coordinador de estudios**, quiero consultar el inventario real servido por
la API para trabajar con información persistida y no con filas ficticias
incorporadas directamente en la interfaz.

## Contexto

El cliente `apiEstudios.ts` existe, pero la ruta `/estudios` continúa usando la
configuración estática de `PaginaModulo.tsx`.

## Criterios de aceptación

- [ ] `/estudios` obtiene datos mediante el cliente API existente.
- [ ] La consulta usa sesión y respeta errores de autorización.
- [ ] Existen estados de carga, vacío, error, acceso denegado y reintento.
- [ ] Un error de API nunca se reemplaza silenciosamente por datos demo.
- [ ] Búsqueda, filtros, orden y paginación se reflejan en URL y contrato API.
- [ ] Estado, disponibilidad y vigencia se presentan por separado.
- [ ] Cada fila conduce al detalle estable del estudio.
- [ ] La vista funciona con teclado, escritorio y móvil.

## Permisos requeridos

Ruta protegida y lectura limitada al alcance retornado por backend.

## Dependencias y bloqueos

- HU-004, HU-005, HU-030 y HU-032;
- contrato de filtros/paginación debe quedar documentado en OpenAPI.

## Impacto y contratos

- reemplaza datos estáticos solo en el módulo Estudios;
- preserva login, barra horizontal, tema y rutas existentes;
- datos demo solo provienen del seed reproducible y quedan rotulados.

## No alcance

- edición completa desde la tabla;
- pacientes, cupos o reportes;
- modo offline.

## Riesgos

La interfaz no debe mostrar datos antiguos en caché sin informar su fecha ni
ocultar errores de backend.

## Código relacionado

- `src/paginas/PaginaModulo.tsx`;
- `src/dominios/estudios/apiEstudios.ts`;
- `src/dominios/estudios/tipos.ts`;
- rutas y cliente API compartido.

## Verificación y regresión

- [ ] Vitest de estados y filtros.
- [ ] Playwright de login, inventario, filtro y detalle.
- [ ] Prueba contractual contra backend real.
- [ ] Build, navegación móvil y tema accesible continúan pasando.
