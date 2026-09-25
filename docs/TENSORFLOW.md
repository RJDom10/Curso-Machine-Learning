# 🧠 Guía de TensorFlow y Keras

TensorFlow es el framework de deep learning más utilizado en la industria. Keras es su API de alto nivel que simplifica la creación de redes neuronales.

---

## Verificar la Instalación

```python
import tensorflow as tf
print(f"TensorFlow versión: {tf.__version__}")
print(f"Keras versión: {tf.keras.__version__}")
print(f"GPU disponible: {len(tf.config.list_physical_devices('GPU')) > 0}")
```

> **Nota:** Este entorno usa `tensorflow-cpu`. Para GPU, se necesita `tensorflow[and-cuda]` y una GPU NVIDIA con drivers CUDA.

---

## Conceptos Clave

| Concepto | Descripción |
|----------|-------------|
| **Tensor** | Array multidimensional (similar a numpy array pero optimizado para ML) |
| **Modelo Sequential** | Red neuronal capa por capa (la más simple) |
| **Modelo Functional** | Permite arquitecturas complejas (múltiples entradas/salidas) |
| **Capas (Layers)** | Bloques de construcción: Dense, Conv2D, LSTM, Dropout, etc. |
| **Optimizador** | Algoritmo de entrenamiento: Adam, SGD, RMSprop |
| **Loss Function** | Función de pérdida que el modelo intenta minimizar |

---

## Ejemplos Prácticos

### Clasificación Binaria (como crédito aprobado/rechazado)
```python
import tensorflow as tf
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler

# Preparar datos
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)
X_train, X_test, y_train, y_test = train_test_split(X_scaled, y, test_size=0.2)

# Crear modelo
model = tf.keras.Sequential([
    tf.keras.layers.Dense(64, activation='relu', input_shape=(X_train.shape[1],)),
    tf.keras.layers.BatchNormalization(),
    tf.keras.layers.Dropout(0.3),
    tf.keras.layers.Dense(32, activation='relu'),
    tf.keras.layers.Dropout(0.2),
    tf.keras.layers.Dense(1, activation='sigmoid')
])

# Compilar
model.compile(
    optimizer='adam',
    loss='binary_crossentropy',
    metrics=['accuracy', tf.keras.metrics.AUC(name='auc')]
)

# Entrenar con early stopping
early_stop = tf.keras.callbacks.EarlyStopping(
    monitor='val_loss', patience=10, restore_best_weights=True
)

history = model.fit(
    X_train, y_train,
    epochs=100,
    batch_size=32,
    validation_split=0.2,
    callbacks=[early_stop],
    verbose=1
)
```

### Clasificación Multiclase
```python
model = tf.keras.Sequential([
    tf.keras.layers.Dense(128, activation='relu', input_shape=(n_features,)),
    tf.keras.layers.Dense(64, activation='relu'),
    tf.keras.layers.Dense(n_classes, activation='softmax')  # softmax para multiclase
])

model.compile(
    optimizer='adam',
    loss='sparse_categorical_crossentropy',  # si labels son enteros
    metrics=['accuracy']
)
```

### Visualizar el Entrenamiento
```python
import matplotlib.pyplot as plt

fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(14, 5))

# Pérdida
ax1.plot(history.history['loss'], label='Train')
ax1.plot(history.history['val_loss'], label='Validation')
ax1.set_title('Pérdida (Loss)')
ax1.legend()

# Precisión
ax2.plot(history.history['accuracy'], label='Train')
ax2.plot(history.history['val_accuracy'], label='Validation')
ax2.set_title('Precisión (Accuracy)')
ax2.legend()

plt.tight_layout()
plt.show()
```

---

## Callbacks Útiles

| Callback | Uso |
|----------|-----|
| `EarlyStopping` | Detiene el entrenamiento cuando la métrica deja de mejorar |
| `ModelCheckpoint` | Guarda el mejor modelo durante el entrenamiento |
| `ReduceLROnPlateau` | Reduce la tasa de aprendizaje cuando se estanca |
| `TensorBoard` | Visualización avanzada del entrenamiento |

```python
callbacks = [
    tf.keras.callbacks.EarlyStopping(patience=10, restore_best_weights=True),
    tf.keras.callbacks.ReduceLROnPlateau(factor=0.5, patience=5),
    tf.keras.callbacks.ModelCheckpoint('mejor_modelo.keras', save_best_only=True)
]
```

---

## Buenas Prácticas

1. **Siempre normaliza los datos** antes de alimentar una red neuronal
2. **Usa `EarlyStopping`** para evitar overfitting
3. **Empieza con modelos simples** y aumenta la complejidad gradualmente
4. **Usa `Dropout`** como regularización (0.2 - 0.5)
5. **Monitorea train vs validation** para detectar overfitting
