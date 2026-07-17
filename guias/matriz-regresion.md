# Matriz de regresión

Esta matriz crecerá con cada incremento implementado. Toda HU debe declarar áreas afectadas, contratos y pruebas concretas.

| Área | Contrato a proteger | Verificación mínima |
|---|---|---|
| Autenticación | Sesiones expiran y pueden revocarse | Tests API y ruta protegida frontend |
| Autorización | El backend niega recursos fuera de alcance | Tests positivos y negativos por rol |
| Auditoría | Mutaciones relevantes conservan autor, tiempo y cambio | Test de integración y consulta de auditoría |
| Estudios | Solo estados y responsables autorizados pueden modificarse | Tests de servicio y API |
| Protocolos | Solo una versión vigente; anteriores son inmutables | Restricción DB, test transaccional y API |
| Pacientes | Vistas exponen solo mínimo dato necesario | Tests de serialización y permisos |
| Preselección | Siempre manual y vinculada a una versión | Tests de reglas y transición |
| Cupos | Estado tentativo nunca aparece como confirmado | Tests de dominio y vista |
| Exportaciones | Exportación sensible requiere permiso y queda auditada | Test de autorización y auditoría |

Antes de implementar una HU, completar su impacto contra esta matriz y agregar las áreas nuevas que corresponda.
