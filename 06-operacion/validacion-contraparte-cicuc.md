# Documento de validación con contraparte — Plataforma CICUC

**Versión:** 1.0  
**Fecha:** 31 de julio de 2026  
**Estado:** Propuesta para revisión clínica, operativa y administrativa  
**Proyecto:** Plataforma de gestión de estudios clínicos oncológicos CICUC

> Este documento busca confirmar procesos, alcance y responsabilidades antes de
> continuar el desarrollo. No autoriza el tratamiento de datos clínicos reales,
> no reemplaza los protocolos oficiales y no permite que la plataforma determine
> elegibilidad clínica.

## 1. Objetivo de la validación

Confirmar con CICUC que el equipo de desarrollo comprendió correctamente:

- el problema operacional;
- los usuarios y responsables;
- el ciclo de vida de los estudios;
- la gestión de slots, listas de espera y pretesting;
- el alcance del primer producto funcional;
- las decisiones institucionales pendientes.

Los acuerdos obtenidos se incorporarán a las historias de usuario, criterios de
aceptación, diseño y pruebas.

## 2. Problema comprendido

Actualmente, la información sobre estudios puede encontrarse distribuida entre
PDF, Word, correos y notas. Esto dificulta saber con certeza:

- qué estudios están disponibles;
- cuál es su estado;
- qué protocolo está vigente;
- quién debe actualizar la información;
- qué slots, pretests y tareas están pendientes;
- qué compromisos de reclutamiento requieren seguimiento.

La necesidad prioritaria es una fuente de verdad operacional, actualizada,
gobernada y trazable.

## 3. Resultado propuesto para el MVP

Un usuario autorizado podrá:

1. consultar estudios por patología, línea, biomarcador, centro y estado;
2. conocer la versión vigente del protocolo y quién la confirmó;
3. distinguir preactivación, reclutamiento, seguimiento, hold, cierre y archivo;
4. consultar cohortes, ramas y criterios cargados manualmente;
5. gestionar slots, lista de espera, pretesting y tareas;
6. consultar reportes operativos con fecha de corte;
7. reconstruir cambios relevantes mediante auditoría.
8. disponer de una arquitectura modular y APIs documentadas, preparada para
   integraciones graduales con sistemas institucionales autorizados.

## 4. Alcance que no se propone para el MVP

- determinación automática de elegibilidad;
- extracción automática de protocolos;
- análisis de audio o escucha de comités;
- integración con ficha clínica;
- mensajería externa;
- recomendación o priorización clínica automatizada.

Estas capacidades podrán evaluarse posteriormente con validación humana,
evidencia trazable, controles de seguridad y aprobación institucional.

La preparación para interoperabilidad no significa que el MVP se conectará
automáticamente con fichas clínicas u otros sistemas. Cada integración futura
requerirá alcance, contrato, permisos, seguridad y pruebas específicas.

## 5. Plan de ejecución propuesto

- **Mes 1:** levantamiento de información, requerimientos y flujo de
  procesos/arquitectura.
- **Mes 2:** desarrollo de MVP funcional básico y validación con usuarios.
- **Mes 3:** puesta en marcha y marcha blanca.

## 6. Ciclo de vida propuesto

| Estado | Definición propuesta |
|---|---|
| Preactivación | Estudio próximo a abrir, potencialmente dentro de unas cuatro semanas |
| Activo reclutando | Estudio abierto y buscando participantes |
| Activo en seguimiento | No recluta, pero mantiene participantes en control |
| Hold | Reclutamiento temporalmente detenido |
| Cerrado | Sin reclutamiento ni seguimiento operativo activo |
| Archivado | Conservado únicamente para trazabilidad e historia |

El estado del estudio debe permanecer separado de la disponibilidad de cupos o
slots.

## 7. Información mínima del inventario

- código, nombre corto y título oficial;
- patrocinador, fase y diseño;
- patología, subtipo, escenario y línea;
- cohortes, ramas y biomarcadores;
- centro, investigador y coordinadora responsable;
- estado operativo;
- disponibilidad de cupo o slot;
- versión vigente del protocolo;
- fecha, fuente y responsable de la última verificación;
- próxima fecha de revisión.

## 8. Flujo propuesto de slots

1. Identificar anticipadamente una oportunidad potencial.
2. Solicitar un slot o registrar ingreso a lista de espera.
3. Registrar una prioridad operativa justificada.
4. Registrar confirmación del patrocinador.
5. Mostrar la ventana disponible y sus fechas.
6. Revisar criterios y datos dinámicos de manera humana.
7. Registrar utilización, liberación o vencimiento.

La lista de espera no constituye un ranking clínico. Cada movimiento debe
registrar responsable, fecha, fuente y motivo.

## 9. Flujo propuesto de pretesting

La plataforma permitirá seguir:

- prueba requerida;
- estudio o cohorte relacionada;
- fecha de indicación y toma;
- estado del resultado;
- fuente;
- vigencia o vencimiento;
- responsable y próxima acción;
- condición que gatillaría una revisión.

