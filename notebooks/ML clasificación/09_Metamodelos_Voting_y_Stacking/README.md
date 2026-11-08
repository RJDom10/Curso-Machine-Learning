# Módulo 09: Metamodelos (Voting y Stacking Classifiers) - Clasificación

Serie completa de 6 cuadernos interactivos de Jupyter (`.ipynb`) sobre **Ensambles Heterogéneos y Metamodelos (`VotingClassifier`, `StackingClassifier` y `Blending`)**:

1. **`01_Fundamentos_Ensambles_Heterogeneos_y_Voting.ipynb`**: Teorema del Jurado de Condorcet, diversidad de clasificadores, diferencias matemáticas entre *Hard Voting* y *Soft Voting*, ponderación de votos y visualización de fronteras de decisión combinadas.
2. **`02_Stacking_Classifier_Meta_Aprendizaje_y_Validacion_Cruzada.ipynb`**: Arquitectura de generalización apilada (*Stacked Generalization* de Nivel 0 y Nivel 1), prevención del *data leakage* mediante predicciones *Out-of-Fold* e inspección de los pesos aprendidos por el `final_estimator`.
3. **`03_Diversidad_de_Modelos_Calibracion_y_Blending.ipynb`**: Matriz de correlación de predicciones entre familias de algoritmos, calibración de probabilidades con `CalibratedClassifierCV` (isotónica y sigmoide) e implementación de *Blending* (*Hold-out Meta-Learning*).
4. **`04_Pipelines_Avanzados_Passthrough_y_Benchmark_Global.ipynb`**: Uso de `passthrough=True` vs `False`, integración con `make_pipeline` y benchmark global comparando los 9 paradigmas de clasificación del curso.
5. **`05_Ejercicios_Voting_y_Stacking.ipynb`**: 5 ejercicios prácticos guiados.
6. **`06_Soluciones_Voting_y_Stacking.ipynb`**: Solucionario completo y verificado.
