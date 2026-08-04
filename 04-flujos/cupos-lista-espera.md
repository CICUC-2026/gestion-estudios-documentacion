# Flujo operativo propuesto de cupos y lista de espera

**Estado:** propuesta pendiente de validación operacional  
**Última actualización:** 2026-07-17

## Decisión acotada para demo sintética

ADR-008 adopta `confirmado`, `reservado`, `ocupado` y `pendiente_reconfirmacion` como estados administrativos separados. Confirmación y reserva duran 30 días por defecto, configurables entre 15 y 90; existe aviso siete días antes y nunca hay liberación o reasignación automática.

## Cupo

```text
informado -> tentativo -> solicitado -> confirmado -> disponible
                                      |                |
                                      |                +-> reservado -> ocupado
                                      +-> cancelado

Cualquier estado con fecha superada puede pasar a vencido mediante acción
operativa o tarea programada validada; nunca cambia una conclusión clínica.
```

`pendiente_actualizacion` es una marca de calidad temporal, no evidencia de disponibilidad.

## Reglas propuestas

- `fuente`, `responsable`, `fecha_confirmacion` y `actualizado_en` acompañan el estado;
- confirmar exige fuente y fecha; no se infiere desde correos o documentos;
- reserva identifica relación operativa, responsable y vencimiento;
- cada transición es auditada y usa control de concurrencia;
- indicadores distinguen claramente disponible, próximo, tentativo y desactualizado;
- alertas visuales generan atención, no reservan ni asignan automáticamente.

## Lista de espera

- pertenece a una asociación paciente-estudio y opcionalmente a un brazo;
- prioridad: `alta`, `media`, `baja`, `sin_definir`, sujeta a validación;
- orden puede cambiar manualmente con motivo y auditoría;
- vincular un cupo no reserva automáticamente;
- cierre conserva motivo, autor y fecha;
- identidad mostrada se mantiene minimizada.

## Decisiones pendientes

1. Quién puede confirmar, reservar, ocupar y cancelar.
2. Vigencia por fuente y umbrales de desactualización.
3. Regla exacta de reserva y vencimiento.
4. Criterios operativos de prioridad y desempate.
5. Qué alertas pueden generarse automáticamente sin riesgo.
