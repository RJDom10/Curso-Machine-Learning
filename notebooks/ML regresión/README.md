# 📈 Módulo: Modelos de Regresión (Machine Learning)

Este directorio contiene la ruta formativa completa de algoritmos y técnicas para **Regresión Supervisada** (predicción de variables cuantitativas continuas) con Scikit-Learn, XGBoost y Python.

Cada método se encuentra organizado en su propia carpeta modular con teoría matemática, implementaciones en Scikit-Learn/XGBoost, visualizaciones y cuadernos de ejercicios prácticos con soluciones comentadas en `.soluciones/`.

---

## 🗂️ Estructura Completa de Métodos

```
ML regresión/
├── 📄 README.md
│
├── 📁 01_Regresion_Lineal/
│   ├── 01_Introduccion_ScikitLearn.ipynb
│   ├── 02_Regresion_Lineal_Simple_Multiple.ipynb
│   ├── 03_Regresion_Polinomial_Funciones_Base.ipynb
│   ├── 04_Seleccion_Variables_Correlacion.ipynb
│   ├── 05_Evaluacion_Error_R2_MSE.ipynb
│   ├── 06_Ejercicios_Regresion_Lineal.ipynb
│   └── 📁 .soluciones/
│
├── 📁 02_Regresion_Regularizada/
│   ├── 01_Fundamentos_Regularizacion_y_Escalado.ipynb
│   ├── 02_Regresion_Ridge_L2.ipynb
│   ├── 03_Regresion_Lasso_L1_y_Seleccion_Variables.ipynb
│   ├── 04_ElasticNet_y_Comparativa_Modelos.ipynb
│   ├── 05_Ejercicios_Regresion_Regularizada.ipynb
│   └── 📁 .soluciones/
│
├── 📁 03_Arboles_Decision_Regresion/
│   ├── 01_Fundamentos_Arboles_Decision_Regresion.ipynb
│   ├── 02_Hiperparametros_Poda_y_Control_Sobreajuste.ipynb
│   ├── 03_Interpretacion_Visual_e_Importancia_Variables.ipynb
│   ├── 04_Ejercicios_Practicos.ipynb
│   └── 📁 .soluciones/
│
├── 📁 04_Random_Forest_Regresion/
│   ├── 01_Fundamentos_Bagging_y_Random_Forest_Regresion.ipynb
│   ├── 02_Hiperparametros_Interpretabilidad_y_PDP.ipynb
│   ├── 03_Ejercicios_Random_Forest_Regresion.ipynb
│   └── 📁 .soluciones/
│       └── 03_Soluciones_Random_Forest_Regresion.ipynb
│
├── 📁 05_KNN_Regresion/
│   ├── 01_Fundamentos_KNN_Regresion_y_Pesos.ipynb
│   ├── 02_Hiperparametros_Curva_Validacion_y_Dimensionalidad.ipynb
│   ├── 03_Ejercicios_KNN_Regresion.ipynb
│   └── 📁 .soluciones/
│       └── 03_Soluciones_KNN_Regresion.ipynb
│
├── 📁 06_XGBoost_Regresion/
│   ├── 01_Fundamentos_Gradient_Boosting_y_XGBoost.ipynb
│   ├── 02_Hiperparametros_Regularizacion_y_Early_Stopping.ipynb
│   ├── 03_Ejercicios_XGBoost_Regresion.ipynb
│   └── 📁 .soluciones/
│       └── 03_Soluciones_XGBoost_Regresion.ipynb
│
└── 📁 07_SVR_Regresion/
    ├── 01_Fundamentos_SVR_Epsilon_Insensible_y_Kernels.ipynb
    ├── 02_Hiperparametros_Escalado_y_Benchmark_Regresion.ipynb
    ├── 03_Ejercicios_SVR_Regresion.ipynb
    └── 📁 .soluciones/
        └── 03_Soluciones_SVR_Regresion.ipynb
```

---

## 📚 Resumen Curricular de los Nuevos Métodos

### 1. 04_Random_Forest_Regresion
- **Fundamentos**: Promedio de estimadores en Bagging ($\hat{f}_{bag} = \frac{1}{B}\sum f_b$), reducción activa de la correlación entre árboles mediante submuestreo de variables (`max_features`).
- **Muestras Out-Of-Bag**: Cálculo del error y $R^2_{OOB}$ sobre el $36.8\%$ de muestras fuera de bolsa sin requerir conjunto de validación adicional.
- **Interpretabilidad y PDP**: Importancia MDI vs. Permutación y Gráficos de Dependencia Parcial (`PartialDependenceDisplay`) en el dataset `auto_mpg.csv`.
- **Práctica**: Ejercicios en `insurance.csv` prediciendo costos médicos con `ColumnTransformer` y `OneHotEncoder`.

### 2. 05_KNN_Regresion
- **Interpolación Local**: Promedio aritmético simple (`weights='uniform'`) vs. promedio ponderado por distancia inversa (`weights='distance'`).
- **Escalado Crítico**: Efecto de `StandardScaler` en la geometría de distancias euclidianas.
- **Dilema Sesgo-Varianza**: Curva de validación para $K \in [1, 30]$ y sintonización de normas Minkowski ($p=1$ vs. $p=2$) con `GridSearchCV`.
- **Limitación de Extrapolación**: Demostración analítica y visual de la incapacidad de KNN para predecir tendencias fuera del rango numérico observado.

### 3. 06_XGBoost_Regresion
- **Descenso de Gradiente Funcional**: Ajuste secuencial de árboles sobre los pseudo-residuos ($y_i - \hat{y}_i^{(m-1)}$) y contracción con tasa de aprendizaje ($\eta$).
- **Matemática de XGBoost**: Expansión de Taylor de 2º orden con gradientes ($g_i$), hessianos ($h_i$) y regularización analítica ($\Omega(f)$).
- **Parada Temprana**: `early_stopping_rounds` para prevenir sobreajuste y benchmark frente a `GradientBoostingRegressor` y `HistGradientBoostingRegressor`.
- **Práctica**: Pipeline con `XGBRegressor`, monitoreo de curvas de pérdida y gráfico de importancia con `xgb.plot_importance`.

### 4. 07_SVR_Regresion
- **Pérdida $\epsilon$-Insensible**: Tolerancia de Vapnik ($L_\epsilon = \max(0, |y-\hat{y}|-\epsilon)$) y esparcidad de los vectores de soporte (`support_`).
- **Truco del Kernel**: Comparativa entre kernel Lineal, Polinomial y Gaussiano RBF ($\exp(-\gamma \|x-x'\|^2)$).
- **Calibración y Residuos**: Optimización conjunta de $C$, $\epsilon$ y $\gamma$ con `GridSearchCV` y análisis de homocedasticidad.
- **Gran Benchmark Comparativo**: Tabla y gráficos comparativos de los 6 modelos del curso ($R^2$, RMSE, MAE, tiempo de entrenamiento e inferencia).

---

## 💾 Datasets Utilizados en los Módulos
1. **Auto MPG (`data/auto_mpg.csv`)**: 392 registros continuos para modelar consumo vehicular (`mpg`) a partir de atributos físicos.
2. **Medical Insurance (`data/insurance.csv`)**: 1,338 registros con variables categóricas y continuas para modelar facturación de pólizas médicas (`charges`).
