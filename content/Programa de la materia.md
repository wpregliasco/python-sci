---
publish: true
---

## 1. Datos generales

|  |                                                                    |
|--------------------|--------------------------------------------------------------------|
| Profesores         | Rodolfo Pregliasco y Mariano Gómez Berisso                         |
| Duración           | 2 meses                                                            |
| Carga horaria      | 64 hs                                                              |
| Créditos           | 4                                                                  |
| Evaluación         | Ejercicios resueltos durante el curso y examen final no presencial |

## 2. Objetivos

El objetivo de este curso es que los estudiantes adquieran un conocimiento sólido del lenguaje Python orientado a la investigación y el desarrollo en física e ingeniería. Se priorizan los fundamentos del lenguaje y su aplicación a problemas de cálculo numérico, procesamiento de datos y visualización.

A diferencia de una introducción puramente técnica, el curso incorpora desde el inicio una perspectiva de formación integral como programador, que incluye tres dimensiones adicionales:

- **Buenas prácticas de programación:** escritura de código legible, documentado y reutilizable, como condición para el trabajo científico de calidad.
- **Trabajo colaborativo y control de versiones:** uso de herramientas como Git y uv para gestionar proyectos en equipo y mantener una historia reproducible del trabajo.
- **Uso crítico de herramientas de IA:** el curso incorpora explícitamente el uso de asistentes de programación basados en IA como recurso de apoyo, con el criterio de que el estudiante debe comprender y poder explicar todo código que utilice, independientemente de su origen.

Al finalizar el curso, se espera que el estudiante sea capaz de resolver problemas propios de su disciplina de forma autónoma, con criterio para evaluar y adaptar soluciones generadas por cualquier fuente, humana o artificial. Asimismo, se espera que el código producido pueda ser comprendido, ejecutado y corregido por otros: esto implica no solo claridad en la escritura, sino también atención a la documentación, la gestión de dependencias y la reproducibilidad del entorno, aspectos que en Python tienen una importancia particular y que forman parte de la práctica profesional y científica.

---

<div class="page-break" style="page-break-before: always;"></div>

## 3. Ejes transversales

Los siguientes contenidos no están confinados a una clase específica sino que se trabajan de forma continua a lo largo de todo el curso:

- **Uso crítico de IA para programar:** VS Code con asistente de IA desde la clase 1. Se trabaja la validación del código generado, la detección de errores y limitaciones, y el criterio para incorporarla responsablemente al flujo de trabajo.
- **Buenas prácticas:** estilo PEP8, nombres significativos, documentación de funciones, código legible y reutilizable.
- **Control de versiones con Git:** se introduce en el bloque 2 y se usa activamente en el resto del curso.
- **Reproducibilidad del entorno:** uso de `uv` para gestión de dependencias y entornos virtuales. Todo proyecto del curso debe poder ser ejecutado por otro estudiante sin modificaciones.

---

## 4. Contenidos y programa

### Bloque 1 — Arranque inmediato: programar desde el primer día

_Clases 1 a 4. El estudiante resuelve problemas reales desde la primera clase. Las estructuras del lenguaje se introducen cuando el problema las necesita._

---

#### Clase 1 — Primer programa: caída libre

**Contenidos específicos**

- Instalación y configuración del entorno: VS Code + extensión Python + asistente de IA
- Primeros pasos con el asistente de IA: cómo formular preguntas, cómo validar respuestas
- Variables y tipos numéricos: enteros, flotantes, operaciones básicas
- Listas: creación, acceso, modificación
- Primer gráfico con Matplotlib: posición vs tiempo
- Lectura de archivos con `with open()`: introducción al context manager como hábito, sin explicación formal

**Integración transversal**

- Uso guiado del asistente de IA para escribir el primer programa
- Criterio básico: "entendé cada línea antes de ejecutarla"
- Primer contacto con el estilo PEP8: nombres de variables en minúsculas, espacios alrededor de operadores

---

<div class="page-break" style="page-break-before: always;"></div>

#### Clase 2 — Comparando trayectorias: control de flujo y datos organizados

**Contenidos específicos**

