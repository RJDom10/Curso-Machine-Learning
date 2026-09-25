# 🧪 Guía de MLflow

MLflow es una plataforma de código abierto para gestionar el ciclo de vida completo de Machine Learning: experimentación, reproducibilidad y despliegue.

---

## ¿Qué es MLflow?

MLflow tiene 4 componentes principales:

| Componente | Descripción |
|------------|-------------|
| **MLflow Tracking** | Registra parámetros, métricas y artefactos de cada experimento |
| **MLflow Projects** | Empaqueta código de ML para que sea reproducible |
| **MLflow Models** | Formato estándar para empaquetar modelos de ML |
| **MLflow Model Registry** | Almacén centralizado para versionar y gestionar modelos |

---

## Uso Básico en un Notebook

### Tracking de un experimento con scikit-learn
```python
import mlflow
import mlflow.sklearn
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score

# Iniciar un experimento
mlflow.set_experiment("mi-primer-experimento")

with mlflow.start_run():
    # Definir hiperparámetros
    n_estimators = 100
    max_depth = 5
    
    # Entrenar modelo
    model = RandomForestClassifier(n_estimators=n_estimators, max_depth=max_depth)
    model.fit(X_train, y_train)
    
    # Predecir y evaluar
    predictions = model.predict(X_test)
    accuracy = accuracy_score(y_test, predictions)
    
    # Registrar en MLflow
    mlflow.log_param("n_estimators", n_estimators)
    mlflow.log_param("max_depth", max_depth)
    mlflow.log_metric("accuracy", accuracy)
    
    # Guardar el modelo
    mlflow.sklearn.log_model(model, "modelo_rf")
    
    print(f"Accuracy: {accuracy:.4f}")
```

### Tracking de un experimento con TensorFlow/Keras
```python
import mlflow
import mlflow.tensorflow
import tensorflow as tf

mlflow.set_experiment("deep-learning-exp")

with mlflow.start_run():
    # Definir modelo
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(128, activation='relu', input_shape=(n_features,)),
        tf.keras.layers.Dropout(0.3),
        tf.keras.layers.Dense(64, activation='relu'),
        tf.keras.layers.Dense(1, activation='sigmoid')
    ])
    
    model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])
    
    # Autolog registra automáticamente parámetros, métricas y modelo
    mlflow.tensorflow.autolog()
    
    # Entrenar
    history = model.fit(X_train, y_train, epochs=50, batch_size=32,
                        validation_split=0.2, verbose=1)
```

---

## Iniciar la UI de MLflow

Desde una terminal en JupyterLab:
```bash
mlflow ui --host 0.0.0.0 --port 5000
```

Luego abre http://localhost:5000 en tu navegador para ver:
- 📊 Todas tus ejecuciones (runs)
- 📈 Comparación de métricas entre runs
- 📦 Artefactos guardados (modelos, gráficas, etc.)

---

## Buenas Prácticas

1. **Siempre nombra tus experimentos** con `mlflow.set_experiment("nombre")`
2. **Registra todo**: parámetros, métricas, y artefactos
3. **Usa `autolog()`** cuando sea posible — registra automáticamente todo
4. **Compara runs** en la UI para encontrar la mejor configuración
5. **Versiona tus modelos** usando el Model Registry
