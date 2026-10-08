---
publish: true
---

# Python Científico

## de la ecuación al programa

### Clase 2

![bg left:40% 100%](Imgs/Clase-02_1.png)

- Instalar y usar Python local
- variables `string`

---

## Python nativo

La máquina suele venir con un Python instalado.\
Si hace falta instalarlo:

```Bash
# Linux
sudo apt install python3
# Windows
winget install Python.Python.3.14
```

- Correr un script:  `python3 miprograma.py`
- Interfaz interactiva `python`

---

# ¡ Problemas !

- bibliotecas instaladas
- interacción entre bibliotecas
- conflictos con actualizaciones de python

---

## Entornos virtuales (un cacho de cultura)

|                | Linux                              | Windows                  |
| -------------- | ---------------------------------- | ------------------------ |
| Crear          | `python -m venv .venv`             |                          |
| Activar        | `.venv/bin/activate`               | `.venv\Scripts\activate` |
| Desactivar     | `deactivate`                       |                          |
| Nuevos Módulos | `python pip install <antigravity>` |                          |
| Correr         | `(my venv)python3 -m <myprog.py>`  |                          |

---

# ¡ Problemas !

- Compartir entornos
- Solución

```Python
python -m pip freeze > requirements.txt
cat requirements.txt
   novas==3.1.1.3
   numpy==1.9.2
   requests==2.7.0
   
python -m pip install -r requirements.txt
```

**Anaconda**

---

## UV  style

<style scoped> section { font-size: 30px; } </style>

|          | Linux                                              | Windows                                                                             |
| -------- | -------------------------------------------------- | ----------------------------------------------------------------------------------- |
| Instalar | `curl -LsSf https://astral.sh/uv/install.sh \| sh` | powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex" |
| Crear    | `uv init --bare [--python 3.12]`                   |                                                                                     |
| Módulos  | `uv add <antigravity>`                             |                                                                                     |
| Correr   | `uv run <mydir>`                                   |                                                                                     |

---

## Directorios

```
.
├── pyproject.toml
├── miprogramita.py
├── .venv
└── uv.lock
```

---

# Tipos de variables (repaso)

- ya vimos:
  - numeric: (`int`, `float`, `bool`, `complex`)
  - `list` y `tupla`
    - indexar
    - slicing
  - mutables e inmutables

- objetos: `type(·)`, `help(·)`, `str(·) --> print(·)`

- `isinstance(variable, tipo) --> bool`

---

# Strings

![bg right](Imgs/Clase-02_1-1.png)

- Es una lista inmutable que tiene caracteres.
- funciones de indexing y slicing

---

<style scoped> section { font-size: 27px; } </style>

## str: Información y búsqueda

|Función / método|Qué hace|Ejemplo|
|---|---|---|
|`len(s)`|Cantidad de caracteres|`len("hola")` → `4`|
|`s.count(sub)`|Cuenta apariciones|`"banana".count("a")` → `3`|
|`s.find(sub)`|Primera posición, o `-1` si no está|`"banana".find("n")` → `2`|
|`s.startswith(x)`|¿Empieza con...?|`"datos.csv".startswith("da")` → `True`|
|`s.endswith(x)`|¿Termina con...?|`"datos.csv".endswith(".csv")` → `True`|
|`sub in s`|¿Está contenido?|`"ana" in "banana"` → `True`|

---

## str: Mayúsculas y minúsculas

|Método|Ejemplo|
|---|---|
|`s.upper()`|`"hola".upper()` → `"HOLA"`|
|`s.lower()`|`"HOLA".lower()` → `"hola"`|
|`s.capitalize()`|`"hola mundo".capitalize()` → `"Hola mundo"`|
|`s.title()`|`"hola mundo".title()` → `"Hola Mundo"`|
|`s.swapcase()`|`"Hola".swapcase()` → `"hOLA"`|

---

## str: Limpieza de espacios y bordes

|Método|Ejemplo|
|---|---|
|`s.strip()`|`" hola ".strip()` → `"hola"`|
|`s.strip("x")`|Quita los caracteres indicados de los bordes|
|`s.removeprefix(p)`|`"img_01".removeprefix("img_")` → `"01"`|
|`s.removesuffix(x)`|`"datos.csv".removesuffix(".csv")` → `"datos"`|

---

## str: Separar, unir, reemplazar

| Método            | Ejemplo                                |
| ----------------- | -------------------------------------- |
| `s.split(sep)`    | `"a,b,c".split(",")` → `["a","b","c"]` |
| `s.split()`       | Separa por cualquier espacio en blanco |
| `s.splitlines()`  | Separa por saltos de línea             |
| `sep.join(lista)` | `"-".join(["a","b","c"])` → `"a-b-c"`  |
| concat `+`        | `'c' + 'abra'` → `'cabra'`             |
| `s.replace(a,b)   | `'cuadernito'.replace('ito', 'azo')\`                                       |

---

# f-strings

- Uso sin formato
  ```Python
  cafes = 7 
  precio = 2350.5
  a = f"Hoy tomé {cafes} cafés y gasté {precio} pesos"

  print(a)
  # Hoy tomé 7 cafés y gasté 2350.5 pesos
  ```

---

# f-strings

<style scoped> section { font-size: 30px; } </style>

- Con formato
  ```Python
  b = f"Total invertido en cafeína: ${cafes * precio:,.2f}" 

  print(b)
  #  Total invertido en cafeína: $16,453.50
  ```

- Modo debug
  ```Python
  c = f"Valores: {cafes=}"

  print(c)
  # Valores: cafes=7
  ```

---