- Tipos simples: números enteros, flotantes, complejos
- Strings: operaciones básicas, formato con f-strings
- Diccionarios: creación, acceso, modificación, iteración
- Control de flujo: `if/elif/else`, bucles `for` y `while`
- Técnicas de iteración: `enumerate`, `zip`, comprensión de listas
- Lectura de CSV con `numpy.loadtxt()` y `numpy.genfromtxt()` dentro de `with`

**Integración transversal**

- Problema motivador: comparar trayectorias de proyectiles con distintos ángulos
- Uso del asistente de IA para depurar errores de sintaxis
- Buenas prácticas: documentar parámetros en el encabezado del script

---

#### Clase 3 — Funciones y reutilización de código

**Contenidos específicos**

- Definición y uso de funciones
- Argumentos posicionales, opcionales y keyword
- Ámbito de variables
- Número variable de argumentos (`*args`, `**kwargs`)
- Funciones anónimas (lambda)
- Módulos: importación y uso del módulo `math` y `cmath`
- Tuplas y rangos
- Ejemplo aplicado: integración numérica con funciones como argumento

**Integración transversal**

- Problema motivador: encapsular el cálculo de trayectorias de la clase anterior en funciones reutilizables
- Buenas prácticas: docstrings en todas las funciones
- Uso del asistente de IA para refactorizar código ya escrito

---

<div class="page-break" style="page-break-before: always;"></div>

#### Clase 4 — Arrays y cálculo vectorizado: introducción a Numpy

**Contenidos específicos**

- Contraste explícito: lista vs array (velocidad, memoria, expresividad)
- Creación de arrays unidimensionales y multidimensionales
- Operaciones básicas sobre arrays
- Funciones de Numpy: `linspace`, `arange`, `zeros`, `ones`
- Acceso a elementos e indexado básico
- Propiedades de arrays: `shape`, `dtype`, `size`
- Lectura y escritura de datos con Numpy

**Integración transversal**

- Problema motivador: vectorizar el cálculo de la clase anterior y comparar tiempos de ejecución
- El estudiante experimenta por qué los arrays son la estructura central del cálculo científico
- Uso del asistente de IA para traducir un cálculo con listas a Numpy

---

<div class="page-break" style="page-break-before: always;"></div>

### Bloque 2 — Herramientas del trabajo científico

_Clases 5 a 8. El estudiante incorpora las herramientas que definen el trabajo profesional: entorno reproducible, buenas prácticas, uso crítico de IA y programación orientada a objetos._

---

#### Clase 5 — Entorno profesional: Git y uv

**Contenidos específicos**

- Control de versiones con Git: qué es, para qué sirve
- Flujo básico: `init`, `add`, `commit`, `push`, `pull`
- Ramas y resolución de conflictos
- Trabajo colaborativo: clonar un repositorio, pull requests
- Gestión de entornos con `uv`: instalación, creación de entornos virtuales, manejo de dependencias
- `pyproject.toml`: estructura y uso
- Reproducibilidad: por qué otro estudiante debe poder ejecutar tu código sin modificaciones

**Integración transversal**
hacer

- A partir de esta clase, todos los proyectos del curso viven en un repositorio Git
- El entorno de cada proyecto se gestiona con `uv`

---

#### Clase 6 — Buenas prácticas y estilo

**Contenidos específicos**

- PEP8: guía de estilo oficial de Python
- Nombres significativos de variables, funciones y módulos
- Docstrings: convenciones y herramientas (`help()`, `__doc__`)
- Estructura de un proyecto Python: archivos, carpetas, módulos
- Manejo de errores y excepciones: `try/except`, creación de excepciones propias
- Escritura de tests simples: introducción a `assert` y `pytest`

**Integración transversal**

- Revisión del código escrito en clases anteriores aplicando las nuevas prácticas
- Uso del asistente de IA para detectar violaciones de estilo y sugerir mejoras
- Discusión: ¿cómo evaluar si el código que genera la IA sigue buenas prácticas?

---

<div class="page-break" style="page-break-before: always;"></div>

#### Clase 7 — Uso crítico de IA para programar

**Contenidos específicos**

- Herramientas disponibles: asistentes en VS Code, modelos de lenguaje en el browser
- Cómo formular buenos prompts para tareas de programación científica
- Casos donde la IA falla: errores numéricos sutiles, contexto disciplinar, dependencias desactualizadas
- Validación del código generado: leer, entender, testear antes de usar
- Flujo de trabajo recomendado: IA como copiloto, no como piloto automático
- Criterios éticos y académicos: qué se puede usar y qué hay que declarar

