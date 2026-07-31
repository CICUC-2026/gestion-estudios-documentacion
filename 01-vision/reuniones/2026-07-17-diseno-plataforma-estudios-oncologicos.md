# Prompt de continuidad y transcripción — Diseño de plataforma de estudios oncológicos

**Proyecto:** CICUC Gestión de estudios clínicos  
**Organización:** https://github.com/CICUC-2026  
**Raíz local:** `/home/fabian/src/cicuc-2026`  
**Fecha de registro:** 2026-07-17  
**Estado:** evidencia primaria pendiente de validación clínica y operacional  

## Propósito de este documento

Este documento es autosuficiente: conserva las instrucciones para continuar el trabajo, registra lo realizado hasta ahora, define lo que debe hacerse a continuación y contiene al final la transcripción íntegra proporcionada por el usuario.

La transcripción puede contener errores del reconocimiento de voz. Ninguna frase aislada debe convertirse automáticamente en requisito clínico, regla de elegibilidad o automatización aprobada.

## Prompt de instrucciones para continuar

Trabaja exclusivamente en los repositorios de `CICUC-2026` y dentro de `/home/fabian/src/cicuc-2026`. No mezcles código, remotos, datos, issues, identidad ni documentación con OBDUC, Trasplan u otros productos. Los mockups de OBDUC solo fueron autorizados como referencia visual para rediseñar la experiencia de CICUC; la identidad, contenido y reglas deben seguir siendo propias de CICUC y mantener la paleta verde.

Antes de implementar requisitos derivados de esta reunión:

1. lee completa esta transcripción;
2. contrasta cada hallazgo con las HU-001 a HU-028 existentes;
3. clasifica cada hallazgo como requisito explícito, decisión, supuesto, pregunta abierta, riesgo o idea futura;
4. evita duplicar historias existentes;
5. propone enriquecer historias existentes cuando el alcance ya esté cubierto;
6. crea historias nuevas únicamente para vacíos funcionales reales;
7. conserva decisión humana y trazabilidad en toda preselección;
8. no implementes elegibilidad automática, extracción clínica, voz o escucha de comités sin una HU separada, revisión de privacidad/compliance, evaluación clínica y human-in-the-loop;
9. utiliza datos ficticios o anonimizados en desarrollo, demo y pruebas;
10. actualiza feature, HU, issue, GitHub Project, matriz de regresión y bitácora cuando una historia sea aprobada para implementación.

## Trabajo realizado hasta ahora

- Se crearon tres repositorios separados: documentación, backend y frontend.
- Se creó el GitHub Project de CICUC y un backlog inicial.
- Se documentaron visión, arquitectura, seguridad, flujos y decisiones iniciales.
- Se implementaron la fundación FastAPI/PostgreSQL y el frontend React/TypeScript/Vite.
- Se implementaron autenticación, sesiones revocables y protección de rutas.
- Existen HU-001 a HU-028 para fundación, permisos, estudios, protocolos, criterios manuales, pacientes minimizados, preselección manual, cupos, lista de espera, tareas, comités, notificaciones, auditoría, reportes, exportación, endurecimiento y recuperación.
- Se creó un `Makefile` raíz con `make run`, `make status`, `make logs` y `make kill`.
- Se creó una cuenta local de demostración y datos visuales ficticios.
- Se rediseñó el frontend con una experiencia operativa compacta, sidebar en escritorio, topbar, métricas, tablas y navegación inferior móvil, manteniendo la paleta verde CICUC.
- El frontend pasa lint, tipos, pruebas unitarias, build y pruebas Playwright en escritorio/móvil.

## Trabajo que estaba a punto de realizarse

Preparar un análisis profundo de la reunión sin implementar todavía. El resultado debe incluir:

1. matriz de hallazgos con evidencia temporal de la transcripción;
2. decisiones confirmadas y decisiones todavía ambiguas;
3. actores reales y propuesta de permisos por centro, estudio y función;
4. comparación contra HU-001 a HU-028;
5. historias existentes que deben enriquecerse;
6. historias nuevas candidatas con criterios verificables;
7. priorización entre MVP, fase posterior e investigación;
8. dependencias, riesgos clínicos/legales y preguntas para la siguiente reunión;
9. propuesta de actualización de features y matriz de regresión;
10. recomendación de siguiente tanda, sin declarar automatizaciones sensibles como aprobadas.

## Hipótesis inicial de historias candidatas

Estas son hipótesis para analizar, no numeración oficial ni autorización de implementación:

- consultar el inventario por patología, subtipo, escenario y línea de tratamiento;
- administrar estados preactivación, reclutando, seguimiento y cerrado con historial;
- asignar coordinadora y jefatura responsables por estudio y centro;
- registrar compromisos y metas temporales de reclutamiento;
- gestionar solicitud, cola internacional, asignación y vencimiento de slots;
- mantener una lista de candidatos operativa y justificada por slot;
- gestionar pretesting, muestra, examen, resultado, vigencia y vencimiento;
- programar reevaluaciones clínicas humanas de candidatos antes de un slot;
- advertir información de estudio, cupo o candidato desactualizada;
- visualizar KPIs de compromiso versus reclutamiento real;
- asistir la extracción de resúmenes y criterios desde protocolos con revisión humana, como fase futura;
- consultar por texto o voz con privacidad y consentimiento validados, como fase futura;
- estudiar asistencia en comité en tiempo real solamente como investigación posterior y no como MVP.

## Reglas de interpretación ya evidentes

