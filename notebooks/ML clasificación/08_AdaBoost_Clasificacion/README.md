# Módulo 08: AdaBoost (Adaptive Boosting) - Clasificación

Serie completa de 6 cuadernos interactivos de Jupyter (`.ipynb`) sobre el algoritmo **AdaBoost**, su formulación teórica, extensión multiclase SAMME, sensibilidad al ruido y ejercicios prácticos:

1. **`01_Fundamentos_AdaBoost_Pesos_y_Decision_Stumps.ipynb`**: Derivación matemática de pesos de muestra ($w_i$), error ponderado ($\varepsilon_m$), autoridad del modelo ($\alpha_m$) e implementación desde cero en NumPy con visualización del crecimiento de los pesos.
2. **`02_Funcion_Perdida_Exponencial_y_Algoritmo_SAMME.ipynb`**: Demostración de AdaBoost como minimización de la pérdida exponencial $\exp(-y F(\mathbf{x}))$, comparación frente a Log-Loss y Hinge Loss, y formulación multiclase **SAMME**.
3. **`03_Hiperparametros_Estimadores_Base_y_Sensibilidad_Outliers.ipynb`**: Estudio de la profundidad del árbol base (`max_depth`), interacción con `learning_rate` y experimento de degradación ante ruido en las etiquetas (*label noise* / outliers).
4. **`04_Interpretabilidad_Importancia_y_Benchmark_Ensambles.ipynb`**: Inspección de atributos internos (`estimator_weights_`, `estimator_errors_`), importancia ponderada de variables y benchmark frente a Random Forest y Gradient Boosting.
5. **`05_Ejercicios_AdaBoost.ipynb`**: 5 ejercicios prácticos guiados.
6. **`06_Soluciones_AdaBoost.ipynb`**: Solucionario completo y verificado.
