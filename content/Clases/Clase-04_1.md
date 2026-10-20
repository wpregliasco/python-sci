---
publish: true
---

# Python Científico

## de la ecuación al programa

### Clase 4a

![200](Imgs/Clase-04_1.png)

- `numpy`

---

# Numpy para todes

## Que es?

NumPy (Numerical Python) es una biblioteca fundamental del ecosistema científico de Python. Permite representar y operar con vectores, matrices y arreglos numéricos de manera eficiente. Se utiliza en prácticamente todas las áreas de la física computacional: análisis de datos experimentales, resolución numérica de ecuaciones, simulaciones, procesamiento de señales y cálculo científico.

Supongamos que queremos calcular la posición de una partícula que se mueve con velocidad constante:

$$
x(t)=x0+v
~t
$$

esto la calculariamos utilizando una lista:

```python
x0 = 2.0
v = 3.0
tiempos = [0.0, 0.1, 0.2, 0.3, 0.4]
x = [x0 + v * t for t in tiempos]

print(x)
```

Con NumPy, la misma operación se expresa directamente:

```python
import numpy as np

x0 = 2.0
v = 3.0
t = np.array([0.0, 0.1, 0.2, 0.3, 0.4])

x = x0 + v * t

print(x)
```

La segunda expresión aplica la operación a todos los elementos del arreglo. Esta característica se llama **vectorización**.

NumPy ofrece tres ventajas principales:

- **Eficiencia**: las operaciones numéricas se ejecutan mediante código compilado, generalmente mucho más rápido que los ciclos explícitos de Python para arreglos grandes.
- **Expresividad:** las ecuaciones se escriben de una forma cercana a su notación matemática.
- **Integración**: sus arreglos se utilizan en bibliotecas como SciPy, Matplotlib y pandas.

## El objeto estrella`np.array`

Veamos unos ejemplos:

```python
import numpy as np

vector = np.array([270.0, 275.0, 280.0, 285.0])

matriz = np.array([
    [1.0, 2.0, 3.0],
    [4.0, 5.0, 6.0]
])

print(f"{vector = }")
print(f"{matriz = }")
```

propiedades basicas:

```python
print(f"{matriz.ndim = }") 
print(f"{matriz.shape = }")
print(f"{matriz.size = }")
print(f"{matriz.dtype = }")
```

## Creacion de arreglos

```python
print(f"{np.zeros(4) = }")          # np.zeros_like 
print(f"{np.ones(4) = }")           # np.ones_lile
print(f"{np.full(4, 123.4) = }")    # np.full_like

print()

print(f"{np.arange(0, 9, 2) = }")
print(f"{np.linspace(0, 10, 7)= }")
```

## Aritmetica y funciones

```python
a = np.array([1, 2, 3])
b = np.array([10, 20, 30])

print(f"{ a + b = }")
print(f"{ np.exp(a) = }")
```

## Indexación de matrices

```python
M = np.array([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
])

print(f"{M[1, 2] = }")  
print(f"{M[2, :] = }")  
print(f"{M[:, 1] = }")
```

La notación `M[fila, columna]` permite acceder a un elemento; `:` selecciona todos los elementos de una dimensión.

### Selección mediante condiciones

Supongamos que medimos la temperatura de una muestra y queremos identificar los valores supcaeriores a 290 K.

```python
T = np.array([289.5, 290.2, 291.0, 288.7, 292.1])

mascara_calientes = T > 290
mas_calientes = T[mascara_calientes]

print(f"{                T  = }")
print(f"{ mascara_calientes = }")             
print(f"{    mas_calientes  = }")
# [290.2 291.  292.1]
```

La expresión `T > 290` genera una máscara booleana. Esta máscara permite seleccionar los elementos que satisfacen la condición.

## Copias, vistas y referencias

Este tema suele causar errores sutiles al procesar datos experimentales.

Consideremos:

```python
a = np.array([1, 2, 3, 4, 5])

print(f"{a = }")

b = a[1:4]
b[0] = 99

print(f"{b = }")
print(f"{a = }")
```

El segmento `a[1:4]` normalmente crea una vista del arreglo original. Por eso, modificar `b` modifica también `a`.

Si necesitamos una copia independiente:

```python
a = np.array([1, 2, 3, 4, 5])

print(f"{a = }")

b = a[1:4].copy()
b[0] = 99

print(f"{b = }")
print(f"{a = }")
```

