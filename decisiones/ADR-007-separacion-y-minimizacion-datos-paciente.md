# ADR-007 — Separación y minimización de datos de pacientes

**Estado:** aceptada parcialmente para demo sintética; propuesta para datos reales
**Fecha:** 2026-07-17
**Actualización:** 2026-08-04

## Contexto

La plataforma necesita relacionar casos con estudios sin convertir cada listado o flujo operativo en una exposición innecesaria de información identificatoria. Los usos, fundamento, retención y alcance institucional todavía deben validarse con CICUC.

## Propuesta

Separar lógicamente y en contratos de API:

1. `Paciente`: código interno, estado y metadatos operativos mínimos.
2. `DatoIdentificatorio`: identificador institucional, nombres, fecha de nacimiento y contacto.
3. Datos clínicos: diagnósticos, biomarcadores, tratamientos, laboratorios y antecedentes fechados.

Además:

- permisos distintos para identidad, clínica y operación;
- listados usan código interno, iniciales derivadas cuando estén autorizadas, edad calculada, patología y responsable;
- nunca persistir edad como sustituto de fecha de nacimiento cuando se necesite precisión histórica;
- consultas de identidad y exportaciones quedan auditadas;
- eliminación lógica y conservación según política aprobada;
- fixtures, tests, capturas y demos solo con personas ficticias.

## Decisiones requeridas antes de aceptar

- fundamento y evidencia que autoriza el registro;
- conjunto mínimo obligatorio y campos que no deben almacenarse;
- plazo de retención por categoría;
- quién puede acceder a identidad y por qué alcance;
- reglas de corrección, anonimización, exportación y disposición;
- cifrado adicional o separación física requerida por infraestructura.

## Decisión acotada para la demo

Se permite implementar y desplegar persistencia cuando se cumplan simultáneamente estas condiciones:

- el entorno se identifica como demo y contiene exclusivamente personas ficticias;
- el código de cada caso comienza con `PX-DEMO-`;
- no se almacenan nombre, RUT, contacto, identificador institucional ni fecha de nacimiento;
- la interfaz y API declaran que el registro es sintético y no clínico;
- no existe elegibilidad, recomendación, matching ni inferencia automática;
- los datos pueden reiniciarse como parte de la operación de demostración.

La aceptación parcial no resuelve Issues #5/#6 ni autoriza datos reales. Para operación clínica siguen pendientes todas las decisiones requeridas anteriormente.