**Integración transversal**

- Ejercicio práctico: el estudiante pide a la IA que resuelva un problema conocido y audita el resultado
- Discusión grupal sobre casos reales de uso y mal uso

---

#### Clase 8 — Programación orientada a objetos aplicada

**Contenidos específicos**

- Clases y objetos: conceptos básicos
- Métodos y atributos de instancia y de clase
- Herencia
- Métodos especiales: `__init__`, `__str__`, `__repr__`, `__call__`, `__add__`, `__mul__`
- Otras estructuras útiles:
  - Sets: operaciones de conjuntos, eliminación de duplicados
  - Queues: `collections.deque` para procesamiento secuencial
  - Datos con nombre: `namedtuple` y `dataclass`
  - JSON: lectura, escritura y manipulación con el módulo `json`

**Integración transversal**

- Problema motivador: modelar un sistema físico (por ejemplo, un oscilador) como clase
- Conexión con el bloque anterior: la clase como forma de organizar código con buenas prácticas
- Uso del asistente de IA para generar una clase y auditar su diseño

---

<div class="page-break" style="page-break-before: always;"></div>

### Bloque 3 — Cálculo numérico y visualización

_Clases 9 a 12. El estudiante profundiza en las herramientas centrales del cálculo científico con Python._

---

#### Clase 9 — Numpy avanzado

**Contenidos específicos**

- Indexado avanzado: secuencias de índices, condiciones, función `where`
- Broadcasting: operaciones entre arrays de distinta forma
- Reshape y transpose
- Funciones de reducción: `min`, `max`, `sum`, `mean`, `std`, `cumsum`
- Productos entre arrays y productos vectoriales
- Generación de números aleatorios: distribución uniforme, normal, binomial
- Histogramas con Numpy
- Copias de arrays y vistas
- Vectorización de funciones escalares

**Integración transversal**

- Problema motivador: análisis estadístico de datos experimentales simulados
- Uso del asistente de IA para optimizar operaciones con arrays

---

<div class="page-break" style="page-break-before: always;"></div>

#### Clase 10 — Visualización con Matplotlib: énfasis estadístico

**Contenidos específicos**

- Gráficos 2D: líneas, puntos, barras
- Histogramas y distribuciones
- Barras de error y datos experimentales
- Subplots: comparación de datasets
- Escalas logarítmicas
- Estilos y personalización para publicaciones científicas
- Exportación de figuras en distintos formatos
- Hojas de estilo y configuración

**Integración transversal**

- Problema motivador: visualizar y comparar distribuciones de mediciones experimentales
- Buenas prácticas: títulos, etiquetas de ejes y leyendas siempre presentes

---

#### Clase 11 — Scipy: cálculo científico avanzado

**Contenidos específicos**

- Integración numérica: funciones simples y fuertemente oscilatorias, funciones de más de una variable
- Álgebra lineal: productos, normas, resolución de sistemas, descomposición de matrices, autovalores y autovectores
- Funciones especiales: Bessel, función error, polinomios ortogonales, factorial, permutaciones y combinaciones
- Interpolación: introducción (se profundiza en clase 13)

**Integración transversal**

- Problema motivador: resolución de un sistema de ecuaciones proveniente de un modelo físico real
- Uso del asistente de IA para identificar la función de Scipy adecuada para un problema dado

---

<div class="page-break" style="page-break-before: always;"></div>

#### Clase 12 — Entrada/salida completa y biblioteca estándar

**Contenidos específicos**

- Context managers: explicación formal de `with`, `__enter__` y `__exit__`
- Archivos de texto y binarios
- Archivos comprimidos
- JSON avanzado: serialización de objetos, manejo de estructuras anidadas
- Módulos de la biblioteca estándar: `sys`, `os`, `pathlib`, `glob`, `subprocess`, `re`, `argparse`
- Entrada y salida con Scipy

**Integración transversal**

- Conexión con clase 2: el estudiante entiende ahora formalmente lo que usó intuitivamente desde el principio
- Problema motivador: procesar un conjunto de archivos de datos experimentales de forma automatizada

---

<div class="page-break" style="page-break-before: always;"></div>

### Bloque 4 — Herramientas avanzadas y proyecto integrador