Los recordatorios serán administrativos y no modificarán automáticamente una
preselección ni reservarán cupos.

## 10. Usuarios propuestos

- investigador principal;
- médico investigador u oncólogo derivador;
- enfermera coordinadora;
- jefatura de enfermería;
- coordinación administrativa;
- equipos de factibilidad y preactivación;
- administración técnica;
- auditor autorizado.

Los permisos se definirán según centro, estudio, acción y relación con el
recurso. Un cargo o participación en una reunión no concederá automáticamente
acceso clínico.

## 11. Datos y resguardos

Antes de utilizar información real, CICUC deberá aprobar:

- datos mínimos permitidos;
- fundamento o consentimiento aplicable;
- permisos de visualización y modificación;
- separación de información identificatoria, clínica y operativa;
- retención y eliminación;
- custodia de protocolos y documentos;
- reglas de descarga y exportación;
- auditoría y respuesta ante incidentes.

Hasta esa aprobación, el desarrollo y las demostraciones utilizarán únicamente
datos ficticios.

## 12. Distribución propuesta de responsabilidades sobre datos

Esta distribución debe incorporarse a un contrato y a un anexo de tratamiento
de datos revisados por asesoría jurídica.

### CICUC como responsable de los datos

CICUC, como institución que determina los fines y medios del tratamiento,
debería asumir la responsabilidad por:

- definir la finalidad y base de licitud de cada tratamiento;
- determinar qué datos pueden incorporarse y su plazo de conservación;
- asegurar la legitimidad, exactitud y procedencia de los datos entregados;
- obtener consentimientos o autorizaciones cuando correspondan;
- gestionar derechos de los titulares y comunicaciones institucionales;
- autorizar usuarios, perfiles, integraciones, exportaciones y subencargados;
- custodiar las fichas clínicas y documentos fuente;
- adoptar las decisiones clínicas y operacionales basadas en la información.

### ADYAC como encargado o proveedor tecnológico

ADYAC trataría datos únicamente por cuenta de CICUC y conforme a instrucciones
documentadas. Sus obligaciones deberían limitarse a:

- construir y operar los componentes contratados;
- aplicar controles técnicos y organizativos proporcionales al riesgo;
- mantener confidencialidad y mínimo privilegio;
- no utilizar datos para finalidades propias;
- informar incidentes o instrucciones que parezcan contrarias al contrato;
- colaborar en auditorías y solicitudes dentro del alcance acordado;
- devolver o eliminar datos al finalizar, según instrucciones y obligaciones
  legales aplicables.

ADYAC no debería asumir responsabilidad por la legalidad de los datos
seleccionados por CICUC, la falta de consentimiento o autorización institucional,
la inexactitud de antecedentes ingresados por usuarios, el uso fuera del alcance
contratado ni decisiones clínicas u operacionales tomadas por CICUC. Esto no
excluye la responsabilidad propia de ADYAC por incumplimiento contractual, dolo,
culpa grave o vulneración de sus deberes legales directos.

## 13. Mecanismos contractuales y de protección recomendados

Antes de producción se recomienda formalizar:

1. **Contrato principal y alcance:** entregables, exclusiones, dependencias,
   criterios de aceptación y control de cambios.
2. **Anexo de tratamiento de datos:** roles, instrucciones, categorías de datos,
   finalidades, retención, devolución, eliminación y asistencia.
3. **Anexo de seguridad:** cifrado, accesos, registros, respaldo, vulnerabilidades,
   continuidad, ambientes y evidencia de pruebas.
4. **Matriz de responsabilidades:** quién autoriza usuarios, corrige datos,
   responde solicitudes, comunica incidentes y decide restauraciones.
5. **Subencargados:** autorización previa, listado de proveedores, ubicación de
   datos y obligaciones equivalentes.
6. **Incidentes:** canal, plazos de aviso, preservación de evidencia,
   investigación y coordinación de comunicaciones.
7. **Indemnidad recíproca:** CICUC responde por reclamos derivados de datos,
   instrucciones o decisiones bajo su control; ADYAC por incumplimientos
   atribuibles a sus propias obligaciones.
8. **Límite de responsabilidad:** monto máximo negociado, exclusión de daños
   indirectos y excepciones para dolo, culpa grave y materias que la ley no
   permita limitar.
9. **Propiedad intelectual:** titularidad del desarrollo específico, componentes
   preexistentes, licencias, software de terceros y continuidad de uso.
10. **Aceptación y garantía:** pruebas, plazo de observaciones, defectos cubiertos
    y diferencia entre corrección y nueva funcionalidad.
11. **Seguros:** evaluar responsabilidad civil profesional, ciberseguridad y
    cobertura de incidentes de acuerdo con el riesgo real.
12. **Solución de controversias:** ley aplicable, jurisdicción, notificación y
    mecanismo previo de escalamiento y negociación.

