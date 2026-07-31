# Preguntas y definiciones operativas para la contraparte clínica — CICUC

Este documento consolida las dudas de diseño de software, flujos operativos y requisitos regulatorios que deben ser validados y respondidos por el equipo clínico liderado por el Investigador Principal (UC) en la próxima sesión de trabajo. El objetivo es recopilar la información necesaria para cerrar el diseño del MVP antes de la postulación al fondo UC el 14 de agosto de 2026.

---

## 1. Gobernanza de datos y transiciones de estado de estudios

Para garantizar que el ciclo de vida del estudio sea administrativo y no interfiera con decisiones clínicas, se proponen las siguientes preguntas:

1. **Responsables de transiciones:**
   - ¿Quién tiene la autorización formal en cada centro para transicionar un estudio del estado de `preactivacion` al estado de `activo-reclutando`? ¿Corresponde a la Jefatura de Enfermería del centro, al Investigador Principal del estudio, o a un rol administrativo centralizado?
   - Si un estudio pasa de `activo-reclutando` a `activo-seguimiento` (donde ya no se reciben nuevos ingresos pero se controlan los pacientes existentes), ¿esta transición es automática tras el vencimiento de metas de tiempo, o debe ser declarada manualmente por la Enfermera Coordinadora?
2. **Estudios cerrados y conservación:**
   - Una vez que un estudio pasa a estado `cerrado`, ¿bajo qué circunstancias excepcionales se permitiría su reapertura? ¿Quién de la institución debe autorizar esa acción y cómo debe quedar registrada en la auditoría?

---

## 2. Parametrización y vigencia de pretesting

El pretesting de biopsias o exámenes especiales demora aproximadamente 1 mes. Proponemos parametrizar esta ventana por estudio en el backend, por lo que requerimos definir:

1. **Rango de vigencia típico:**
   - ¿Existe un límite máximo absoluto que deba imponerse en la interfaz para la ventana de pretesting (por ejemplo, nunca configurar más de 90 días)?
   - ¿Qué sucede operativamente cuando los resultados del pretesting vencen? ¿El paciente requiere obligatoriamente una nueva biopsia o examen de sangre, o la Enfermera Coordinadora puede re-validar el resultado anterior de forma manual mediante una justificación escrita?
2. **Visibilidad del pretesting:**
   - ¿El pretesting debe ser visible únicamente para el centro que lo solicitó, o debe existir un inventario cruzado de pretesting en caso de que un paciente pueda ser candidato para estudios en otros centros UC (ej. derivación de San Carlos a Casa Central)?

---

## 3. Justificaciones operativas para la lista de espera

Dado que el orden de la lista de espera de slots es manual y no clínico (según la regla del [ADR-003](file:///home/fabian/src/cicuc-2026/gestion-estudios-documentacion/decisiones/ADR-003-decision-clinica-humana.md)), requerimos establecer los motivos y justificaciones válidas:

1. **Catálogo de motivos para reordenamiento:**
   - Para evitar discrecionalidad, ¿cuáles son los motivos operacionales aceptables para que una coordinadora mueva a un candidato hacia arriba o hacia abajo en la lista de espera de un slot? (Ejemplos propuestos: *Vencimiento inminente de la ventana de ingreso*, *Falla terapéutica del tratamiento previo confirmada*, *Mejoría o estabilidad de parámetros clínicos críticos*).
   - ¿Existe alguna jerarquía de prioridad preestablecida que deba ser obligatoriamente registrada al ingresar un paciente a la lista de espera operativa?
2. **Información faltante y bloqueos:**
   - En la lista de espera se contempla la "información faltante". ¿Qué datos no clínicos u operativos (como firmas de consentimiento informado o confirmación de previsión de salud) bloquean la asignación de un slot, y cuáles son meramente informativos?

---

## 4. Compliance legal y uso de datos clínicos (ADR-007)

El manejo de información de historias clínicas exige alineación con la privacidad del paciente:

1. **Formato de derivación entre colegas:**
   - En el flujo actual, cuando un oncólogo externo u otro colega refiere a un paciente (ej. por mensaje o llamada), ¿cuál es el conjunto mínimo de datos de salud que se transfiere? 
   - ¿Cómo podemos garantizar que el ingreso de estos datos a la plataforma se realice de forma minimizada (sin registrar nombres, RUN ni fecha de nacimiento exacta en las fichas clínicas de preselección, según lo propuesto en el [ADR-007](file:///home/fabian/src/cicuc-2026/gestion-estudios-documentacion/decisiones/ADR-007-separacion-y-minimizacion-datos-paciente.md))?
2. **Consentimiento del paciente:**
   - ¿En qué momento exacto del flujo operativo (factibilidad, preactivación, lista de espera, pretesting) se le solicita el consentimiento informado al paciente para el uso de sus datos en la plataforma? ¿El sistema debe registrar la fecha y firma de dicho consentimiento antes de permitir registrar el pretesting o la preselección?
