# Documentación — Gestión de estudios clínicos CICUC

Centro de mando funcional, clínico, técnico y operativo de la plataforma CICUC para la gestión administrativa de estudios clínicos oncológicos.

> El sistema apoya la organización y preselección administrativa. No reemplaza el screening formal, la evaluación clínica ni la decisión de elegibilidad del investigador principal.

## Repositorios

| Repositorio | Responsabilidad |
|---|---|
| [`gestion-estudios-documentacion`](https://github.com/CICUC-2026/gestion-estudios-documentacion) | Fuente de verdad, requerimientos, HUs, ADRs y operación |
| [`gestion-estudios-backend`](https://github.com/CICUC-2026/gestion-estudios-backend) | API REST, reglas de negocio, seguridad, auditoría y persistencia |
| [`gestion-estudios-frontend`](https://github.com/CICUC-2026/gestion-estudios-frontend) | Aplicación web, navegación y experiencia de usuario |

Project/Kanban: <https://github.com/orgs/CICUC-2026/projects/1>

## Estructura

| Carpeta | Contenido |
|---|---|
| `01-vision/` | Visión, problema, alcance y actores |
| `02-requerimientos/` | Reglas y requerimientos verificables |
| `03-arquitectura/` | Arquitectura, datos, seguridad y despliegue |
| `04-flujos/` | Flujos administrativos y clínico-operativos |
| `05-diseno/` | Sistema de diseño y navegación |
| `06-operacion/` | Manuales y continuidad operacional |
| `07-calidad/` | Estrategia de pruebas y Definition of Done |
| `features/` | Capacidades por estado |
| `historias-usuario/` | Historias numeradas globalmente por actor |
| `decisiones/` | Architecture Decision Records (ADR) |
| `guias/` | Guías transversales, incluida regresión |
| `bitacora/` | Registro cronológico del trabajo relevante |

## Regla de trazabilidad

Una historia accionable está completa solo cuando existe como:

1. Markdown en `historias-usuario/<actor>/HU-NNN-slug.md`.
2. Issue en este repositorio con labels de tipo y actor.
3. Item en el Project 1 de CICUC.
4. Vínculo a una feature y a rutas reales de implementación, o una declaración explícita de que no requiere código.

## Estado inicial

El proyecto está en Tanda 0: fundación documental y decisiones de arquitectura. No se ha implementado funcionalidad clínica ni inteligencia artificial.
