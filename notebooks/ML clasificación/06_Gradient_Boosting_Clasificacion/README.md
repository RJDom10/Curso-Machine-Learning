# Módulo 06: Gradient Boosting Classifiers (XGBoost, LightGBM, CatBoost)

Este directorio contiene los cuadernos interactivos de Jupyter (`.ipynb`) dedicados a los algoritmos de **Gradient Boosting para Clasificación**, diseñados bajo la misma estructura pedagógica del curso de Machine Learning.

## Estructura de Archivos

1. **`01_Fundamentos_Gradient_Boosting_y_Variantes.ipynb`**
   - Diferencias entre Bagging y Boosting aditivo secuencial.
   - Formulación matemática para clasificación: *Log-Odds*, función sigmoide, pérdida *Binary Cross-Entropy (Log-Loss)* y derivación de los **pseudo-residuos** ($y_i - \hat{p}_i$).
   - Comparativa arquitectónica entre **XGBoost** (*depth-wise*), **LightGBM / HistGradientBoosting** (*leaf-wise* basado en histogramas) y **CatBoost** (*oblivious trees*).
   - Curvas de convergencia con `staged_predict_proba`, impacto del `learning_rate` y `subsample`.

2. **`02_XGBoost_LightGBM_CatBoost_y_Benchmark.ipynb`**
   - Regularización de segundo orden (Gradiente y Hessiano), penalizaciones $L_1/L_2$ (`reg_alpha`, `reg_lambda`) y ganancia mínima (`gamma`).
   - Implementación modular compatible con `XGBClassifier`, `LGBMClassifier`, `CatBoostClassifier` y `HistGradientBoostingClassifier` de Scikit-Learn.
   - Demostración de soporte nativo de valores faltantes (`NaN`) sin imputación previa.
   - Comparación de fronteras de decisión en 2D, importancia por permutación y benchmark integral de tiempos y ROC-AUC.

3. **`03_Ejercicios_Gradient_Boosting.ipynb`**
   - 5 ejercicios prácticos guiados (cálculo manual de pseudo-residuos y Hessiano, evolución multiclase en dataset *Wine*, *Early Stopping*, desbalance de clases con `class_weight='balanced'` y ajuste con `GridSearchCV`).

4. **`04_Soluciones_Gradient_Boosting.ipynb`**
   - Soluciones completas, comentadas y listas para ejecutar de los 5 ejercicios propuestos.
