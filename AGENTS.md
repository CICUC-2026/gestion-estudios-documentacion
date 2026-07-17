# AGENTS.md — CICUC Gestión de Estudios Clínicos

Este archivo gobierna a los agentes que trabajen en cualquiera de los repositorios de `CICUC-2026`.

## Aislamiento obligatorio

- Este proyecto pertenece exclusivamente a `https://github.com/CICUC-2026`.
- Repositorios válidos: `gestion-estudios-documentacion`, `gestion-estudios-backend` y `gestion-estudios-frontend`.
- No agregar remotos, submódulos, rutas, issues, Projects, secretos ni código de otros productos.
- Las referencias externas pueden consultarse solo como metodología y nunca incorporarse al proyecto.
- No copiar identidad visual, datos, reglas de negocio ni implementaciones de otros productos.
- La raíz local esperada es `/home/fabian/src/cicuc-2026`.

Antes de cualquier push, ejecutar:

```bash
git remote -v
```

Todos los remotos deben apuntar a `github.com/CICUC-2026/`.

## Fuente de verdad

Toda HU accionable debe estar coordinada en:

1. Markdown en `historias-usuario/<actor>/HU-NNN-slug.md`.
2. Feature en `features/<estado>/<slug>.md`.
3. Issue en `CICUC-2026/gestion-estudios-documentacion`.
4. Item en <https://github.com/orgs/CICUC-2026/projects/1>.

## Actores documentales

- `admin`: administra cuentas, roles, permisos y configuración.
- `investigador`: investigador principal responsable de decisiones y aprobaciones.
- `medico`: médico investigador que registra y revisa casos.
- `enfermeria`: enfermera coordinadora que gestiona operación, fechas y cupos.
- `coordinador`: coordinador de estudios que mantiene protocolos y seguimiento.
- `auditor`: revisor de solo lectura con acceso a trazabilidad autorizada.

## Guardrails HealthTech

- La plataforma no decide elegibilidad.
- La preselección es manual y requiere profesional autorizado.
- No implementar IA, OCR, inferencias clínicas ni extracción automática en la primera versión.
- No inventar reglas clínicas. Registrar decisiones pendientes.
- Aplicar mínimo dato necesario y separar datos identificatorios, clínicos y operativos.
- Validar autorización en backend; ocultar controles en frontend no es seguridad.
- No imprimir datos sensibles, tokens, credenciales ni documentos confidenciales.
- Usar únicamente datos ficticios y anonimizados fuera de producción.
- Toda exportación, modificación relevante y transición sensible debe auditarse.
- No borrar físicamente registros clínicos desde la interfaz.

## Flujo antes de implementar

1. Leer HU, feature y ADRs relacionados.
2. Revisar HUs anteriores del mismo dominio.
3. Revisar `guias/matriz-regresion.md`.
4. Inspeccionar código real por definición y usos.
5. Confirmar alcance, no-alcance, permisos, contratos y riesgos.
6. Completar pruebas de regresión esperadas.
7. Implementar el mínimo incremento vertical completo.
8. Ejecutar build, tests y validación visual/API según corresponda.
9. Actualizar documentación, issue y Project.

## Stack decidido

- Frontend: React, TypeScript, Vite, React Router, TanStack Query, React Hook Form, Zod, Vitest y Playwright.
- Backend: Python, FastAPI, SQLAlchemy, Alembic, Pydantic, PostgreSQL y Pytest.
- API: REST versionada bajo `/api/v1` con OpenAPI.
- Arquitectura: monolito modular en backend y frontend separado por dominios.

## Git

- No mezclar cambios entre repositorios.
- No sobrescribir cambios ajenos.
- No commitear, pushear, mergear ni cerrar issues salvo autorización del usuario.
- Ramas cortas desde `main`; cambios mediante pull request.