- Factibilidad temprana y negociación confidencial no deben exponerse en el inventario clínico del MVP.
- Preactivación comienza cuando existe expectativa razonable de apertura cercana, mencionada como aproximadamente cuatro semanas.
- Un estudio puede dejar de reclutar y seguir activo por seguimiento de pacientes.
- Slot, prioridad operativa y preselección nunca equivalen a elegibilidad clínica automática.
- La meta de reclutamiento es un compromiso operativo/comercial, no un indicador de calidad clínica.
- Las alertas deben apoyar a personas responsables; no cambiar estados ni decidir automáticamente.
- La información debe mostrar fuente, responsable, fecha de actualización y antigüedad.
- La entrega esperada es un producto operativo con soporte y mantención, no solamente un prototipo.

---

# Transcripción íntegra proporcionada

Diseño de plataforma de estudios oncológicos
Meeting Title

Diseño de plataforma de estudios oncológicos
Participants

    Speaker 1: Oncólogo(a) e investigador(a) UC; líder clínico y dueño(a) del problema
    Speaker 2: Líder técnico/desarrollador de la plataforma
    Alex (Alex): Analista/Producto; realiza preguntas sobre procesos y datos
    Speaker 4: Médico/operaciones clínicas; aporta casuística (slots, coordinación, pretest)

Purpose / Agenda

Definir la estructura, usuarios y requerimientos de una plataforma para gestionar estudios clínicos oncológicos (inventario centralizado, criterios de elegibilidad, seguimiento y alertas), y acordar el plan de financiamiento y próximos pasos para su desarrollo.
Key Discussion Points

    Estados y módulos del estudio

- Se requieren secciones: preactivación (estudios por abrir ~4 semanas), activos (reclutando y seguimiento), y cerrados (remover o archivar).

- Estudios con seguimiento: pacientes que terminaron tratamiento pero siguen en control.

    Usuarios y gobernanza

- Usuarios clave: enfermeras coordinadoras por estudio y jefaturas de enfermería por centro (e.g., Católica, San Carlos).

- Fases previas (factibilidad y preactivación) son gestionadas por equipos específicos; al abrirse, pasa a equipo clínico.

    Inventario y fuente de verdad

- Situación actual: PDF (última versión en mayo) y documentos Word/Notas; no hay base de datos formal compartida.

- Objetivo: sistema centralizado tipo "inventario" de estudios con información actualizada y consultable.

    Criterios de elegibilidad y automatización

- Cada protocolo incluye criterios de inclusión/exclusión; necesidad de modelarlos como lógicas consultables.

- Potencial para extraer automáticamente resúmenes desde protocolos (IA) y permitir consultas por voz/texto.

    Flujos clínicos críticos

- Estudios con slots: requieren solicitud anticipada, lista de espera priorizada y respuesta en ~1 semana al asignarse cupo.

- Pretesting (biopsia/examen): demora ~1 mes; conviene anticipar pruebas para no perder oportunidades al fallar líneas previas.

- Riesgo de perder cupos por criterios clínicos dinámicos (p. ej., anemia) si no hay recordatorios/seguimiento.

    KPIs y reportes

- Dashboard para ver estado de estudios, reclutamiento comprometido vs. real, proximidad de slots y pacientes candidatos.

    Compromisos con patrocinadores

- Ejemplos: compromisos de reclutar 5 pacientes; metas típicas: 4 pacientes en 6 meses; incumplir afecta relación con farmacéuticas.

    Financiamiento y entrega de software

- Necesitan producto funcionando (no solo prototipo), con soporte/mantención el primer año.

- Oportunidad de fondo UC para profesores adjuntos: 8,5 millones; plazo hasta el 14 de agosto.

- Mala experiencia previa de la organización con "prototipos" sin entrega final; se requiere claridad en costos y alcance.
Decisions Made

    Speaker 1 y Speaker 2 acordaron estructurar la plataforma en tres estados: preactivación, activos (reclutando/seguimiento) y cerrados (a archivar/retirar).
    Se definieron como usuarios operativos principales a las enfermeras coordinadoras y sus jefaturas por centro.
    Se priorizará la gestión de estudios con slots mediante listas de espera y alertas previas.
    Se acordó preparar una postulación al fondo UC (profesores adjuntos) con fecha límite 14 de agosto para financiar el desarrollo inicial.

Action Items

    Speaker 1 - Enviar PDFs/protocolos vigentes, ejemplos de criterios y flujo actual (incluyendo documentos y formularios) - lo antes posible.
    Alex (Alex) y Speaker 2 - Consolidar requerimientos funcionales (módulos, roles, KPIs) y propuesta de alcance/entregables con costos y plan de mantención.
    Speaker 2 - Diseñar lógica de criterios (inclusión/exclusión), prototipo de extracción/IA y consultas por voz/texto.
    Equipo - Definir gobernanza de datos y responsables de actualización (enfermera coordinadora y jefatura por estudio/centro).
    Equipo - Diseñar alertas para estudios con slots, recordatorios clínicos (p. ej., hemoglobina) y vencimientos de pretesting.
    Speaker 1 y Speaker 2 - Armar la postulación al fondo UC antes del 14 de agosto; coordinar por la cadena de correo y compartir formularios.

Risks / Open Questions

    Financiamiento: dependencia del fondo UC; necesidad de plan alterno si no se adjudica.
    Datos sensibles y legales: acceso/uso de historias clínicas y mensajería (copiar/pegar, audios) requiere revisión de compliance.
    Calidad de datos: PDFs desactualizados (último de mayo); riesgo de decisiones con información incompleta.
    Gobernanza de actualización: definir claramente quién actualiza cada estado del estudio y con qué frecuencia.
    Integración en tiempo real con comités oncológicos y necesidad de latencia baja para alertas.

