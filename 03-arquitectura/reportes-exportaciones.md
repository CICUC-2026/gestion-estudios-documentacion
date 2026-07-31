# Reportes y exportaciones

**Estado:** propuesta pendiente de validación de finalidad y datos

## Separación

- `consulta operacional`: datos en pantalla, paginados y bajo permisos del dominio.
- `reporte`: agregación o vista reproducible con parámetros y fecha de corte.
- `exportación`: materialización descargable que requiere una capacidad adicional.

## Reglas propuestas

- cada reporte declara finalidad, audiencia, campos, filtros y responsable funcional;
- el backend reconstruye el alcance; no confía en columnas ocultas por frontend;
- agregados con grupos pequeños deben revisarse por riesgo de reidentificación;
- una exportación registra solicitante, finalidad, filtros, columnas, cantidad, fecha, IP, resultado y huella del archivo;
- archivos se generan en almacenamiento privado, con URL temporal y expiración corta;
- nombres de archivo y logs no contienen nombres, identificadores o diagnósticos;
- CSV protege contra inyección de fórmulas; XLSX/PDF requieren librerías y plantillas revisadas;
- no se envían archivos por correo automáticamente;
- una descarga vuelve a validar permiso y se audita.

## Decisiones pendientes

1. Reportes realmente necesarios por rol.
2. Campos permitidos y umbrales de agregación.
3. Finalidades válidas y aprobación requerida.
4. Formatos iniciales; CSV es el candidato mínimo.
5. Tiempo de retención del archivo y registro de exportación.
6. Requisitos de anonimización o seudonimización.
