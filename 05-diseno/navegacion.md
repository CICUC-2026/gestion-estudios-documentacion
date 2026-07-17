# Navegación

## Barra superior propuesta

```text
[CICUC]  Inicio  Estudios  Pacientes  Operación  Reportes   [Buscar] [Alertas] [Usuario]
```

Visibilidad sugerida por permisos:

- `Inicio`: panel operativo personal.
- `Estudios`: estudios, versiones, criterios y responsables.
- `Pacientes`: ficha mínima, asociaciones y preselecciones.
- `Operación`: cupos, lista de espera, tareas y comités.
- `Reportes`: reportes autorizados y auditoría cuando corresponda.
- Administración: accesible desde el menú de usuario para roles autorizados.

## Reglas

- La URL debe representar el contexto actual y admitir enlaces directos autorizados.
- Regresar desde un detalle debe preservar filtros y paginación.
- Un usuario no debe ver accesos que nunca puede utilizar, sin depender de ello para seguridad.
- El cambio de contexto institucional, si se habilita, debe ser explícito y auditable.
