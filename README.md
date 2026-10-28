# Curso de Machine Learning

Entorno de desarrollo integral y basado en contenedores para el estudio y la implementación de técnicas de Machine Learning. La arquitectura abarca desde algoritmos predictivos clásicos con scikit-learn hasta modelos de Deep Learning con TensorFlow, incorporando además el rastreo sistemático del ciclo de vida del modelo mediante MLflow.

---

## Características del Entorno

* **Contenedorización**: Configuración reproducible y aislada de dependencias mediante el uso de Docker.
* **Entorno de Desarrollo Integrado**: Implementación de JupyterLab como IDE para la ejecución interactiva de cuadernos de trabajo.
* **Deep Learning**: Soporte nativo para frameworks de vanguardia, incluyendo TensorFlow y Keras.
* **Gestión de Experimentos (MLOps)**: Plataforma MLflow configurada para el monitoreo de ejecuciones, métricas y versionado de modelos.
* **Machine Learning Clásico**: Suite completa de algoritmos de clasificación, regresión y agrupación mediante scikit-learn.
* **Visualización Analítica**: Capacidades de graficación y análisis exploratorio con Matplotlib y Seaborn.
* **Procesamiento de Datos**: Manipulación eficiente de estructuras de datos y cálculo numérico con Pandas y NumPy.

---

## Implementación y Despliegue