Important Highlights

    Plataforma se concibe como inventario centralizado de estudios con estados: preactivación, activos (reclutando/seguimiento) y cerrados.
    Modelar criterios de elegibilidad por estudio y automatizar resúmenes desde protocolos; habilitar consultas por voz/texto.
    En estudios con slots, mantener lista de espera priorizada y pedir cupos con anticipación; al asignarse, hay ~1 semana para incluir paciente.
    Pretesting (biopsia/sangre) toma ~1 mes; anticiparlo evita perder oportunidades tras fallas de tratamiento.
    KPIs: cumplimiento de metas de reclutamiento (p. ej., 4 en 6 meses; 5 comprometidos), estado de slots y candidatos listos.
    Postulación a fondo UC (8,5 millones) con deadline 14 de agosto para financiar el desarrollo; se requiere propuesta con entregables y mantención.
    Entrega debe ser producto operativo con soporte, no un prototipo; claridad en costos y responsabilidades.

Transcript

[0:00] Speaker 1: ¿Y sí

[0:00] Speaker 2: separarle? Es un raidita, Es un, no sé, como una una grabadora y control. No, ahorita yo no sé qué son los el tema cuando la manda con la idea ya descaracterizada. No, esos son los términos porque es casi gratis. Hay otros aparatos que, tengo otro, y hay que pagar

[0:20] Speaker 1: una suscripción y demás. Ya, y ahí podríamos poner también los estudios en preactivación. Sí, sí, sí. Perfecto.

[0:29] Speaker 2: Mencionándome que podrían estar acá. Posición,

[0:32] Alex: cerrados.

[0:33] Speaker 2: Ahí está, ¿Qué

[0:36] Speaker 1: cosa tengo? Está cerrado y podemos ponerlos en seguimiento, porque ahí aparece estudios que nos están reclutando, pero que siguen andando con los pacientes que terminaron tratamiento, pero están en seguimiento. Pensamos que el estudio no está reclutando. Y después, para los estudios, ya cerrado completamente, que probablemente los vamos a sacar de, no tiene sentido tenerlos ahí, y los que van a activarse. Se llama preactivación. Perfecto.

[1:08] Speaker 2: O sea, cada vez hay dos módulos de paciente. Sí.

[1:11] Speaker 1: Tres, siete. Ahí me funciona.

[1:16] Speaker 2: ¿Estás en el backlog, donde podríamos registrar los pacientes? Voy a darle un poco

[1:21] Speaker 1: a fuerte,

[1:22] Speaker 2: Ya, ok, bien. A los pacientes donde podríamos

[1:24] Speaker 1: registrarlo.

[1:26] Speaker 2: Estuve desarrollándolo y todavía me falta esa feature, que está como en el en el canvas, por hacer. Pero ahí podríamos tener a la a la gente, los pacientes para mirar, para ver cuáles se los tienen aquí conformados, el estudio asociado, y hacer un seguimiento, y bien querer resolver. Y ahí es acá donde entra, como cómo definido quiénes son los usuarios, quién lo ocupa, cuáles van a ser las personas que van a tener acceso, cómo... Operación

[2:02] Speaker 1: a la de los de los

[2:05] Speaker 2: Esta parte no lo entendí bien. Esta parte sí o sí la la generó la IAS, y acá hay una parte de de reportes. Es como más visual, como para ver la, como ver los KPIs, como ver algún indicador ahí, quizás. Esto es superarchaico, porque igual hay que hacer un levantamiento de la información un poco más elaborada, saber qué cosas tienen, pero ojalá algún Excel, algo que nos pueda proveer un poco información para poder abordar mejor el desafío. Lo de que se pueden levantar cosas rápido e ir probando, se puede. Entonces, el la la la plataforma como como como tú la la la la diseñaste, según lo que te mandó Benja, ¿qué cuál es la la la la problemática que responde? ¿Qué es el qué qué qué es el? Hay un sistema de información centralizado donde la gente pueda manejar la información y todo esté en la alcance? En general, cuando uno tiene una empresa y cosas así. No me gusta mucho hacer este símil, pero es como el No, sí, bueno, tú sí no sé. Cuando tú tenías un RP o 0 sea, es un problema es un problema de inventario, es un Sí, sí,

[3:14] Speaker 1: sí, un inventario.

[3:16] Speaker 2: No tiene nada de ir a a esas cosas, es como la base para firmarse y y ver cómo podemos abordar la otra cosa, desde la extracción de texto Fíjate. De cómo abordamos la parte de texto. Estaría superagradecido.

[3:31] Speaker 1: Esto para que veas como el sistema artaico que tenemos ahora, ¿ya? Desde la práctica hay un PDF que nos mandan cuando se acuerda que que en verdad no está siempre actualizado. Esta es la última versión que es de mayo, ¿verdad? Entonces, no está actualizado. Entonces, aquí sabemos que en la página cuatro y a cinco está el estudio de cáncer de mama, los ginecológicos, la página tres. Las cosas que tú ya, por ejemplo, vemos cáncer de mama. Ajá. Y ahí sabemos que hay que estudiar, porque así es como piensa el oncólogo. Para esta enfermedad, tengo distintos escenarios de tratamiento. Ayudancia, le llamamos a los pacientes que se operaron y, igual, necesitan un tratamiento preventivo. ¿Cómo se llama? Ayudancia. Ayudancia. Y después están los pacientes que ya son metastásicos y necesitan, primera línea de tratamiento, escuchá lo que le diste primero, te falló ese tratamiento, le das otro, esa es la segunda línea, te falló ese tratamiento, le das otro, esa es la tercera línea. Tú, por ejemplo, tienes un paciente que te falló el primer tratamiento, entonces le estás buscando un estudio en segunda línea, ¿ya? Aquí, por ejemplo, ves que un paciente, bueno, que tiene receptores de estrógeno positivo, es metastásico, ya recibió una primera línea de tratamiento, o sea, necesita una segunda línea, y en segunda línea está este estudio, ¿ya? Acá eso es con terapia endocrina. Otro escenario, con quimioterapia, no hay ninguna segunda línea. Acá hay otro tipo de cáncer de mama que se llama el triple negativo, digamos que yo tengo un paciente que no ha recibido ningún tratamiento, estaría este estudio acá, en primera línea. Entonces, esto te da como la el escenario global que te sepa qué está disponible y ahí

