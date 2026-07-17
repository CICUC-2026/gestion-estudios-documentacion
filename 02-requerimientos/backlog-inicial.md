# Backlog inicial por etapas

Este backlog convierte el prompt maestro en capacidades incrementales. Una capacidad se descompone en HUs recién cuando entra a preparación; no se implementa directamente desde esta lista.

## Tanda 0 — Fundación documental

**Objetivo:** acordar producto, límites, arquitectura, seguridad, UX y forma de trabajo.

- visión, alcance y actores;
- ADRs de arquitectura, API, decisión humana e identidad visual;
- modelo conceptual, permisos propuestos y matriz de regresión;
- repositorios, Project y reglas para agentes.

## Tanda 1 — Fundamentos técnicos

**Objetivo:** una plataforma vacía, ejecutable, segura y observable.

- HU-001: base backend, PostgreSQL, migraciones, Docker y CI;
- HU-002: base frontend, rutas, barra superior y CI;
- HU-003: autenticación y sesiones;
- HU-004: roles, permisos y alcances;
- auditoría básica transversal;
- configuración institucional mínima;
- datos ficticios de demostración.

## Tanda 2 — Estudios y protocolos

**Objetivo:** reemplazar planillas dispersas para mantener estudios vigentes.

- ficha y estados del estudio;
- responsables y centros;
- versiones del protocolo;
- publicación de una única versión vigente;
- criterios manuales, orden, categorías y evidencia;
- documentos y restricciones de confidencialidad;
- comparación manual de versiones y reevaluaciones pendientes.

## Tanda 3 — Pacientes y datos mínimos

**Objetivo:** registrar casos con separación y minimización de datos.

- identificador interno y datos identificatorios separados;
- diagnóstico, biomarcadores, tratamientos y laboratorios;
- fuente, fecha y estado de verificación por dato;
- búsqueda y filtros con mínimo dato;
- historial de cambios y acceso.

## Tanda 4 — Preselección manual

**Objetivo:** documentar revisión profesional sin emitir elegibilidad.

- asociación paciente-estudio;
- preselección ligada a versión;
- evaluación manual por criterio;
- información faltante y posibles barreras;
- estados, transiciones, reapertura y cierre auditados;
- resumen manual y siguiente acción.

## Tanda 5 — Operación

**Objetivo:** coordinar disponibilidad y trabajo pendiente.

- cupos y brazos con fuente e historial;
- lista de espera y prioridad operativa;
- tareas y recordatorios internos;
- reuniones de comité, acuerdos y responsables;
- notificaciones no críticas;
- panel operativo personal.

## Tanda 6 — Reportes y endurecimiento

**Objetivo:** completar control, validación y preparación operacional.

- reportes y exportaciones autorizadas;
- auditoría avanzada;
- accesibilidad y rendimiento;
- respaldo, restauración y continuidad;
- pruebas E2E de flujos completos;
- revisión de seguridad y plan de validación.

## Dependencias de validación

Antes de entrar a desarrollo deben resolverse o acotarse:

1. Matriz de permisos y alcance por unidad.
2. Fundamento y minimización del registro de pacientes.
3. Retención y disposición de información.
4. Política de documentos confidenciales.
5. Transiciones operativas de preselección y cupos.
6. Identidad visual oficial de CICUC.

## Priorización

La secuencia es obligatoria por dependencia de seguridad y datos. Dentro de cada tanda, las HUs pueden ordenarse en el Project como `Backlog`, `Ready`, `In progress`, `In review` y `Done`.
