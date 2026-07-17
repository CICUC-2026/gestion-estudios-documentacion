# ADR-007 — Separación y minimización de datos de pacientes

**Estado:** propuesta — requiere validación clínica, legal y de seguridad  
**Fecha:** 2026-07-17

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

## Consecuencia mientras esté propuesta

Se permite documentar y prototipar con datos ficticios, pero no implementar persistencia de pacientes ni desplegar el módulo.