[5:07] Alex: ¿Por qué por qué eso

[5:08] Speaker 1: no tiene enfermedad ni segunda? Que no

[5:09] Speaker 2: tenemos

[5:10] Speaker 1: estudio. No hay un estudio disponible, porque

[5:11] Speaker 4: no no no tenemos ese, no no no prestamos ese servicio. Ok, perfecto. No

[5:15] Speaker 1: está ese servicio, exactamente, ¿ya? Entonces, aquí, después tenemos el detalle que esto ha sacado del protocolo de, por ejemplo, uno de los estudios que vimos anteriormente, ¿ya? Todos los estudios que están acá están detallados más a largo, uno por uno, ¿ya? Pasemos, por ejemplo, a otra enfermedad, en ginecología. Sáser de cuello uterino, paciente que nunca se ha tratado, va a primera línea, ¿ya? En primera línea habría eso. Después, digamos que tengo un paciente con cáncer de ovario, que nunca ha recibido tratamiento. Entonces, yo quiero saber, ay, ¿habrá algún estudio que le pueda ofrecer? En primera línea, puta, no, no tenemos. No había en primera línea, nada que hacer. Cáncer de endometrio, paciente que sí se trató con una sola línea de tratamiento. Ah, te cuento estudio disponible, ¿cachás? Y el detalle ahí del estudio está para acá abajo. ¿Está para un Excel? Esto es un PDF.

[6:07] Speaker 2: Ah,

[6:08] Speaker 1: un PDF. ¿Ya? Entonces, el, cuando tú revisas el estudio, el al oncólogo le interesa saber qué tipo de estudio es, es, por ejemplo, un fase tres. Tiene dos ramas, aún no van a recibir el tratamiento estándar que le daría el oncólogo, la otra rama recibiría la droga que está en investigación, y acá hay algunos criterios más específicos. Por ejemplo, el paciente, en el tratamiento previo, tiene que haber recibido una droga que se llama anti PD uno. Entonces, ahí empezamos con los detalles chicos, ¿cachás? Que no están en la en la primera parte, esto es como el nombre general, como sí, hay un estudio, pero después los criterios más específicos los tengo que revisar estudio por estudio. Por

[6:48] Speaker 2: ahí sería implementar varias lógicas Entonces, ahí hay

[6:51] Speaker 1: varias cosas, entonces

[6:52] Speaker 2: ¿cómo funciona el plan lógico? Por

[6:55] Speaker 1: ejemplo, nosotros en cada estudio, ejemplo, acá tengo algunos que son estudios en los que yo participo, y en cada uno tenemos el el protocolo, y yo me echo el resumen como difundirlo rápido entre mis colegas, porque nadie se va a leer un protocolo de cien páginas, ¿está ahí? Pero si tú, nosotros le podemos proporcionar el protocolo a la plataforma para que, por ejemplo, salga, de acá se extraiga automáticamente todo un resumen quizá de cuál es la droga que se usa en el estudio, porque el oncólogo igual quiere saber qué le voy a ofrecer al al paciente, tienen que tener comunidad general. Toda la información del estudio está acá, y lo más importante, que son los criterios. ¿Qué criterios tiene que cumplir ese paciente? Entonces, acá están todos los criterios de inclusión, que significa qué condiciones tiene que cumplir para entrar al estudio, y los que se llaman de exclusión, que significa que si el paciente tiene alguna de estas condiciones, queda fuera, ¿ya? Entonces, eso tiene que estar como en esta En la lógica. En la lógica y la aplicación, ¿catchás? Toda la información del

[8:04] Speaker 4: paciente

[8:05] Speaker 1: o todo el

[8:06] Speaker 2: peso de lo que eso puede ser automatizado, ¿dónde está? ¿La tiene subir manualmente? Como

[8:26] Speaker 4: que, por ejemplo, si es que yo le mando a la Erika ahora, Erika, seis que, mirá, yo trabajo en el hospital de Temuco. Tengo un paciente que tiene un melanoma, que ya le di hemoterapia y ahora está avanzando. ¿Este es el, tiene algún estudio para el paciente? Y la Erika me dice, sí, mira, puede ser que sí, mándame la historia ver si es que clasifica. Eso lo que hacemos actualmente. Ah,

[8:45] Speaker 2: ok. Y tú, a partir de la historia, reviso. Entonces

[8:47] Speaker 1: Sí, pero pero la idea sería automatizar todo lo más posible, ¿cierto? Porque muchas veces no te van a mandar inmediatamente una historia con todo. Quizás yo, hasta por audio, le puedo decir a la aplicación, hay una paciente de cuarenta años con un cáncer de mama, con receptor de estrés fino positivo que recibió esto? ¿Podría calificar para algún estudio? Sí, podría ser, pero nos falta saber esta información, estos criterios. Entonces, yo le digo al colega, oye, mira, sí tengo, pero tiene que cumplir con estos criterios. Más

