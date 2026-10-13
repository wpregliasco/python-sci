---
publish: true
---

# Python Científico

## de la ecuación al programa

### Clase 3a

![200](Imgs/Clase-03_1.png)

- `def`, `lambda`, `map`, `sorted`, y `filter`
- definición de funciones

---

# Funciones, funciones, y mas funciones

## Que son?

Una función es un bloque de código al que le ponemos un nombre y que podemos ejecutar cuando lo necesitemos.

```python
def saludar():

print("Hola Mariano")

saludar()
```

## Entradas

Los datos que recibe una función se llaman parámetros,

```python
def saludar(nombre):
    """
    Imprimo un saludo personalizado
    """
    print(f"Hola {nombre}")

saludar("Mariano")
saludar("Willy")
```

pueden ser varios

```python
def resta(a, b):
    """
    Imprimo la resta de dos números
    """
    print(f"{a}-{b} = {a - b}")

resta(10, 5)
```

O para ser mas presisos

- `a` y `b` son los parámetros: los nombres definidos en la función.
- 10 y 5 son los argumentos: los valores que pasamos al llamar a la función.

## Salida

Una diferencia muy importante es entre mostrar un resultado y devolverlo.

```python
def resta(a, b):
	c = a - b
	return c

print(resta(10, 5))
```

O para ser mas presisos

- `c` resultado recibe el valor que devuelve la función: 5

## Parametros por orden posicional

El argumento se asigna según el orden en que aparece.

```python
print(resta(10, 5))
print(resta(4, 2))
```

## Parametros por palabra clave

Podemos indicar explícitamente a qué parámetro corresponde cada argumento.

```python
print(resta(a=10, b=5))
print(resta(b=5, a=10))
```

## Que pasa si se mezclan los argumentos posicionales y los argumentos con nombre?

Una función puede mezclar argumentos posicionales y argumentos con nombre, pero los argumentos posicionales deben ir primero, seguidos de los argumentos con nombre.

```python
print(resta(10, b=5))  # Correcto
# print(resta(a=10, 3))  # SyntaxError
```

## Los parámetros pueden tener valores por defecto

```python
def saludar(nombre="Mariano"):
    """
    Imprimo un saludo personalizado
    """
    print(f"Hola {nombre}")


saludar()
saludar("Willy") 
```

## Que pasa si quiero pasar varios argumentos posicionales?

Existe la opcion de usar `*valores`  de forma tal de pasar un `tupla` de argumentos:}

```python
def promedio(*valores):
    print()
    print("  Valores recibidos:   ", valores)
    print("  Tipo de datos:       ", type(valores))
    print("  Cantidad de valores: ", len(valores))
    print()

    promedio = sum(valores) / len(valores)

    return promedio


print(promedio(2, 4, 6))  # 4.0
print(promedio(10, 20, 30, 40))  # 25.0
```

## Que pasa si quiero pasar varios argumentos por nombre?

Existe la opcion de usar `**datos`  de forma tal de pasar un `dict` de argumentos:

```python
def mostrar_datos(**datos):
    print()
    print("  Valores recibidos:   ", datos)
    print("  Tipo de datos:       ", type(datos))
    print("  Cantidad de valores: ", len(datos))
    print()

    for clave, valor in datos.items():
        print(clave, "=", valor)


mostrar_datos(nombre="Mariano", edad=55, carrera="Física")

mostrar_datos(profesor="Willy", especialidad="Física Forense")
```

## Funciones `lambda`

Basicamente son funciones de una sola linea. Por ejemplo:

```python
def maximo(a, b):
	if a > b:
		return a
	else:
		return b

print(maximo(5, 10))
```

mientras que en su version `lambda`

```python
maximo = lambda a, b: a if a > b else b

print(maximo(5, 10))
```

Usualmente se usan funciones `lambda` para definir funciones pequeñas y anónimas, especialmente cuando se pasan como argumentos a otras funciones. Por ejemplo, se pueden usar con funciones como `map()`, `filter()` o `sorted()`.

Veamos unos ejemplos....

### Aplicar una funcion a una lista: `map`

```python
numeros = [0, 1, 2, 3, 4, 5, 6, 7, 8]

resultado = map(lambda x: x**2, numeros)

print(resultado)
```

### Filtrar una lista segun un criterio: `filter`

```python
numeros = [0, 1, 2, 3, 4, 5, 6, 7, 8]
  
pares = filter(lambda x: x % 2 == 0, numeros)

print(pares)
```

### Ordenar un lista de listas por algun campo en particular: `sorted`

```python
personas = (("Ana", 32), ("Pedro", 25), ("Laura", 41), ("Juan", 19))

ordenadas = sorted(personas, key=lambda persona: persona[1])

print(ordenadas)
```

## Las funciones son objetos!!

Por ultimo unafuncion tambien es un objeto, por lo que podemos asignarla a una variable y luego llamarla a través de esa variable.

```python
def identidad(x):
    return x

def cuadratica(x):
    return x**2

def cubica(x):
    return x**3

for f in (identidad, cuadratica, cubica):
    print(f(x=2))
```

---

---

Las funciones permiten organizar el código en unidades con responsabilidades concretas, haciendo que los programas sean más claros, reutilizables, verificables y fáciles de mantener.

| Ventaja                              | Descripción                                                                 |
| ------------------------------------ | --------------------------------------------------------------------------- |
| **Evitar repetición**                | Escribir una operación una sola vez y reutilizarla.                         |
| **Reutilizar código**                | Usar una función en diferentes partes o proyectos.                          |
| **Dividir problemas complejos**      | Descomponer un problema grande en tareas pequeñas.                          |
| **Mejorar la legibilidad**           | Hacer que el código sea más fácil de leer y comprender.                     |
| **Facilitar el mantenimiento**       | Modificar una operación en un único lugar.                                  |
| **Reducir errores**                  | Evitar implementaciones inconsistentes de una misma operación.              |
| **Facilitar la depuración**          | Localizar y corregir errores con mayor facilidad.                           |
| **Facilitar las pruebas**            | Verificar cada función de manera independiente.                             |
| **Separar responsabilidades**        | Asignar una tarea concreta a cada función.                                  |
| **Abstraer detalles**                | Utilizar una operación sin conocer su implementación interna.               |
| **Facilitar la colaboración**        | Permitir que distintas personas trabajen en diferentes partes del programa. |
| **Promover la modularidad**          | Construir programas a partir de componentes independientes.                 |
| **Reutilizar en otros proyectos**    | Agrupar funciones en módulos e importarlas cuando se necesiten.             |
| **Expresar la intención**            | Usar nombres descriptivos, como `calcular_media()`.                         |
| **Facilitar la escalabilidad**       | Incorporar funcionalidades sin reescribir todo el programa.                 |
| **Organizar niveles de abstracción** | Construir funciones que utilicen otras funciones.                           |
| **Trabajar con datos variables**     | Ejecutar la misma operación con diferentes parámetros.                      |
| **Facilitar el diseño**              | Identificar y organizar las tareas antes de implementarlas.                 |
| **Facilitar la documentación**       | Documentar el propósito, los parámetros y los resultados de cada función.   |
| **Separar interfaz y lógica**        | Distinguir los cálculos de la entrada de datos y la visualización.          |

---

---
