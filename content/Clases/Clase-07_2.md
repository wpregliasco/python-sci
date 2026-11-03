---
publish: true
---

# Python Científico

## de la ecuación al programa

### Clase 7b - Decoradores y  programación funcional

## ![](Imgs/Pasted image 20261101154909.png)

# Que es un decorador

Un **decorador** es, en palabras simples, **una función que “envuelve” a otra función para agregarle un comportamiento extra**, sin modificar el código de la función original.

Se usa con la sintaxis `@nombre_decorador` encima de una función:

```python
@medir_tiempo
def mi_funcion():
    ...
```

Eso es equivalente a:

```python
mi_funcion = medir_tiempo(mi_funcion)
```

En resumen: **un decorador es una capa reutilizable que se pone alrededor de una función para agregarle una funcionalidad, sin tocar el algoritmo que está dentro.**

## `@cache` : guardo los resultados parciales en memoria

```python
from functools import cache

@cache
def fibonacci(n):
    if n < 2:
        return n

    return fibonacci(n - 1) + fibonacci(n - 2)


print(fibonacci(40))

print(fibonacci(4))
```

## `@timeit`: calcula el tiempo de ejecución

```python
import time
from functools import wraps
def timeit(func):
    @wraps(func) # Preserva el nombre y docstring de la función original
    def wrapper(*args, **kwargs):
        start_time = time.perf_counter() # Usa perf_counter para mayor precisión
        result = func(*args, **kwargs)
        end_time = time.perf_counter()
        elapsed_time = end_time - start_time
        print(f"La función '{func.__name__}' tardó {elapsed_time:.4f} segundos")
        return result
    return wrapper
    
    
@timeit
def calcular_suma(n):
    """Simula un cálculo pesado."""
    return sum(range(n))

# Al llamar a la función, el decorador se ejecuta automáticamente
calcular_suma(1000000)
```

# ¿Qué es la programación funcional?

La programación funcional es un paradigma de programación que propone construir programas a partir de la composición de funciones.

En lugar de describir paso a paso cómo modificar los datos, buscamos expresar qué operación queremos realizar sobre ellos.

Sus ideas principales son:

- Utilizar funciones como objetos de primera clase.
- Preferir funciones que no modifiquen los datos originales.
- Evitar efectos secundarios innecesarios.
- Componer funciones simples para construir operaciones más complejas.
- Aplicar operaciones como `map` y `filter`

```python
def aplicar(funcion, x):
    return funcion(x)


def cuadrado(x):
    return x**2


def cubo(x):
    return x**3


print(aplicar(cuadrado, 3))
print(aplicar(cubo, 3))
```

o como:

```python
numeros = [1, 2, 3, 4, 5]

cuadrados = list(map(cuadrado, numeros))
cubos = list(map(cubo, numeros))

print("Números: ", numeros)
print("Cuadrados:", cuadrados)
print("Cubos:    ", cubos)
```