[9:16] Alex: rápido que no te mande

[9:18] Speaker 4: Así es, para que te Y mando el pie o la ¿Y tampoco tenés y tampoco tenés problemas

[9:22] Speaker 1: como

[9:23] Speaker 4: legales de meterte en fichas, datos sencillos, cosas así?

[9:27] Speaker 1: Idea sería poder copiar y pegar, por ejemplo, ese mismo mensaje que te mandó el colega o tú dictarle un audio a la a la aplicación, estoy pensando en que todo sea lo más fácil posible, y ya en un nivel incluso más elevado, que estemos en comité oncológico con esta aplicación escuchando, y que nos tire una alerta en tiempo real. Oye, este paciente podría calificar para este con la información que nos acabas de dar en nuestro comité. ¿Cachá? Nosotros estamos en comité, y ahí es cuando se nos olvida qué estudio tenemos en curso. Entonces, vamos a estar revisando Y Daniel pregunta,

[10:01] Speaker 4: te pido los comités. Oye, ¿tenemos estudios con la línea? Chuta, parece no. ¿Habrá abierto o no? No, mira, la Oye, ¿no no no está, sea montadaca?

[10:10] Speaker 2: Pregunto por la sea, pregúntenle

[10:12] Speaker 1: el lunes. Porque alguien tiene un investigador de y y una duda, la se

[10:15] Speaker 4: han colado.

[10:15] Speaker 1: Porque

[10:16] Speaker 2: tú me estás de ahí arriba al PDF cuando estando aquí, si están disponibles estudios, ¿eso igual es el técnico? No? Que se pueden abrir estudios y Se pueden cerrar. Por eso es que esto tiene que estar

[10:25] Speaker 1: actualizado ¿Qué es lo real en la vida? Y aquí es muy real. ¿Un usuario? Las enfermeras coordinadoras. Ellas están ¿Salen en toda la? Ellos solo están en el Por eso les queríamos mostrar eso, porque ahí hay un enfermero jefe para los estudios de acá, hay un enfermero jefe para los estudios de San Carlos. Ok. Y abajo están enfermeros coordinadores que están para cada estudio, ¿ya? Sí, es una jerarquía Hay una jerarquía, pero en el fondo ¿Me quieren abrir?

[10:52] Speaker 2: Por ejemplo, cuando un médico quiere abrir un estudio, ¿tiene que hablar con los enfermeros para que? No, para para

[10:57] Speaker 1: abrir un estudio de todo un proceso que se llama factibilidad, una vuelta como bien la Ok. ¿Ya? Pero

[11:03] Speaker 2: en

[11:03] Speaker 4: general, así como el macro que

[11:05] Speaker 1: entiendan el flujo es

[11:05] Speaker 4: que, un laboratorio grande, yo, Pfizer, por ejemplo, dice, es que, o ahora mismo, un laboratorio grande dice, yo quiero probar la droga a para cáncer de páncreas. Ok. Ellos dicen, la tengo que probar en diez mil pacientes. Necesito reclutar pacientes de todas las partes del mundo demostrar que esto es bueno y poder venderlo porque es mismo en el negocio. Busco centros en distintas partes del mundo que sean capaces de reclutar pacientes y de ejecutar un estudio clínico. Entonces, buscan centros que tengan ciertas características con nosotros, etcétera. Y ellos después nos vienen a nosotros y dicen, hola, ¿ustedes lo pueden hacer? Lo vemos, conversamos, vemos la factibilidad, sí. O sea, es un proceso largo, dicen, ok, estamos listos. Y ellos nos dicen, ustedes tienen que reclutar lo que nos comprometimos, cinco pacientes. Nosotros tenemos cinco cubos.

[11:48] Alex: ¿Y eso queda en un en

[11:49] Speaker 2: en alguna base? Claro, toda esa información que se llama seguimos bien ahí los enfermeros. Mira, vamos a a

[11:55] Speaker 1: ordenarlos. Hay algo que se llama acá, ¿eso es donde? No, es que no son solo los enfermeros, porque antes de abrir un estudio, hay que un espacio que se llama factibilidad y preactivación del estudio. Entonces, hay una primera parte que se llama factibilidad, donde la empresa farmacéutica nos contacta, nos manda, se firma un acuerdo de confidencialidad, nos manda la información del estudio y nosotros contestamos una encuesta para ver si ellos nos seleccionan o no cómo se

[12:22] Alex: Eso me imagino que en esta época tiene

[12:23] Speaker 1: guardado con mails. Esto está en mails, pero esto no debería estar porque es confidencial y todavía no está aprobado, ¿ya? Después viene una segunda parte, que es cuando nos aceptaron el estudio, y viene dónde les hace que hacer contrato, el estudio se llama comité de ética, y ahí tampoco debería estar acá, porque esa fase demora como dos meses. Pero después hay un momento en que sí debería estar el estudio, que es lo que te decía, de preactivación, porque viene una parte en que ya sabemos como que nos van a dar el site ready, que se llama que el mundo podemos a incluir pacientes en el estudio, y se anticipa que el estudio va abrir en unas cuatro semanas. Entonces, ahí ya debería estar, porque yo debería estar atenta a que quizás yo tengo un paciente que va a poder calificar para ese estudio, que va a abrir más o menos cuatro semanas más. Entonces, tiene que estar en esa sección que se llama la la pre... ¿Cómo por? Preactivarse. Bien? ¿Catchás? Ya. Y aquí viene otra complicación. Bueno, el toda esa fase que es previa la maneja un equipo de factibilidades, la maneja un equipo de preactivación en que no tienen mucho que ver los enfermeros clínicos hasta que ya estamos como más cerca a que el estudio se vaya a abrir, ¿ya? Y ahí ustedes, o sea, ahí podemos tener el enfermero responsable de ese estudio y y su jefe de enfermería, que podría ser el encargado de actualizar esto, ¿ya? Ese es un tema, pero otro es que hay algunos estudios más difíciles porque tienen slots, tienen cupo, porque son estudios tremendamente competitivos y que piden como un criterio muy específico de ese paciente, ¿ya? Por ejemplo, acá en el en este... Espera, a ver, vamos a lo gastrointestinal.