La distinción importa especialmente cuando se trabaja con

## Sub librerias de la libreria `numpy`

### Constantes

| Constante        | Se escribe       | Valor / significado |
| ---------------- | ---------------- | ------------------- |
| Pi               | `np.pi`          | 3.141592653589793   |
| Número e         | `np.e`           | 2.718281828459045   |
| Tau (2π)         | `np.tau`         | 6.283185307179586   |
| Euler-Mascheroni | `np.euler_gamma` | 0.5772156649015329  |
| Infinito         | `np.inf`         | Infinito positivo   |
| NaN              | `np.nan`         | "Not a Number"      |

### `numpy.random`: Generadores de números aleatorios y distribuciones estadísticas

| Función                             | Para qué sirve                  |     |
| ----------------------------------- | ------------------------------- | --- |
| `rng = np.random.default_rng(seed)` | Crear un generador reproducible |     |
| `rng.random(size)`                  | Uniforme `[0, 1)`               |     |
| `rng.uniform(a, b, size)`           | Uniforme `[a, b)`               |     |
| `rng.integers(low, high, size)`     | Enteros `[low, high)`           |     |
| `rng.normal(loc, scale, size)`      | Gaussiana                       |     |
| `rng.binomial(n, p, size)`          | Binomial                        |     |
| `rng.poisson(lam, size)`            | Poisson                         |     |
| `rng.exponential(scale, size)`      | Exponencial                     |     |
| `rng.choice(a, size, replace, p)`   | Elegir elementos                |     |
| `rng.shuffle(arr)`                  | Mezclar **in-place**            |     |
| `rng.permutation(x)`                | Devolver copia mezclada         |     |
|                                     |                                 |     |

```python
import numpy as np

rng = np.random.default_rng(seed=42)   # semilla para reproducibilidad
print("Tipo de rng:", type(rng))       # numpy.random._generator.Generator

u2 = rng.uniform(low=-1, high=1, size=5)
print("Uniforme [-1,1):", u2)
```

### `numpy.linalg`: Rutinas de álgebra lineal

```python
import numpy as np

A = np.array([[4, 2],
              [1, 3]])

B = np.array([[1, 0],
              [0, 1]])

v = np.array([1, 2])

print("A @ v =", A @ v)
print("A @ B =\n", A @ B)

det = np.linalg.det(A)
print("Determinante de A:", det)   # 4*3 - 2*1 = 10

inv_A = np.linalg.inv(A)
print("Inversa de A:\n", inv_A)

b = np.array([10, 11])
x = np.linalg.solve(A, b)
print("Solución de Ax=b:", x)
```

### `numpy.polynomial`: Operaciones y creación de polinomios.

|Operación|Método / atributo|Descripción|
|---|---|---|
|**Crear**|`Polynomial([c0, c1, ...])`|Coeficientes de menor a mayor|
||`Polynomial.fromroots([r1, r2])`|Crear a partir de las raíces|
|**Evaluar**|`p(x)`|Se llama como una función|
|**Aritmética**|`p + q`, `p - q`, `p * q`, `p // q`, `p % q`, `p ** n`|Operadores directos|
|**Derivar**|`p.deriv()`|Devuelve el polinomio derivado|
|**Integrar**|`p.integ()`|Devuelve el polinomio integral|
|**Raíces**|`p.roots()`|Devuelve un array con las raíces|

```python
from numpy.polynomial import Polynomial

# 1. Crear un polinomio: p(x) = 1 + 2x + 3x²
p = Polynomial([1, 2, 3])
print(p)   # 1.0 + 2.0·x + 3.0·x²
# 2. Evaluar: reemplazar x por un valor
print(p(2))   # 1 + 2·2 + 3·2² = 1 + 4 + 12 = 17.0
# 3. Sumar y multiplicar polinomios
q = Polynomial([1, -2])       # q(x) = 1 - 2x
print(p + q)   # 2.0 + 0.0·x + 3.0·x²
print(p * q)   # 1.0 - 2.0·x + 3.0·x² - 6.0·x³

```

### `numpy.fft`: Herramientas para la Transformada Rápida de Fourier.

### `numpy.strings`: Funciones optimizadas para manipulación de cadenas de texto en arreglos.

---

---
