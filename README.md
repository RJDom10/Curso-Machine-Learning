# 🤖 Curso Machine Learning

Entorno de desarrollo completo y dockerizado para aprendizaje y práctica de **Machine Learning moderno** — desde ML clásico con scikit-learn hasta Deep Learning con TensorFlow y tracking de experimentos con MLflow.

---

## ✨ Características

- 🐳 **Entorno Dockerizado** — configuración reproducible, sin conflictos de dependencias
- 📓 **JupyterLab** — IDE interactivo para notebooks de ML
- 🧠 **TensorFlow + Keras** — framework de Deep Learning
- 📊 **MLflow** — tracking de experimentos, métricas y modelos
- 📈 **scikit-learn** — algoritmos clásicos de ML
- 🎨 **Matplotlib + Seaborn** — visualización de datos
- 🐼 **Pandas + NumPy** — manipulación y análisis de datos

---

## 🚀 Inicio Rápido

### Requisitos
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) instalado y ejecutándose

### Levantar el entorno

```bash
# Clonar el repositorio
git clone https://github.com/RJDom10/Curso-Machine-Learning.git
cd Curso-Machine-Learning

# Construir y arrancar
docker compose up --build
```

### Acceder a los servicios

| Servicio | URL | Descripción |
|----------|-----|-------------|
| 📓 JupyterLab | http://localhost:8888 | Notebooks de ML (sin token) |
| 📊 MLflow UI | http://localhost:5000 | Dashboard de experimentos |

> Para iniciar MLflow UI, abre una terminal en JupyterLab y ejecuta:
> ```bash
> mlflow ui --host 0.0.0.0 --port 5000
> ```

---

## 📁 Estructura del Proyecto

```
Curso-Machine-Learning/
├── 📄 Dockerfile              # Definición de la imagen Docker
├── 📄 docker-compose.yml      # Orquestación de servicios
├── 📄 requirements.txt        # Dependencias de Python
├── 📄 README.md               # Este archivo
├── 📂 notebooks/              # Jupyter Notebooks del curso
│   └── Intro01.ipynb          # Notebook introductorio
├── 📂 data/                   # Datasets
│   └── creditApproval_dataset.csv
└── 📂 docs/                   # Documentación
    ├── ESTRUCTURA.md           # Descripción detallada de cada archivo
    ├── DOCKER.md               # Guía de comandos Docker
    ├── MLFLOW.md               # Guía de uso de MLflow
    └── TENSORFLOW.md           # Guía de TensorFlow/Keras
```

---

## 🛠️ Stack Tecnológico

| Tecnología | Versión | Uso |
|------------|---------|-----|
| Python | 3.10 | Lenguaje principal |
| TensorFlow | ≥ 2.16 | Deep Learning |
| Keras | ≥ 3.3 | API de alto nivel para redes neuronales |
| scikit-learn | ≥ 1.4 | ML clásico (regresión, clasificación, clustering) |
| MLflow | ≥ 2.14 | Tracking de experimentos y modelos |
| Pandas | ≥ 2.2 | Análisis de datos |
| NumPy | ≥ 1.26 | Cómputo numérico |
| Matplotlib | ≥ 3.8 | Visualización |
| Seaborn | ≥ 0.13 | Visualización estadística |
| JupyterLab | ≥ 4.1 | IDE interactivo |
| Docker | — | Contenedorización |

---

## 📚 Documentación

Consulta la carpeta [`docs/`](docs/) para guías detalladas:

- [📁 Estructura del Proyecto](docs/ESTRUCTURA.md) — qué hace cada archivo
- [🐳 Guía de Docker](docs/DOCKER.md) — comandos y solución de problemas
- [🧪 Guía de MLflow](docs/MLFLOW.md) — tracking de experimentos con ejemplos
- [🧠 Guía de TensorFlow](docs/TENSORFLOW.md) — deep learning con ejemplos prácticos

---

## 💡 Ejemplo Rápido

```python
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score
import mlflow

# Cargar datos
df = pd.read_csv("data/creditApproval_dataset.csv")
X = df.drop("target", axis=1)
y = df["target"]

# Split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

# Entrenar con tracking
mlflow.set_experiment("credit-approval")
with mlflow.start_run():
    model = RandomForestClassifier(n_estimators=100)
    model.fit(X_train, y_train)
    acc = accuracy_score(y_test, model.predict(X_test))
    mlflow.log_metric("accuracy", acc)
    mlflow.sklearn.log_model(model, "model")
    print(f"Accuracy: {acc:.4f}")
```

---

## 🤝 Contribuir

1. Fork el repositorio
2. Crea tu rama (`git checkout -b feature/nueva-funcionalidad`)
3. Commit tus cambios (`git commit -m 'Agregar nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Abre un Pull Request

---

## 📝 Licencia

Este proyecto es para fines educativos.

---

<p align="center">
  Hecho con ❤️ para aprender Machine Learning
</p>