[14:04] Speaker 2: Mira. ¿Información sensible? Esto no. No.

[14:08] Speaker 1: Acá, esto te lo puedo mandar. Por ejemplo, en cáncer de páncreas metastásico, esto ya no está actualizado, pero este estudio, primera línea, era con el slot, significa que hay que pedir el grupo. Entonces, tú tienes que estar claro qué es con el slot y que tú lo tienes que pedir anticipadamente, porque tenemos que tener entre comillas pacientes en lista de espera, porque no van a una partida internacional, y tú dices, sí, yo yo soy de Chile, de la Católica, voy a tener paciente que era un cupo, Dicen, ok, eres el quinto en la lista, ¿ya? Cuando te toque a ti, tenemos como una semana meter al paciente. Entonces, tenemos que tener claro, tenemos que tener una lista de espera, entre comillas, que es todo manual. Es como que al oncólogo lo refirieron, este paciente con cáncer de páncreas, que necesita partir del tratamiento, y lo tenemos ahí como en espera, porque nos va a llegar ese cupo. ¿Cadcé?

[15:00] Speaker 2: ¿Y eso lo hace específicamente? ¿Se lo

[15:03] Speaker 1: enfermó? ¿Qué nos enfermó? Y nosotros le mandamos también la información a la enfermera del estudio. Le decimos, oye, mirá Esos son los estudios que que

[15:11] Speaker 4: tienen, probablemente, el desafío, el el mayor desafío, son los que requieren mayor coordinación. Claro. Entre pedir el slot, que se mande la información, que te respondan, que le lleguen la información de vuelta.

[15:21] Speaker 1: Sí. Te doy otro ejemplo, ese ese de los slots es un escenario complicado. Después hay otro escenario, que es un un estudio que tengo yo, que es para pacientes que tienen una determinada alteración que se mide en la biopsia, ¿ya? Y son pacientes que ya fallaron a otra línea de tratamiento, y yo tengo que demostrar que tienen esa alteración en la biopsia, y ahí serían candidatos. Pero como sabemos que es difícil que tengan esa alteración, me permite analizarlo con tiempo. O sea, el paciente todavía no ha fallado el tratamiento previo, está recibiendo, por ejemplo, una quimioterapia, pero yo me anticipo que en tres meses más yo creo que ese paciente le va a ir mal, va a necesitar un nuevo tratamiento. Entonces, me adelanto y lo voy empezando ya a testear para

[16:10] Alex: potenciales sujetos.

[16:11] Speaker 1: O de telescandidatos. Sujetos. Voy a tener una soporte. ¿Cachá? Entonces, lo mismo, en, conversa en un comité y uno dice, o 0, por ejemplo, tú tienes un paciente y le dices, oye, tengo un paciente que está recibiendo este tratamiento, creo que va a fallar en un mes más. ¿Hay algún estudio al que vaya a poder participar? Sí, hay un estudio, pero tienes que pretestearlo. Entonces, ok, lo empiezo a testear desde ya, ¿cachás? Lo estoy como anticipando para el estudio club. Disculpa,

[16:41] Speaker 2: ¿me puedes repetir eso? ¿Cómo? ¿Qué es lo que me? Este

[16:44] Speaker 1: La biopsia.

[16:45] Speaker 2: Ok. Mira 000

[16:47] Speaker 4: morías un examen de sangre, lo mismo, claro. Entonces, te dizque antes del, hay, se tiene que cumplir la condición previa para que tú participes del estudio, y como eso se demora en analizarse varias semanas.

[16:57] Speaker 1: Demora como un mes. No no, tú tú tú no estás

[16:59] Speaker 4: esperando que el paciente, imagínate que falló el tratamiento, la enfermedad está creciendo, se siente mal. Tú le decís, oye, espérate un mes para ver si es que clasifica el estudio y después le decís, ¿sabes qué? Tolaneto no clasifica, y en una de esas se muere en ese mes, ¿cachás? Entonces, o 0 se siente mal, se os penaliza, le pasa una complicación, un tremendo lo he hecho antes. Entonces, tú te tú te te

[17:20] Speaker 2: te preparas para eso. Los los los

[17:24] Alex: te confundo. De TPOC, que te manda como un repide como que se puede llevar un paciente, también tienes que hacerle ese pretesting. Sí. O

[17:31] Speaker 4: con su guion, o sea, ahí el mismo problema, el mismo problema.

[17:34] Speaker 1: Paciente tiene que venir para acá, pretestearse, y ahí ya entra como nuestro, ¿sabes? Una vez que él ya llegó acá, yo ya sé, pues, le voy decir el resultado y ya lo voy a tener como en mente, ¿ya? Otras veces pasa que ya tengo pacientes en un estudio clínico que, si fallan a ese estudio clínico, yo les podría ofrecer este otro, y quizá igual requieren pretesteo. ¿Cachás? Este Entonces, igual los voy ir adelantando. Están acá, pero

[17:59] Speaker 2: si

