---
publish: true
---

# Python Científico

## de la ecuación al programa

### Clase 1b

```Python
# No integer overflow
numerazo = 2**10000
print(len(str(numerazo)), "\n", numerazo)


# Flotando imprecisiones
0.1 + 0.1 + 0.1 == 0.3   # <-- False

```

---

## Correr Notebooks fuera de clase

- Los notebooks están contenidos en archivos `.ipynb`
- Son archivos que contenen las celdas de entrada y las salidas en modo texto
  _(¡incluso los gráficos !)_
- Pueden hacer _Download_ desde el servidor de la cátedra
   
- En _Google Drive_ pueden crear _New Google Colaboratory_  y ya tienen un notebook que se guarda en el drive y corre en los servidores de la nube.

---

<style scoped> section { font-size: 30px; } </style>

## Variables

- en matemáticas:
  $x + 3 = 5$
  $y = x + 1$

- en programación:
  ```text
  a = 2
  ```
  - no tiene sentido
    ```text
       2 = a
       x + 3 = 5
    ```

---

## Declaración

<style scoped> section { font-size: 28px; } </style>

Lenguajes tipificados (C, Java)

```C
// declaraciones
int a=1, b;
int c;
// operacioes
b = 1;
c = a + b
```

No tipificados: Python

```Python
  a = 1
  a = 'Holaaaa!'
  a = [1,2,3]
```

---

## Asignación

- variable: tag
- objeto
- valor

![](Imgs/Pasted image 20260921142600.png)

---

## Modificación

![](Imgs/Pasted image 20260921143029.png)

![](Imgs/Pasted image 20260921143108.png)

---

<style scoped> section { font-size: 25px; } </style>

## Mutables

`list`, `dict`, `set`

![](Imgs/Pasted image 20260921143240.png)

## Inmutables

`int`, `float`, `tuple`

```Python
>>> a = (10, 11)
>>> a[0] = 20
TypeError: 'tuple' object does not support item assignment
```

---

## Reasignación de variables

![](Imgs/Pasted image 20260921145915.png)

![](Imgs/Pasted image 20260921145953.png)

---

## Los objetos mutables, mutan un mismo objeto

![](Imgs/Pasted image 20260921150131.png)

😱 🤯

---

## Objeto:  🐍

- propiedades `🐍.prop`
- métodos  `🐍.meth()`
- `type(🐍)`
- `help(🐍)`
- string(🐍),  repr(🐍)

---

## Objetos Numéricos

| `int`                    | `bool`            | `float`                | `complex`                        |
| ------------------------ | ----------------- | ---------------------- | -------------------------------- |
| asignación automática    | `True`/`False`    | doble precisión (64b)  | `3+5j`                           |
| no limit! : `-2**10000`  | (int) 1/0         | hasta 10^308           | dos `float`                      |
| underscores: `1_000_000` |                   | 16 decimales           | `.real`, `.imag`, `.conjugate()` |
| `/`, `//`, `%`, `divmod` | `and`, `or`,`not` | notación sci: `3.2e-4` | `+`, `-`, `*`, `/`,`**`          |

---

<style scoped> section { font-size: 28px; } </style>

## Objetos secuenciales

| `list`        | `tuple`       | `range`      |
| ------------- | ------------- | ------------ |
| `[1,2,3,4,5]` | `(1,2,3,4,5)` | `range(1,6)` |

- relleno libre e inconsistente
- comprehension: `a = [item for item in range(1,4)]`
- indexing  `a[2]`, `a[-1]`
- slicing `a[2:]`, `a[:2]`, `a[2:3]`, `a[:-1:2]`, `a[:-1:-1]`
- método `append()`, concatenación `+`
- función `len()`
- pertenencia `5 in [2,6,5,7,9] <- True`

---

## Iteradores

```Python
for coso in [1,"banana", (3,2), 8+1j]:
	print(coso)

Out:	
	1
	banana
	(3, 2)
	(8+1j)
```