Ninguna cláusula puede impedir que un tercero presente una reclamación. El
objetivo es asignar responsabilidades de forma clara, reducir la probabilidad de
incidentes y definir quién soporta contractualmente sus consecuencias.

## 14. Marco legal de referencia

- Ley Nº 19.628, sobre protección de la vida privada, mientras continúe vigente.
- Ley Nº 21.719, que moderniza la protección de datos y entra en vigencia el
  1 de diciembre de 2026. Distingue al responsable que decide fines y medios y
  al encargado que trata datos por su cuenta, exigiendo medidas adecuadas al
  riesgo.
- Ley Nº 20.584: la información de ficha clínica y estudios asociados es dato
  sensible; su custodia, acceso, confidencialidad e interoperabilidad están
  sujetas a reglas sectoriales.
- Ley Nº 21.663, Marco de Ciberseguridad: contempla medidas permanentes para
  prevenir, reportar y resolver incidentes en las instituciones alcanzadas.
- Ley Nº 17.336: protege programas computacionales y documentación; el software
  desarrollado por encargo se presume cedido al cliente salvo pacto escrito en
  contrario.
- Código Civil, artículo 1558: permite modificar contractualmente determinadas
  reglas de responsabilidad, sin convertir una exención total en garantía de
  inmunidad.

Esta sección es una propuesta de gestión contractual, no un informe jurídico.
El contrato definitivo debe ser revisado por abogados de ambas partes.

## 15. Reportes propuestos

- estudios por estado, patología y centro;
- reclutamiento comprometido versus real;
- slots solicitados, asignados, utilizados y vencidos;
- lista de espera;
- pretests y tareas pendientes;
- antigüedad de la información;
- actividad y trazabilidad operacional.

Cada indicador deberá contar con definición, fuente, periodo, fecha de corte,
unidad de análisis y permisos aprobados.

## 16. Decisiones solicitadas a CICUC

| Tema | Propuesta | Validación |
|---|---|---|
| Estados del estudio | Preactivación, reclutamiento, seguimiento, hold, cerrado y archivado | ☐ Aprobar ☐ Ajustar |
| Responsable del inventario | Coordinadora por estudio con supervisión de jefatura | ☐ Aprobar ☐ Ajustar |
| Vigencia | Cada registro muestra fecha, fuente, responsable y próxima revisión | ☐ Aprobar ☐ Ajustar |
| Slots | Solicitud, espera, asignación, uso, liberación y vencimiento | ☐ Aprobar ☐ Ajustar |
| Lista de espera | Prioridad operacional trazable, no ranking clínico | ☐ Aprobar ☐ Ajustar |
| Pretesting | Tareas y recordatorios administrativos con fechas y responsables | ☐ Aprobar ☐ Ajustar |
| Pacientes | Solo datos ficticios hasta aprobar privacidad y permisos | ☐ Aprobar ☐ Ajustar |
| Elegibilidad | Siempre corresponde al investigador y equipo clínico | ☐ Aprobar ☐ Ajustar |
| IA y voz | Fuera del MVP administrativo | ☐ Aprobar ☐ Ajustar |
| Reportes | Implementar después de aprobar definiciones de KPI | ☐ Aprobar ☐ Ajustar |
| Responsabilidad de datos | CICUC como responsable; ADYAC como encargado bajo instrucciones | ☐ Aprobar ☐ Ajustar |
| Contrato de datos | Suscribir anexo de tratamiento y seguridad antes de producción | ☐ Aprobar ☐ Ajustar |

## 17. Preguntas para la reunión

1. ¿Quién mantiene cada estudio y quién lo reemplaza?
2. ¿Cada cuánto debe confirmarse la información?
3. ¿Cuándo un registro debe mostrarse como desactualizado?
4. ¿Qué estados y transiciones se usan actualmente?
5. ¿Qué diferencia operacional existe entre cupo y slot?
6. ¿Qué datos mínimos necesita una lista de espera?
7. ¿Qué pretests se anticipan y cuánto dura su vigencia?
8. ¿Dónde se custodiarán protocolos confidenciales?
9. ¿Qué puede consultar un oncólogo externo?
10. ¿Cómo se definen los compromisos y KPI de reclutamiento?
11. ¿Quién actuará formalmente como responsable de datos dentro de CICUC?
12. ¿Qué proveedores o subencargados institucionales están autorizados?
13. ¿Qué procedimiento institucional se aplicará ante incidentes?

## 18. Registro de validación

**Fecha de reunión:** _________________________________________________

**Participantes:** ____________________________________________________

**Acuerdos principales:**

______________________________________________________________________

______________________________________________________________________

**Observaciones o cambios requeridos:**

______________________________________________________________________

______________________________________________________________________

| Por CICUC | Por el equipo del proyecto |
|---|---|
| Nombre: __________________________ | Nombre: __________________________ |
| Cargo: ___________________________ | Cargo: ___________________________ |
| Firma: ___________________________ | Firma: ___________________________ |
| Fecha: ___________________________ | Fecha: ___________________________ |