[18:00] Speaker 4: fallan este, quizás podrían

[18:00] Speaker 1: ir a este acá. Ya,

[18:02] Speaker 4: perfecto. Entonces, como se podría ir adelantando con ciertas cosas,

[18:04] Speaker 1: ¿sí? Claro. Tú podrías decir, oye, dentro de mi base de datos de pacientes, tengo pacientes recibiendo todos los pacientes que están en este estudio, podrían eventualmente ir hacia otro. Entonces, estemos como encima de estos pacientes porque podrían calificar acá, ¿sí? ¿Y qué era

[18:19] Alex: antes les pasa que de repente chocan los pacientes? Como que ¿Te

[18:23] Speaker 4: aspiran varias cosas?

[18:24] Alex: ¿Como ocupas estos estudios?

[18:25] Speaker 2: Sí. Que no, ¿no? Sí. Más que nada que a veces, no sé, viene máximo a diez, llegan doce quizás y tienen que dejar alguna cuenta. Exactamente. Eso es lo que pasa. ¿No? Porque no Sí, tenemos que seleccionar al

[18:36] Speaker 1: paciente desde mejores condiciones.

[18:37] Alex: Ah,

[18:38] Speaker 1: ok. ¿Cachá? Y tenemos que hacer ese quinto. Ya, pero es el escenario como más menos menos probable. Ah, ok. ¿Cachá? No no nos pasa, pero no no es no es tan problemático. Mientras que nosotros los tengamos como bien categorizados antes, de que están en buenas condiciones clínicas, que ha sido evaluado, que cumple con los criterios, más o menos le damos prioridad en esa lista. Y el problema más

[19:02] Speaker 4: es que cuando no llegamos a cumplir cubos que cuando lo cumplimos Claro, el

[19:06] Speaker 1: problema es que no cumplir con la meta, porque nosotros nos seleccionan porque nosotros dijimos que podemos reclutar en seis meses cuatro pacientes. Y si no cumplimos con esa meta, como que quedamos mal con la farmacéutica. Te

[19:19] Speaker 4: entregaste tarde la tarea, quedar mal, no sé. Pero en cambio, si decís, mira, tenemos cuatro, pero aparte tenemos otro paciente más, nos podrían abrir un cupo extra y dicen, te van a decir, no más probable,

[19:28] Speaker 1: sí. No no es

[19:29] Speaker 4: de los slots, ¿cachás? No es de estos que te tienen que preabrir. Esto es como ya hiciste la pega, tenemos otro más. ¿Tendríamos los estudios estándar, que son los que vienen como con cupos comprometidos y uno podría solicitar más, como en el caso de que tengamos más candidatos?

[19:42] Speaker 1: Claro, lo de los los estudios necesitamos, ¿cierto? Tener los estudios que están en preactivación y entender más o menos cuándo se van a activar para ya tener como pacientes identificados, y tenemos que tener claro cuáles son los los estudios abiertos que están reclutando pacientes como ahora en este minuto, con qué criterios. Y dentro de esos que están activos, tenemos que estar muy encima de los que son con el slot, porque hay que pedir el slot de forma anticipada, y cuando te llega ese slot, tienes que tener la lista pero superclara y priorizada.

[20:11] Alex: Y una duda, el del slot también

[20:13] Speaker 2: tiene

[20:14] Alex: que pasar por el mismo proceso de cómputo de ética, como

[20:16] Speaker 1: Todos

[20:17] Alex: los

[20:17] Speaker 1: estudios, si ya están activos, es porque ya tienen comité de ética y está todo

[20:21] Speaker 2: Ah, que ya el slot puede que esté activo y no tienes que pasar por ese proceso. Sea, que eso ya

[20:25] Speaker 4: se hizo antes, o sea, está todo, ya eso está bien. El estudio esté, el estudio están dando, el estudio están dando tiene que estar listo el comité de ética. Perfecto, sí.

[20:32] Speaker 2: O sea, pacientes no van a comité de ética. El

[20:35] Speaker 4: estudio se sumera un comité de ética. Este estudio cumple

[20:38] Speaker 1: el Se llama preactivaciones, es por todo lo que pasa antes, ¿cachás? Y una vez está abierto el estudio, el stroke sale y tú me metes a ver paciente, ¿ya? Y ahí no nos puedes fallar. Entonces, por eso es importante priorizarlos de cierta forma, cual también le vamos a ofrecer primero, porque los los criterios, pues, de incluir el estudio son bien exigentes. Por ejemplo, el paciente no puede tener anemia. ¿Y qué pasa? Son pacientes con cáncer, entonces, de repente, están tan bien, se empiezan a sentir mal, resulta que tenía anemia. Me haberías dado cuenta antes, ¿cachás? Porque ya ahora perdí ese cupo, y y tengo que ver si me dejan testear a mi siguiente paciente en la lista Negativo. Y los

[21:18] Alex: los requisitos, ¿qué tan difíciles son de de conocer? Como esto que me dijiste de que tengan anemia. Mira, estudio va a tener un cierto requisito, ¿esos tú los tienes que

[21:28] Speaker 2: a investigar de uno? Sí. ¿Eso toma

[21:31] Alex: tiempo o es algo que que en verdad es inmediato?

[21:34] Speaker 1: Mira, no es tan complejo como que los pacientes son nuestros porque los estamos viendo. Ya. Exactamente, pero sí, debería haber como una especie de recordatorio para que la enfermera vea como, oye, ¿en verdad este paciente podría ser un candidato? ¿Este slot se viene pronto y no sabemos de él hace un mes? Como que hay que hay que recheckar qué es todo que hay

