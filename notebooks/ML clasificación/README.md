# 🎯 Módulo: Modelos de Clasificación (Machine Learning)

Este directorio contiene la ruta formativa completa de algoritmos y técnicas para **Clasificación Supervisada** con Scikit-Learn y Python.

Cada método cuenta con su propia carpeta estructurada de forma modular, abarcando desde los fundamentos matemáticos y la intuición geométrica, pasando por el ajuste de hiperparámetros y control de sobreajuste, hasta cuadernos prácticos de ejercicios con sus respectivas soluciones comentadas en `.soluciones/`.

---

## 🗂️ Estructura de Métodos

```
ML clasificación/
├── 📁 01_Regresion_Logistica/
│   ├── 01_Fundamentos_Clasificacion_y_Regresion_Logistica.ipynb
│   ├── 02_Funcion_Costo_Optimizacion_y_Frontera_Decision.ipynb
│   ├── 03_Evaluacion_Metricas_Clasificacion.ipynb
│   ├── 04_Regularizacion_en_Regresion_Logistica_y_Multiclase.ipynb
│   ├── 05_Ejercicios_Clasificacion_Regresion_Logistica.ipynb
│   └── 📁 .soluciones/
│       └── 05_Soluciones_Clasificacion_Regresion_Logistica.ipynb
│
├── 📁 02_KNN/
│   ├── 01_Fundamentos_KNN_y_Distancias.ipynb
│   ├── 02_Hiperparametros_Eleccion_K_y_Fronteras.ipynb
│   ├── 03_Ejercicios_KNN.ipynb
│   └── 📁 .soluciones/
│       └── 03_Soluciones_KNN.ipynb
│
├── 📁 03_Arboles_Decision_Clasificacion/
│   ├── 01_Fundamentos_CART_Criterios_Gini_Entropia.ipynb
│   ├── 02_Hiperparametros_Poda_y_Visualizacion.ipynb
│   ├── 03_Ejercicios_Arboles_Clasificacion.ipynb
│   └── 📁 .soluciones/
│       └── 03_Soluciones_Arboles_Clasificacion.ipynb
│
├── 📁 04_Ensambles_Random_Forest/
│   ├── 01_Fundamentos_Ensembles_y_Bagging.ipynb
│   ├── 02_Random_Forest_Clasificacion.ipynb
│   ├── 03_Ejercicios_Random_Forest.ipynb
│   └── 📁 .soluciones/
│       └── 03_Soluciones_Random_Forest.ipynb
│
└── 📁 05_Naive_Bayes/
    ├── 01_Fundamentos_Teorema_Bayes_y_Variantes.ipynb
    ├── 02_Aplicacion_Gaussian_y_Clasificacion_Texto.ipynb
    ├── 03_Ejercicios_Naive_Bayes.ipynb
    └── 📁 .soluciones/
        └── 03_Soluciones_Naive_Bayes.ipynb
```

---

## 📚 Resumen de Contenidos por Método

### 1. 01_Regresion_Logistica
- **Fundamentos**: Falla de OLS en variables categóricas, función sigmoide, transformación logit y log-odds.
- **Función de Costo**: Entropía cruzada binaria (Log-Loss), optimización con gradiente y fronteras lineales.
- **Evaluación**: Matriz de confusión, precisión, recall, F1-score, curvas ROC-AUC y Precision-Recall.
- **Regularización y Multiclase**: Penalizaciones L1 (Lasso) / L2 (Ridge) y estrategias OvR (One-vs-Rest) / Multinomial (Softmax).

### 2. 02_KNN (K-Nearest Neighbors)
- **Fundamentos**: Aprendizaje perezoso (Lazy Learning), métricas de Minkowski (L1, L2, Chebyshev), bolas unitarias.
- **Preprocesamiento**: Importancia crítica del escalado (`StandardScaler`, `MinMaxScaler`) y Pipelines para evitar fuga de datos.
- **Hiperparámetros**: Compromiso sesgo-varianza según $K$, esquemas `uniform` vs. `distance`, visualización 2D con `DecisionBoundaryDisplay`.
- **Ajuste y Diagnóstico**: Curva de validación, `GridSearchCV` y la maldición de la dimensionalidad.

### 3. 03_Arboles_Decision_Clasificacion
- **Algoritmo CART**: Estructura de árboles, particiones binarias ortogonales y reducción de impureza.
- **Criterios de Impureza**: Deducción y comparación gráfica entre Índice Gini y Entropía de Shannon.
- **Control de Sobreajuste**: Pre-poda (`max_depth`, `min_samples_split`, `min_samples_leaf`) y post-poda por costo-complejidad (`ccp_alpha`).
- **Interpretabilidad**: Inspección visual con `plot_tree`, reglas de texto con `export_text` y análisis de `feature_importances_` (MDI vs. Permutación).

### 4. 04_Ensambles_Random_Forest
- **Fundamentos de Ensamble**: Teorema del Jurado de Condorcet, reducción de varianza y taxonomía (Bagging, Boosting, Voting).
- **Bagging y Muestras OOB**: Muestreo con reemplazo, demostración analítica de la fracción OOB ($\approx 36.8\%$) y `oob_score_`.
- **Random Forest**: Doble aleatorización (Bootstrap + submuestreo de variables $m=\sqrt{D}$), descorrelación de árboles e hiperparámetros.
- **Ensamble Heterogéneo**: `VotingClassifier` combinando clasificadores probabilísticos con `voting='soft'`.

### 5. 05_Naive_Bayes
- **Formulación Bayesiana**: Teorema de Bayes, regla de decisión MAP y la suposición ingenua de independencia condicional.
- **Variantes en Scikit-Learn**: `GaussianNB` (datos continuos), `MultinomialNB` (conteos discretos) y `BernoulliNB`.
- **Suavizado de Laplace**: Parámetro `alpha` para evitar probabilidades nulas en características no vistas.
- **NLP y Benchmark**: Clasificación de texto con `TfidfVectorizer`, cálculo de medias/varianzas condicionales y comparativa de velocidad de entrenamiento e inferencia contra los demás algoritmos.