_Clases 13 a 16. El estudiante incorpora herramientas de análisis avanzado, aprende a exponer su trabajo como servicio y cierra el curso con un proyecto real._

---

#### Clase 13 — Interpolación y ajuste de curvas

**Contenidos específicos**

- Interpolación con polinomios
- Splines y B-Splines
- Cantidades derivadas de splines
- Interpolación en dos dimensiones
- Interpolación sobre datos no estructurados
- Ajuste con polinomios
- Fiteo con funciones arbitrarias: `curve_fit`
- Ejemplo aplicado: fiteo de picos experimentales

**Integración transversal**

- Problema motivador: ajustar datos reales de un experimento y extraer parámetros físicos
- Uso del asistente de IA para elegir el método de interpolación adecuado

---

#### Clase 14 — Exponer un cálculo: FastAPI + Streamlit

**Contenidos específicos**

- Concepto de API REST: qué es, para qué sirve en el contexto científico
- FastAPI: instalación, estructura básica, decoradores de ruta
- Tipos de datos en FastAPI: parámetros, respuestas JSON
- Documentación automática con Swagger UI
- Streamlit: instalación y primeros pasos
- Construcción de una interfaz simple: sliders, gráficos, resultados
- Integración: Streamlit consume una API FastAPI que encapsula un cálculo físico

**Integración transversal**

- Problema motivador: exponer el modelo físico construido durante el curso como una app interactiva en el browser
- Conexión con bloque 2: el proyecto vive en Git, tiene entorno reproducible con `uv` y sigue buenas prácticas
- El estudiante comprende que su código científico puede ser usado por otros sin saber programar

---

#### Clase 15 — Programación funcional y decoradores

**Contenidos específicos**

- Funciones puras y efectos secundarios
- Funciones de primer orden y de orden superior
- Inmutabilidad
- Iteradores y generadores
- Funciones `map`, `filter`, `reduce`
- Decoradores: qué son, cómo se escriben, notación con `@`
- Usos prácticos de decoradores: logging, validación, timing
- Conexión con context managers vistos en clase 12

**Integración transversal**

- Revisión del código del curso: ¿qué partes se beneficiarían de un enfoque funcional?
- Uso del asistente de IA para refactorizar código imperativo a estilo funcional

---

#### Clase 16 — Proyecto integrador

**Contenidos específicos**

- No hay contenidos nuevos. Esta clase es de aplicación y cierre.
- Presentación de proyectos individuales o en pareja
- Cada proyecto debe incluir:
  - Un problema físico o de ingeniería real
  - Código organizado, documentado y versionado en Git
  - Entorno reproducible gestionado con `uv`
  - Al menos una visualización significativa
  - Una interfaz simple (Streamlit) o una API (FastAPI) que exponga el resultado
  - Reflexión sobre el uso del asistente de IA durante el desarrollo

**Integración transversal**

- El proyecto integrador es la demostración de que el estudiante puede trabajar de forma autónoma aplicando todos los ejes del curso: cálculo, visualización, buenas prácticas, entorno reproducible y uso crítico de IA.

---

<div class="page-break" style="page-break-before: always;"></div>

## 5. Bibliografía

### Accesible en línea

- Documentación oficial de Python: https://docs.python.org/3/
- Documentación de Numpy: http://docs.scipy.org/doc/numpy/user/
- Documentación de Scipy: https://docs.scipy.org/doc/scipy/reference/
- Documentación de Matplotlib: http://matplotlib.org
- Documentación de FastAPI: https://fastapi.tiangolo.com
- Documentación de Streamlit: https://docs.streamlit.io
- Documentación de uv: https://docs.astral.sh/uv/
- Scipy Lectures: http://scipy-lectures.org

### Libros

- _The Python Standard Library by Example_ — Doug Hellman, Addison-Wesley, 2017
- _Python Cookbook_ — David Beazley, Brian K. Jones, O'Reilly, 2013
- _Elegant Scipy_ — Harriet Dashnow, Stéfan van der Walt, Juan Nunez-Iglesias, O'Reilly, 2017
- _Scientific Computing with Python 3_ — Claus Führer, Jan Erik Solem, Olivier Verdier, Packt, 2016

* [Python for Physicists](https://lucydot.github.io/python_novice/)

---
