# Flujo propuesto de preselección administrativa

**Estado:** propuesta pendiente de validación clínica y operacional  
**Última actualización:** 2026-07-17

## Principio

La preselección documenta una revisión humana inicial. No reemplaza screening formal, evaluación clínica ni decisión de elegibilidad.

## Flujo

```text
pendiente_revision
        |
        v
    en_revision <-------------------+
     |   |   |                      |
     |   |   +-> posible_barrera ---+
     |   +-----> informacion_incompleta
     |                    |
     |                    +---------+
     v
posible_estudio_revisar
     |             |
     |             +-> lista_espera
     v
derivado_screening_formal
     |
     v
en_screening_formal
     |
     +-> cerrado

Cualquier estado activo puede pasar a descartado_preseleccion o cerrado
solo con motivo y autorización definidos.
```

## Estados propuestos

| Estado | Significado administrativo | No significa |
|---|---|---|
| `pendiente_revision` | Caso creado, sin revisión iniciada | Compatibilidad |
| `en_revision` | Profesional revisando información | Elegibilidad |
| `informacion_incompleta` | Faltan datos identificados | No elegibilidad |
| `posible_estudio_revisar` | Requiere discusión/revisión adicional | Recomendación de ingreso |
| `posible_barrera` | Existe un punto que requiere aclaración | Exclusión confirmada |
| `descartado_preseleccion` | El proceso administrativo no continúa, con motivo | Resultado de screening formal |
| `derivado_screening_formal` | Entregado al proceso formal | Aceptación |
| `en_screening_formal` | Seguimiento del proceso externo/formal | Resultado |
| `lista_espera` | Seguimiento operativo por disponibilidad | Prioridad clínica |
| `cerrado` | Proceso administrativo finalizado | Eliminación del historial |

## Estados de revisión de criterio

- `aparentemente_cumplido`;
- `pendiente_verificar`;
- `dudoso`;
- `aparentemente_no_cumplido`;
- `no_corresponde`.

Todas las etiquetas incluyen lenguaje de incertidumbre cuando corresponde. Ninguna se deriva automáticamente de datos clínicos.

## Reglas propuestas

- cada transición registra estado anterior/nuevo, autor, fecha, motivo y comentario;
- no se cambia de estado mediante edición directa de una columna;
- `cerrado` y `descartado_preseleccion` quedan inmutables;
- reapertura requiere capacidad específica, motivo y evento de auditoría;
- una versión nueva genera, como máximo, una tarea o marca de revisión pendiente; no copia ni recalcula evaluaciones;
- acciones de screening formal se registran como seguimiento, sin suplantar sistemas oficiales.

## Validaciones pendientes

1. Transiciones permitidas por actor.
2. Motivos obligatorios y catálogos.
3. Diferencia operacional entre descarte y cierre.
4. Quién puede derivar a screening formal.
5. Cuándo corresponde lista de espera.
6. Política de reapertura.

No implementar la máquina de estados hasta resolver estas preguntas.
