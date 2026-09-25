# 📁 Estructura del Proyecto

Este documento describe cada archivo y directorio del repositorio **Curso-Machine-Learning**.

---

## Archivos Raíz

### `Dockerfile`
Define la imagen Docker del entorno de Machine Learning.

| Aspecto | Detalle |
|---------|---------|
| **Imagen base** | `python:3.10-slim` (ligera, sin paquetes innecesarios) |
| **Variables de entorno** | `PYTHONDONTWRITEBYTECODE=1` evita archivos `.pyc`; `PYTHONUNBUFFERED=1` muestra logs en tiempo real |
| **Directorio de trabajo** | `/home/jupyteruser/app` |
| **Instalación de dependencias** | Copia `requirements.txt` e instala todo con `pip` |
| **Usuario no-root** | Crea el usuario `jupyteruser` por seguridad (no se ejecuta como root) |
| **Puerto expuesto** | `8888` para JupyterLab |
| **Comando de inicio** | Arranca JupyterLab sin token ni contraseña para desarrollo local |

> **Nota de seguridad:** La autenticación está deshabilitada (`ServerApp.token=''`) porque este entorno es solo para desarrollo local. **Nunca uses esta configuración en producción.**

---

### `docker-compose.yml`
Orquesta el contenedor y define los servicios, puertos y volúmenes.

| Aspecto | Detalle |
|---------|---------|
| **Servicio** | `ml_env` — el entorno principal de ML |
| **Puertos** | `8888` → JupyterLab, `5000` → MLflow UI |
| **Volúmenes montados** | `./notebooks` → tus notebooks persisten fuera del contenedor |
| | `./data` → datasets compartidos entre host y contenedor |
| | `mlflow_data` → volumen Docker para artefactos de MLflow |

---

### `requirements.txt`
Lista de dependencias de Python instaladas en el contenedor.

| Paquete | Versión mínima | Propósito |
|---------|---------------|-----------|
| `numpy` | ≥ 1.26.0 | Cómputo numérico y operaciones con arrays |
| `pandas` | ≥ 2.2.0 | Manipulación y análisis de datos tabulares |
| `matplotlib` | ≥ 3.8.0 | Visualización de datos (gráficos estáticos) |
| `seaborn` | ≥ 0.13.0 | Visualización estadística avanzada (sobre matplotlib) |
| `scikit-learn` | ≥ 1.4.0 | Algoritmos de ML clásico (regresión, clasificación, clustering) |
| `jupyterlab` | ≥ 4.1.0 | IDE interactivo para notebooks |
| `tensorflow-cpu` | ≥ 2.16.0 | Framework de Deep Learning (versión CPU) |
| `keras` | ≥ 3.3.0 | API de alto nivel para redes neuronales |
| `mlflow` | ≥ 2.14.0 | Tracking de experimentos, registro de modelos y despliegue |

---

### `creditApproval_dataset.csv`
Dataset de aprobación de crédito utilizado en los notebooks de práctica. Contiene variables numéricas y categóricas para clasificación binaria (aprobado/rechazado).

---

## Directorios

### `notebooks/`
Contiene los Jupyter Notebooks con ejercicios y prácticas del curso.

| Archivo | Descripción |
|---------|-------------|
| `Intro01.ipynb` | Notebook introductorio — primeros pasos con el entorno y exploración de datos |

---

### `data/` *(nuevo)*
Directorio para almacenar datasets. Se monta como volumen en el contenedor para que los datos persistan y sean accesibles tanto desde el host como desde JupyterLab.

---

## Volúmenes Docker

| Volumen | Tipo | Uso |
|---------|------|-----|
| `./notebooks` | Bind mount | Notebooks persistentes entre reinicios |
| `./data` | Bind mount | Datasets compartidos |
| `mlflow_data` | Docker volume | Artefactos y registros de MLflow |
