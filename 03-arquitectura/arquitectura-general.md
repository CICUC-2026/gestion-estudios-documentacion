# Arquitectura general

## Decisión inicial

La solución tendrá una aplicación web separada y un backend monolítico modular. Los datos se persistirán en PostgreSQL y la API será REST versionada.

```text
Navegador
   |
   | HTTPS + JSON (/api/v1)
   v
Frontend React/TypeScript
   |
   v
Backend FastAPI
   ├── autenticación y autorización
   ├── estudios y protocolos
   ├── pacientes y datos clínicos
   ├── preselecciones
   ├── cupos y operación
   ├── notificaciones y reportes
   └── auditoría
   |
   ├── PostgreSQL
   └── almacenamiento de documentos mediante interfaz compatible con objetos
```

## Límites

- El backend aplica permisos y reglas de negocio.
- El frontend aplica experiencia de usuario, pero no constituye una barrera de seguridad.
- Cada módulo conserva cohesión propia sin desplegarse como microservicio.
- Los documentos se referencian mediante metadatos; nunca se incorporan a logs.
- Integraciones futuras dependerán de interfaces explícitas y no del modelo interno.

## Entornos

Desarrollo, pruebas, preproducción y producción usarán configuración y bases de datos separadas. Solo producción podrá contener datos reales.