[21:55] Speaker 2: con el paciente. Ya, pero en general la información es bastante. Sí. Ya,

[21:59] Alex: entiendo. Yo te voy a preguntar es sobre las enfermeras. ¿Tú sabes si tienen un Excel donde manejan esto o tienen alguna base de datos?

[22:09] Speaker 1: No, no, no tienen una base de datos pro para nada. Por suerte lo tienen anotado en un Word, en Dexter. Ah, ya. Sí, porque era

[22:19] Alex: un Excel compartido.

[22:19] Speaker 1: No te, no, no creo. O sea, yo creo que es muy predatorio, lo lo lo tendríamos que ver, pero yo creo que es bien predatorio. ¿Disculpa? ¿Disculpa? ¿Te podría dar cuenta? ¿La cuenta? Yo lo invito. Eso. ¿Tiene más preguntas que me diga? Me tengo que ir a otra reunión, pero estoy disponible para cualquier pregunta. Lo único que me preocupa es ver, Jorge me decía que Isaac o no va a calificar para este proyecto que se paga en el fondo. Y de lo otro que del no quieren como soltar plata para nada, porque dicen que trabajaron una vez con esto antes, pero fue hace años atrás y tuvieron una mala experiencia porque te te entregan como un prototipo, pero no te ¿Entraron botado? No te entregan los Claro. Listo, te te entregan una propina, por favor, sí. Te entregan como ¿Cómo pudiera? Como la idea de, oye, así lo tendrías que diseñar, pero la máquina no te queda algo inmediatamente en Zoom. Entonces, ya me dijeron, no, Ice, Ice, no, vamos a a

[23:26] Speaker 2: ¿Se refiere a Zoom?

[23:29] Speaker 1: Sí. Entonces, yo le preguntaba, Jorge, cómo funciona esto en términos de, en tiempo esto funciona, hay que pagar, más o menos. En general, saber

[23:39] Speaker 2: software, una entrega al cliente un producto andando. Uno lo educa, explica cómo funciona la red, qué lo que hay que pagar, dónde hay que pagar, no sé si transparente. Por lo menos, lo pone a desarrolladores. Sí. Y, en general, se llega a un acuerdo dependiendo a si se quiere seguir desarrollando, implementando features o actividades o hacer la mantención. Ya. En

[24:02] Speaker 1: el

[24:02] Speaker 2: primer año, en el que era, las cosas también tiene que haber una, como un seguimiento y una mantención, porque pasan cosas los software están hechos hasta que era el hecho callar, y cada vez se, trata de llegar a un satur donde no va a

[24:18] Speaker 1: ser.

[24:18] Speaker 2: ¿Hay algo que podemos conversar? ¿Sí? Seguir hablando?

[24:23] Speaker 1: En

[24:25] Speaker 2: general, acá yo me da cuenta que yo y los chicos, cuando yo hablo por mí y me da cuenta que los chicos tienen un espíritu de querer generar soluciones más que enriquecernos o buscar un beneficio económico. Yo, claro,

[24:39] Speaker 1: yo

[24:40] Speaker 4: prefiero que al final es igual, o sea, si si bien nosotros nos conocimos por el tema como a través de la de la universidad, etcétera, probablemente sea como la compra de un servicio externo en términos prácticos.

[24:53] Speaker 1: Por eso solo tengo que tener claro, porque yo no no peso nada, ¿cachás? Yo casi la perder ahora

[25:00] Speaker 2: un poco el ¿de quién? De men de la universidad.

[25:03] Speaker 1: De los facultantes. O sea, el ahí la el jefe, el doctor Alterrat, es el jefe del CQ, pensando en si por ahí podemos como postular a un ¿señorita?

[25:14] Speaker 2: De la es de la, no es de usted, Cristo, es de la Universidad Católica. Es de la Universidad Católica. Sí.

[25:20] Speaker 1: Entonces, tendríamos que ver si por ahí conseguimos fondos o si se puede postular como un proyecto de de investigación que tenga

[25:27] Speaker 2: que ver con innovación. Yo trabajo con transplant y ellos ganaron un, bueno, no ganaron un fondo acá de los seis, de doce millones de pesos. Bueno, están desarrollando, y a mí, por ejemplo, a mí me tienen contratado como nuevo desarrollador.

[25:38] Speaker 1: Claro. Entonces, voy a buscar a qué proyecto podemos postular? Vamos a ver, porque, mira, hay un proyecto que va hasta el catorce de agosto, que es para profesores adjuntos, como, ya, y ahí son ocho millones y medio.

[25:51] Alex: ¿Eres

[25:51] Speaker 1: para adjuntos? Sí. Ya. Entonces, yo podría postular a ese. ¿Me tendrían que juntar contigo? ¿Lo podemos hacer virtual con ustedes? Es como, porque yo tengo que mandar el el proyecto. Entonces, necesito explicar qué es lo que vamos a hacer, y no tengo vocabulario para ese

[26:08] Speaker 4: obvio, pero pero pero hagamos, mira, hagamos un hagamos un, en en la misma cadena de correo, manda la información que hay ahí teniendo como de los formularios, de las cosas, y y construimos la la la la postulación en base a eso.

[26:22] Speaker 2: ¿Y esos archivos me los puedes mandar?

[26:23] Speaker 1: ¿Qué cosa? Es lo que tengo que esperar. Perdón, que llamara Tú, yo,

[26:26] Speaker 2: Alex. Porque me mandas

[26:27] Speaker 1: todo.

[26:28] Speaker 2: Para mí, quedé muy bien. Chao, Chao, dolerín. Sí.