### Prerrequisitos
* Requiere la instalación y ejecución activa de [Docker Desktop](https://www.docker.com/products/docker-desktop/) en el sistema host.

### Inicialización del Entorno
Para aprovisionar y levantar los contenedores, ejecute las siguientes instrucciones en su terminal:

```bash
# Clonar el repositorio del proyecto
git clone https://github.com/RJDom10/Curso-Machine-Learning.git
cd Curso-Machine-Learning

# Construir las imágenes y desplegar los servicios
docker compose up --build
```

### Acceso a los Servicios

Una vez que los contenedores estén operativos, los servicios estarán disponibles en los siguientes endpoints locales:

| Servicio | Endpoint Local | Descripción |
|----------|----------------|-------------|
| JupyterLab | `http://localhost:8888` | Interfaz principal para la edición de notebooks de ML (acceso configurado sin token). |
| MLflow UI | `http://localhost:5000` | Panel de control para el monitoreo y registro de experimentos. |

> **Nota Operativa**: Para inicializar la interfaz gráfica de MLflow, es necesario abrir una sesión de terminal dentro de JupyterLab y ejecutar el siguiente comando:
> ```bash
> mlflow ui --host 0.0.0.0 --port 5000
> ```

---

## Estructura del Repositorio

La arquitectura del proyecto está organizada de la siguiente manera para separar la infraestructura, los datos y el código:

```text
Curso-Machine-Learning/
├── Dockerfile              # Especificación de la imagen base de Docker
├── docker-compose.yml      # Archivo de orquestación de servicios y puertos
├── requirements.txt        # Manifiesto de dependencias de Python
├── README.md               # Documentación principal del repositorio
├── notebooks/              # Directorio destinado a los Jupyter Notebooks de estudio
│   └── Intro01.ipynb       # Cuaderno de trabajo introductorio
├── data/                   # Directorio para el almacenamiento de conjuntos de datos locales
│   └── creditApproval_dataset.csv
└── docs/                   # Directorio de documentación técnica complementaria
    ├── ESTRUCTURA.md       # Arquitectura y explicación detallada de cada módulo
    ├── DOCKER.md           # Referencia operativa y gestión de comandos Docker
    ├── MLFLOW.md           # Manual de implementación y rastreo con MLflow
    └── TENSORFLOW.md       # Guía práctica para el uso de TensorFlow y Keras
```

---

## Arquitectura Tecnológica

El entorno garantiza la estabilidad utilizando las siguientes versiones de software y librerías:

| Tecnología | Versión Mínima | Propósito en el Entorno |
|------------|----------------|-------------------------|
| Python | 3.10 | Lenguaje de programación principal. |
| TensorFlow | ≥ 2.16 | Arquitectura y entrenamiento de modelos de Deep Learning. |
| Keras | ≥ 3.3 | API de alto nivel para el diseño de redes neuronales. |
| scikit-learn | ≥ 1.4 | Implementación de modelos de Machine Learning tradicional. |
| MLflow | ≥ 2.14 | Rastreo del ciclo de vida de los modelos y métricas de evaluación. |
| Pandas | ≥ 2.2 | Limpieza, estructuración y análisis de datos tabulares. |
| NumPy | ≥ 1.26 | Operaciones algebraicas y cómputo numérico de alto rendimiento. |
| Matplotlib | ≥ 3.8 | Generación de visualizaciones de datos estáticas. |
| Seaborn | ≥ 0.13 | Visualización avanzada de datos con enfoque estadístico. |
| JupyterLab | ≥ 4.1 | Entorno de desarrollo interactivo (IDE). |
| Docker | — | Orquestación, aislamiento y contenedorización del entorno. |

---

## Referencias de Documentación

Para acceder a información técnica exhaustiva sobre cada componente, consulte los manuales ubicados en el directorio `docs/`:

* [Estructura del Proyecto](docs/ESTRUCTURA.md): Explicación funcional detallada de los archivos y subdirectorios.
* [Guía de Operaciones Docker](docs/DOCKER.md): Listado de comandos de gestión y resolución de incidencias frecuentes.
* [Guía de Implementación MLflow](docs/MLFLOW.md): Metodología de rastreo de experimentos con ejemplos prácticos.
* [Guía de Referencia TensorFlow](docs/TENSORFLOW.md): Fundamentos y aplicación de modelos de Deep Learning.

---

## Ejemplo de Implementación Estándar

El siguiente bloque de código demuestra un flujo de trabajo típico: el entrenamiento de un clasificador Random Forest incorporando el registro automático de métricas y el versionado del modelo a través de MLflow:

```python
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score
import mlflow

# Carga y estructuración del conjunto de datos
df = pd.read_csv("data/creditApproval_dataset.csv")
X = df.drop("target", axis=1)
y = df["target"]

# Partición de los datos (Conjuntos de Entrenamiento y Evaluación)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

# Configuración del espacio de trabajo en MLflow
mlflow.set_experiment("credit-approval")

# Ejecución del entrenamiento y registro de telemetría
with mlflow.start_run():
    # Instanciación y entrenamiento del modelo
    model = RandomForestClassifier(n_estimators=100)
    model.fit(X_train, y_train)
    
    # Evaluación del rendimiento predictivo
    acc = accuracy_score(y_test, model.predict(X_test))
    
    # Registro de métricas y artefactos en el servidor de MLflow
    mlflow.log_metric("accuracy", acc)
    mlflow.sklearn.log_model(model, "model")
    
    print(f"Precisión del modelo (Accuracy): {acc:.4f}")
```

---

## Lineamientos de Contribución

Se fomenta la colaboración en este proyecto. Para contribuir, siga el flujo de trabajo de control de versiones estándar:

1. Realice un *Fork* del repositorio a su cuenta personal.
2. Cree una rama independiente para el desarrollo de su funcionalidad (`git checkout -b feature/nueva-funcionalidad`).
3. Confirme sus modificaciones locales (`git commit -m 'Implementación de nueva funcionalidad'`).
4. Envíe los cambios a su repositorio remoto (`git push origin feature/nueva-funcionalidad`).
5. Genere un *Pull Request* para iniciar el proceso de revisión de código.

---

## Licencia del Proyecto

El código fuente, la arquitectura del entorno y la documentación de este repositorio están provistos exclusivamente para fines académicos y educativos.

---
*Proyecto de infraestructura desarrollado para el estudio continuo y la profesionalización en técnicas analíticas y de Machine Learning.*