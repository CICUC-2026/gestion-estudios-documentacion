# Seguridad y privacidad

## Clasificación

Los datos de pacientes, evaluaciones, criterios revisados y documentos asociados se consideran sensibles. El acceso se concede por necesidad funcional y alcance institucional.

## Controles iniciales

- cuentas creadas por administradores, sin registro público;
- contraseñas con hash robusto y política configurable;
- sesiones expirables y revocables;
- bloqueo temporal por intentos fallidos;
- autorización en cada endpoint y recurso;
- auditoría de accesos y mutaciones relevantes;
- eliminación lógica y conservación de historial;
- secretos solo mediante configuración externa;
- cifrado en tránsito y protección del almacenamiento;
- datos ficticios en desarrollo, CI, demos y documentación;
- exportaciones sensibles explícitas, restringidas y auditadas.

## Separación de datos

El modelo debe distinguir:

1. Datos identificatorios.
2. Datos clínicos estructurados.
3. Datos operativos del proceso.

Las consultas y vistas devolverán solo las categorías necesarias para la acción y rol actuales.

## Decisiones pendientes

- plazos normativos de retención;
- fundamento y registro de consentimiento o habilitación;
- alcance institucional y reglas multiunidad;
- política de descarga de documentos;
- requisitos de anonimización para reportes.

Estas definiciones requieren validación clínica, legal y de seguridad antes de producción.