---

## Built-in functions

![bg right:50% 85%](Imgs/Pasted image 20260921163815.png)

[Referencia](https://docs.python.org/3/builtins/functions.html)

---

## Biblioteca Estándar de Python 3.12 (Módulos Principales)

<style scoped> 
	section { column-count: 2; column-gap: 2rem; font-size: 12px; } 
	h2 { column-span: all;  font-size:25px; text-align: center; padding-bottom: 1em;} 
</style>

### ⚙️ Servicios del Sistema y del Sistema Operativo

- **`os`**: Interfaces misceláneas del sistema operativo (archivos, rutas, procesos).
- **`sys`**: Parámetros y funciones específicas del sistema (argumentos de línea de comandos, rutas de ejecución).
- **`pathlib`**: Rutas de sistema de archivos orientadas a objetos.
- **`shutil`**: Operaciones de archivos de alto nivel (copiar, mover, borrar carpetas).
- **`subprocess`**: Gestión de subprocesos externos.
- **`argparse`**: Generador de interfaces de línea de comandos (CLI) estructuradas.

### 📊 Tipos de Datos y Matemáticas

- **`math`** y **`cmath`**: Funciones matemáticas para números reales y complejos.
- **`datetime`** y **`time`**: Manipulación de fechas, horas y temporizadores.
- **`random`**: Generación de números pseudoaleatorios.
- **`statistics`**: Funciones de estadística matemática (media, mediana, varianza).
- **`collections`**: Tipos de datos especializados (como `Counter`, `deque`, `namedtuple`).
- **`enum`**: Soporte para enumeraciones.

### 📁 Procesamiento de Datos y Archivos

- **`json`**: Codificador y decodificador de archivos y strings JSON.
- **`csv`**: Lectura y escritura de archivos separados por comas.
- **`tomllib`**: Analizador sintáctico para archivos TOML.
- **`configparser`**: Manejador de archivos de configuración (.ini).
- **`pickle`**: Serialización y persistencia de objetos de Python.
- **`sqlite3`**: Interfaz integrada para bases de datos relacionales SQLite.

### 🗜️ Compresión

- **`zipfile`** y **`tarfile`**: Manipulación de archivos comprimidos ZIP y TAR.
- **`zlib`**, **`gzip`**, **`bz2`**, **`lzma`**: Algoritmos y herramientas de compresión de datos.

### 🌐 Redes y Protocolos de Internet

- **`socket`**: Interfaz de red de bajo nivel.
- **`ssl`**: Envoltura TLS/SSL para sockets seguros.
- **`urllib`**: Paquete para manejar URLs y realizar peticiones HTTP.
- **`http`**: Servidores y clientes HTTP nativos (incluye `http.server`).
- **`email`**: Paquete para procesar y generar mensajes de correo electrónico.

### ⚡ Concurrencia y Programación Asíncrona

- **`asyncio`**: Entrada/Salida asíncrona mediante corrutinas.
- **`threading`**: Gestión de hilos de ejecución concurrentes.
- **`multiprocessing`**: Paralelismo basado en procesos reales (evita el GIL).
- **`concurrent.futures`**: Lanzamiento de tareas concurrentes asíncronas de alto nivel.

### 🛡️ Criptografía y Seguridad

- **`hashlib`**: Algoritmos de hash seguros (MD5, SHA1, SHA256, etc.).
- **`hmac`**: Autenticación de mensajes mediante hash por clave.
- **`secrets`**: Generación de números y tokens aleatorios criptográficamente seguros.

### 🧪 Pruebas, Debugging y Herramientas de Desarrollo

- **`unittest`**: Framework nativo para pruebas unitarias.
- **`pdb`**: El depurador interactivo de Python.
- **`timeit`**: Medición del tiempo de ejecución de pequeños fragmentos de código.
- **`venv`**: Creación y gestión de entornos virtuales aislados.
- **`logging`**: Sistema de registro de eventos y logs.
