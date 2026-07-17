# Autenticación y sesiones

## Flujo

1. Administración crea la primera cuenta mediante el comando interactivo del backend.
2. Una cuenta administradora autenticada puede crear otras cuentas.
3. El usuario entrega correo y contraseña a `/api/v1/autenticacion/ingresar`.
4. El backend responde con un token opaco y expiración.
5. El navegador conserva el token en `sessionStorage` y consulta `/autenticacion/yo`.
6. Cada endpoint protegido valida token, expiración, revocación y estado de cuenta.
7. Logout, revocación manual, cambio de contraseña o desactivación invalidan sesiones según corresponda.

## Endpoints implementados

| Método | Ruta | Propósito |
|---|---|---|
| POST | `/api/v1/autenticacion/ingresar` | Iniciar sesión |
| GET | `/api/v1/autenticacion/yo` | Obtener perfil mínimo |
| POST | `/api/v1/autenticacion/salir` | Revocar sesión actual |
| GET | `/api/v1/autenticacion/sesiones` | Listar sesiones propias |
| DELETE | `/api/v1/autenticacion/sesiones/{id}` | Revocar sesión propia |
| POST | `/api/v1/autenticacion/cambiar-contrasena` | Cambiar contraseña y revocar otras sesiones |
| POST | `/api/v1/usuarios` | Crear cuenta como administrador |
| PATCH | `/api/v1/usuarios/{id}/estado` | Activar o desactivar cuenta |

## Contrato de error

```json
{
  "error": {
    "codigo": "CREDENCIALES_INVALIDAS",
    "mensaje": "Las credenciales no son válidas."
  }
}
```

No se incluyen correos, tokens, hash de contraseña ni motivos internos en respuestas o logs.

## Fuera de alcance actual

- recuperación automática de contraseña;
- SSO y MFA;
- roles y alcances clínicos configurables;
- interfaz completa de administración de usuarios.
