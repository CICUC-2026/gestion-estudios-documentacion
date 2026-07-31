# Respaldo y recuperación

**Estado:** propuesta pendiente de infraestructura y objetivos institucionales

## Principios

- un respaldo no se considera válido hasta probar una restauración;
- ambientes no comparten bases ni respaldos;
- datos reales no se restauran en desarrollo, CI o demos;
- respaldos y claves se cifran, restringen y auditan;
- documentos y base relacional deben recuperarse a un punto coherente;
- procedimientos no incluyen secretos versionados.

## Objetivos pendientes

- RPO: pérdida máxima de datos aceptable.
- RTO: tiempo máximo de recuperación.
- retención y rotación de respaldos.
- región/ubicación permitida y residencia.
- responsables de declarar incidente, restaurar y validar.

## Prueba propuesta

1. Crear respaldo en entorno de pruebas con datos ficticios.
2. Restaurar en infraestructura aislada.
3. Aplicar/verificar migraciones compatibles.
4. Validar conteos, restricciones, auditoría y documentos.
5. Ejecutar smoke tests de autenticación y dominios críticos.
6. Registrar tiempos, evidencia, desviaciones y destrucción segura del entorno.

Antes de producción debe existir runbook específico del proveedor elegido, sin acoplar el modelo de aplicación a ese proveedor.
