# HU-029 — Paleta de color opaca y tema accesible para daltonismo

**Tipo:** historia-usuario  
**Actor:** admin  
**Estado:** implementada
**Última actualización:** 2026-08-04  
**Feature relacionada:** [Fundamentos de la plataforma](../../features/en-desarrollo/fundamentos-plataforma.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/38
**Project:** https://github.com/orgs/CICUC-2026/projects/1

**Preparación:** no tiene bloqueo funcional. La paleta es provisional hasta resolver Issue #7 y debe implementarse con tokens reemplazables, contraste medido y doble codificación de estados.

## Historia

Como **usuario de la plataforma**, quiero contar con una paleta cromática verde opaca desaturada y un selector de temas accesibles compatibles con daltonismo, para adaptar la interfaz a mis necesidades visuales y trabajar en un entorno accesible de alto contraste durante extensas jornadas operativas.

## Contexto y justificación

La interfaz actual utiliza tonos cromáticos estándar que requieren refinamiento hacia una tonalidad verde más opaca y sobria, acorde a la identidad propia de CICUC. Adicionalmente, el personal médico, de enfermería y de coordinación opera el sistema en entornos asistenciales con condiciones de iluminación variadas. Garantizar compatibilidad con personas con daltonismo (deuteranopía, protanopía y tritanopía) mediante selectores de tema visual, patrones de contraste y simbología adecuada evita la dependencia exclusiva del color para transmitir estados operacionales.

## Criterios de aceptación

- [x] Se ajusta la paleta de tokens CSS principales a un tono verde opaco (verde sobrio/desaturado de baja fatiga visual) que cumpla con un ratio de contraste mínimo de 4.5:1 (WCAG 2.1 AA) para texto normal.
- [x] Se añade un control selector de tema accesible en la barra de navegación superior horizontal.
- [x] El selector ofrece modos visuales predefinidos: **Estándar CICUC (Verde Opaco)**, **Alto Contraste** y **Adaptado para Daltonismo** (optimizando la diferenciación de estados sin depender exclusivamente de matices rojo/verde).
- [x] Los estados operativos, alertas, badges y botones no dependen únicamente de la diferencia de color; incluyen iconos, formas geométricamente diferenciables o etiquetas textuales visibles.
- [x] La preferencia del tema seleccionado se persiste localmente en la sesión/navegador (`localStorage`) de manera automática sin alterar la sesión del usuario.
- [x] La navegación mediante teclado (indicadores de foco visible `:focus-visible`) mantiene un contraste claro y distinguible en todos los temas.
- [x] Se ejecutan pruebas automatizadas de componentes (Vitest) y de interfaz end-to-end (Playwright) verificando el cambio de clases/atributos de tema en el DOM.

## Impacto sobre funcionalidades existentes

Afecta a la capa de diseño global (`CSS custom properties` / tokens de diseño) del frontend y al componente de la barra de navegación superior (`LayoutPrincipal`). No altera contratos de API ni endpoints del backend.

## Contratos que deben preservarse

- Navegación superior horizontal en escritorio y móvil.
- Identidad propia de CICUC sin reutilizar estilos, librerías ni componentes de otros productos.
- Los controles de UI mejoran la accesibilidad y la UX, pero nunca sustituyen la autorización en backend.
- Textos visibles en idioma español.

## No alcance

- Modificación de endpoints o esquemas en el backend.
- Incorporación de bibliotecas pesadas de temas de terceros.
- Alteración de reglas funcionales o lógica de negocio de los módulos clínicos.

## Riesgo clínico/legal

- La dependencia exclusiva del color en interfaces médicas o administrativas representa un riesgo operacional de mala lectura de estados o alertas por parte de profesionales con deficiencias en la visión del color.
- Diseñar con alto contraste y doble codificación (color + forma/texto) reduce la probabilidad de errores de interpretación en entornos asistenciales.

## Código relacionado

- `gestion-estudios-frontend/src/estilos/` — tokens CSS y variables de temas.
- `gestion-estudios-frontend/src/aplicacion/` — layout principal y selector de tema en la barra superior.
- `gestion-estudios-frontend/tests/` — pruebas Playwright de accesibilidad y selector de tema.

## Verificación esperada y regresión

- [x] Auditar contrastes de color con directrices WCAG 2.1 AA (mínimo 4.5:1 en texto y 3:1 en elementos gráficos).
- [x] Pruebas unitarias de renderizado y alternancia de temas mediante Vitest.
- [x] Prueba E2E en Playwright validando la alternancia y persistencia del tema en `localStorage`.
- [x] Verificación de navegación completa utilizando únicamente teclado.

## Evidencia de implementación

- Tokens y tres temas en `src/aplicacion/estilos.css`; selector y persistencia en
  `ContextoTema.tsx` y `LayoutPrincipal.tsx`.
- Contrastes auditados contra blanco: texto principal 16.49:1, secundario 5.93:1,
  terciario 4.60:1 y verde estándar 8.00:1; ajuste final en `9d5900b`.
- Frontend `77782cf`: contrato textual final, persistencia tras recarga y foco visible por teclado.
- Frontend `f256689` y `143c378`: barra móvil desplazable, separada del contenido, con objetivos
  táctiles de 44 px verificados bajo las mismas condiciones de CI.
- Verificación: ESLint, TypeScript, 6 Vitest, build y 14 escenarios Playwright en escritorio/móvil.
