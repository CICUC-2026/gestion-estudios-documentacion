# HU-037 — Desplegar backend vigente en EC2

**Tipo:** historia-usuario  
**Actor:** admin  
**Estado:** implementada  
**Última actualización:** 2026-08-04  
**Feature relacionada:** [Fundamentos de la plataforma](../../features/en-desarrollo/fundamentos-plataforma.md)  
**Issue GitHub:** https://github.com/CICUC-2026/gestion-estudios-documentacion/issues/40  
**Project:** https://github.com/orgs/CICUC-2026/projects/1

## Historia

Como **administrador técnico**, quiero que cada cambio aprobado del backend actualice la API ejecutada en EC2 para que frontend, ECR y servidor no queden en versiones incompatibles.

## Contexto y criterios verificables

- [x] El workflow publica la imagen versionada y actualiza el contenedor API de EC2.
- [x] La actualización aplica migraciones antes de servir tráfico.
- [x] El workflow falla si salud no responde o si el commit desplegado no coincide.
- [x] No imprime credenciales ni habilita puertos nuevos.
- [x] `/api/v1/tareas` deja de responder 404 en la demo.

## Impacto, contratos, permisos y riesgos

Impacta CI/CD y disponibilidad. Conserva `/api/v1`, PostgreSQL y frontend vigente. Requiere credenciales AWS del repositorio. Existe riesgo de interrupción breve y migración fallida; el workflow debe detenerse ante error.

## No alcance

- Alta disponibilidad, balanceador o RDS.
- Cambiar reglas clínicas o datos.

## Código relacionado y verificación

- `gestion-estudios-backend/.github/workflows/despliegue-aws.yml`.
- Docker Compose productivo en EC2.
- Verificación CI, salud y rutas públicas tras despliegue.

## Evidencia de implementación

- Backend: `fe8177d00e8f52776bbc33b709199cad013faea6`.
- [Validación backend](https://github.com/CICUC-2026/gestion-estudios-backend/actions/runs/30941868570): 21 pruebas, Ruff, MyPy, Alembic y build aprobados.
- [Despliegue backend](https://github.com/CICUC-2026/gestion-estudios-backend/actions/runs/30941868921): ECR, migraciones, EC2 y salud aprobados.
