# Requerimientos no funcionales

## Seguridad

- autorización de backend por operación y recurso;
- sesiones revocables y expirables;
- ausencia de secretos y datos reales en repositorios o CI;
- trazabilidad de acciones relevantes;
- mínimos privilegios y mínimos datos.

## Calidad

- tipado estricto en frontend;
- validación explícita de entradas y salidas;
- migraciones reproducibles;
- pruebas automatizadas por regla de negocio y permiso;
- flujo E2E para cada capacidad crítica.

## Usabilidad

- navegación consistente mediante barra superior;
- accesibilidad WCAG 2.2 AA como objetivo;
- formularios divididos y recuperables;
- mensajes en español, concretos y no ambiguos;
- filtros y paginación preservados al navegar.

## Operación

- entornos y bases separados;
- observabilidad sin datos sensibles;
- respaldos y recuperación documentados antes de producción;
- despliegue no acoplado a un proveedor específico.
