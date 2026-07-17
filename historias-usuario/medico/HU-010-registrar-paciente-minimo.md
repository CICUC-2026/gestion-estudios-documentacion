# HU-010 — Registrar un paciente con datos mínimos

**Tipo:** historia-usuario  
**Actor:** medico  
**Estado:** propuesta  
**Bloqueada por:** Issues #5 y #6; ADR-007 pendiente de aceptación  
**Última actualización:** 2026-07-17  
**Feature relacionada:** [Pacientes y datos estructurados](../../features/backlog/pacientes-datos-estructurados.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/13  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **médico investigador**, quiero registrar un caso con los datos mínimos autorizados para incorporarlo al seguimiento administrativo sin exponer identidad innecesariamente.

## Criterios de aceptación

- [ ] Solo un usuario con capacidad y alcance validados puede registrar.
- [ ] Se genera UUID y código interno no significativo, sin derivarlo de identificadores personales.
- [ ] Identidad, información clínica y operación se persisten y autorizan separadamente.
- [ ] El formulario explica campos obligatorios y fundamento de registro aprobado.
- [ ] Se detectan posibles duplicados mediante un mecanismo aprobado sin revelar coincidencias fuera de alcance.
- [ ] Creación registra autor, instante, unidad, fundamento y fuente en auditoría.
- [ ] No existe borrado físico desde API o interfaz.
- [ ] Una cuenta administrativa no obtiene acceso clínico por defecto.

## Impacto sobre funcionalidades existentes

| Funcionalidad | ¿Se toca? | Riesgo | Cómo se protege |
|---|---:|---|---|
| Autenticación/autorización | Sí | Alto | Tests positivos y negativos por capacidad, unidad y recurso |
| Auditoría | Sí | Alto | Test de registro y acceso identificatorio |
| Navegación | Sí | Medio | Ruta protegida y Playwright móvil/escritorio |

## Contratos que deben preservarse

- Mínimo dato y separación por categoría.
- Backend valida acceso a identidad.
- Datos ficticios fuera de producción.
- Sin evaluación o recomendación automática.

## No alcance

- diagnóstico detallado, biomarcadores o tratamientos;
- asociación con estudios;
- preselección;
- importación desde ficha clínica.

## Riesgo clínico/legal

**Bloqueante:** no implementar hasta aceptar ADR-007 y resolver Issues #5 y #6. Riesgos: registro sin fundamento, duplicidad, exposición y retención indebida.

## Código relacionado

- `gestion-estudios-backend/app/dominios/pacientes/` — modelos, servicios y políticas.
- `gestion-estudios-backend/app/api/v1/pacientes.py` — endpoints minimizados.
- `gestion-estudios-backend/migrations/versions/` — separación, índices y eliminación lógica.
- `gestion-estudios-frontend/src/dominios/pacientes/` — formulario y detalle autorizado.

## Verificación esperada y pruebas de regresión

- [ ] Migración PostgreSQL arriba/abajo y restricciones.
- [ ] Tests de duplicidad, minimización, permisos, auditoría y archivo lógico.
- [ ] Playwright con datos ficticios.
- [ ] Regresión de sesiones, navegación y ausencia de identidad en respuestas no autorizadas.
