# Feature — Evolución del inventario operativo

**Estado:** completada
**Tanda:** 2.1

## Objetivo

Evolucionar el inventario ya implementado para representar el funcionamiento
real observado en el catálogo CICUC de julio de 2026 y conectar la experiencia
web con las APIs existentes, sin publicar documentos confidenciales ni datos de
contacto personales.

## Resultado esperado

Un coordinador autorizado consulta y mantiene un inventario proveniente del
backend, distingue estado operacional de disponibilidad, navega cohortes,
brazos, versiones y criterios, conoce fuente y vigencia de cada registro y puede
cargar una fotografía sanitizada mediante un proceso revisable.

## HUs

- HU-030 — Separar estado operacional y disponibilidad del estudio.
- HU-031 — Modelar poblaciones, cohortes y brazos del estudio.
- HU-032 — Registrar fuente, vigencia y responsable de verificación.
- HU-033 — Conectar el inventario web con la API de estudios.
- HU-034 — Consultar el detalle estructurado de un estudio.
- HU-035 — Importar un catálogo sanitizado de estudios.

## Dependencias

- HU-004 a HU-009 implementadas y verificadas en código.
- Catálogo operacional y transiciones pendientes de validación institucional.
- Política de custodia documental pendiente; los PDF originales permanecen
  fuera del repositorio público.

## Contratos

- el estado operacional no se deriva de la disponibilidad;
- no se elimina historia para adaptar datos existentes;
- la interfaz no reemplaza errores de API con datos ficticios silenciosamente;
- toda fecha de vigencia muestra fuente y responsable;
- la importación rechaza contactos personales y datos de pacientes;
- el protocolo completo no se publica ni se incorpora al seed;
- ninguna vista determina elegibilidad clínica.

## No alcance

- extracción automática u OCR;
- integración con ficha clínica;
- datos de pacientes;
- recomendación de estudios;
- sincronización automática con patrocinadores.
