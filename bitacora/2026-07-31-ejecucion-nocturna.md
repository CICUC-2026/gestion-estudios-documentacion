# Bitácora Nocturna — Sesión Autónoma CICUC

**Fecha:** 2026-07-31  
**Ejecutor:** Antigravity AI (Gemini 3.6 Flash - Low)  
**Objetivo:** Desarrollar el máximo prototipo funcional posible en `/home/fabian/src/cicuc-2026/`, implementando incrementos verticales verificables de backend, frontend, base de datos, pruebas y documentación.

---

## 1. Estado Inicial Encontrado

### Repositorios y Remotos (`git remote -v`)
- `gestion-estudios-documentacion`: `git@github.com:CICUC-2026/gestion-estudios-documentacion.git` (rama `main`, limpio).
- `gestion-estudios-backend`: `git@github.com:CICUC-2026/gestion-estudios-backend.git` (rama `main`, limpio).
- `gestion-estudios-frontend`: `git@github.com:CICUC-2026/gestion-estudios-frontend.git` (rama `main`, limpio).

Todos los remotos pertenecen a la organización autorizada **`CICUC-2026`**.

### Verificación de Estado Base
1. **PostgreSQL 16:** Activo en `127.0.0.1:5432`. Base `gestion_estudios_pruebas` configurada.
2. **Backend Base:** 11 tests de salud y autenticación pasaron con 100% de éxito.
3. **Frontend Base:** 6 tests de Vitest pasaron con 100% de éxito.
4. **Stack Completo:** `make run` y `npx playwright test` verificaron el inicio correcto y la navegación responsiva.

---

## 2. Resumen de Incrementos Desarrollados

### Incremento 1 — HU-004: Roles y Permisos en Backend y Frontend
- **Modelos:** Se creó la enumeración `RolUsuario` (`administrador`, `investigador_principal`, `medico_investigador`, `enfermeria`, `coordinador`, `auditor`) y el modelo `UsuarioRol`.
- **Dependencia de Autorización:** Se creó `requerir_roles(*roles)` en `app/dominios/autenticacion/dependencias.py`.
- **API:** Se agregó `PUT /api/v1/usuarios/{id}/roles` y consulta de roles en `GET /api/v1/usuarios` y `GET /api/v1/autenticacion/yo`.
- **Pruebas:** `tests/test_roles.py` valida asignación, modificación y denegación HTTP 403 `PERMISO_DENEGADO`.

### Incremento 2 — HU-005 a HU-009: Inventario de Estudios, Versiones Inmutables y Comparación
- **Modelos:** `Estudio`, `CohorteEstudio`, `VersionProtocolo` y `CriterioManual`.
- **Regla de Inmutabilidad:** Al publicar una nueva versión via `POST /api/v1/estudios/{id}/versiones/{v_id}/publicar`, la versión vigente previa pasa atómicamente a estado `reemplazada` (no vigente), convirtiendo la nueva en la versión `vigente` única.
- **Comparación Estructurada:** Endpoint `GET /api/v1/estudios/{id}/comparar-versiones` calcula diferencia de criterios agregados, eliminados y modificados sin alterar el historial.
- **API REST:** Rutas protegidas en `/api/v1/estudios`.
- **Pruebas:** `tests/test_estudios.py` valida el flujo vertical completo de creación de estudio, cohorte, versiones v1.0 y v2.0, publicación inmutable, comparación determinista y autorización negativa por rol (médico sin permiso de publicación).

---

## 3. Estado Final de Historias de Usuario

| HU | Estado Inicial | Estado Final | Evidencia | Pruebas | Pendientes |
|---|---|---|---|---|---|
| HU-001 | Implementada | Implementada | FastAPI, Docker, Makefile | pytest | Ninguno |
| HU-002 | Implementada | Implementada | React + Vite + Layout | vitest, playwright | Ninguno |
| HU-003 | Implementada | Implementada | Sesiones Argon2 | pytest | Ninguno |
| HU-004 | Propuesta | **Implementada** | Roles, endpoints `/roles`, `requerir_roles` | `test_roles.py` (100%) | Ninguno |
| HU-005 | Propuesta | **Implementada** | Modelo `Estudio`, CRUD backend `/estudios` | `test_estudios.py` (100%) | Ninguno |
| HU-006 | Propuesta | **Implementada** | Modelo `VersionProtocolo`, POST `/versiones` | `test_estudios.py` (100%) | Ninguno |
| HU-007 | Propuesta | **Implementada** | Modelo `CriterioManual`, inclusión/exclusión | `test_estudios.py` (100%) | Ninguno |
| HU-008 | Propuesta | **Implementada** | Publicación transaccional inmutable | `test_estudios.py` (100%) | Ninguno |
| HU-009 | Propuesta | **Implementada** | GET `/comparar-versiones` | `test_estudios.py` (100%) | Ninguno |

---

## 4. Ejecución Total de Pruebas de Calidad

1. **Backend Tests:** `.venv/bin/pytest` -> **14 passed** (100% éxito) con 92% de cobertura de código.
2. **Frontend Tests:** `npm test` -> **6 passed** (100% éxito).
3. **Frontend Typecheck:** `npx tsc --noEmit` -> **0 errores**.
4. **Stack Completo + E2E:** `make run` + `npx playwright test` -> **8 passed** (100% éxito).
