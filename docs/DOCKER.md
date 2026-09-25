# 🐳 Guía de Docker

## Requisitos Previos

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) instalado y ejecutándose
- Git (opcional, para clonar el repositorio)

---

## Comandos Básicos

### Construir y levantar el entorno
```bash
docker compose up --build
```
> Esto construye la imagen y arranca el contenedor. La primera vez tarda más por la descarga de dependencias.

### Levantar sin reconstruir
```bash
docker compose up -d
```
> La bandera `-d` ejecuta el contenedor en segundo plano (*detached mode*).

### Detener el contenedor
```bash
docker compose down
```

### Ver logs del contenedor
```bash
docker compose logs -f
```
> La bandera `-f` sigue los logs en tiempo real.

### Reconstruir la imagen (después de cambiar `requirements.txt` o `Dockerfile`)
```bash
docker compose build --no-cache
docker compose up -d
```

---

## Acceso a los Servicios

| Servicio | URL | Descripción |
|----------|-----|-------------|
| JupyterLab | http://localhost:8888 | IDE para notebooks (sin token) |
| MLflow UI | http://localhost:5000 | Interfaz de tracking de experimentos |

> **Nota:** Para acceder a MLflow UI, primero debes iniciar el servidor de MLflow desde una terminal dentro de JupyterLab:
> ```bash
> mlflow ui --host 0.0.0.0 --port 5000
> ```

---

## Ejecutar Comandos Dentro del Contenedor

```bash
# Abrir una terminal dentro del contenedor
docker exec -it curso_ml501-ml_env-1 bash

# Verificar las versiones instaladas
docker exec curso_ml501-ml_env-1 python -c "import tensorflow; print(tensorflow.__version__)"
docker exec curso_ml501-ml_env-1 python -c "import mlflow; print(mlflow.__version__)"
```

---

## Solución de Problemas

### JupyterLab pide token o contraseña
El `Dockerfile` ya está configurado para deshabilitar la autenticación con:
```
--ServerApp.token='' --ServerApp.password='' --IdentityProvider.token=''
```
Si aún pide token, reconstruye la imagen:
```bash
docker compose down
docker compose build --no-cache
docker compose up -d
```

### El contenedor se detiene inmediatamente
Revisa los logs para encontrar el error:
```bash
docker compose logs
```

### Los cambios en notebooks no se guardan
Asegúrate de que los notebooks estén guardados en la carpeta `/home/jupyteruser/app/notebooks` dentro de JupyterLab, que corresponde a `./notebooks` en tu máquina local.
