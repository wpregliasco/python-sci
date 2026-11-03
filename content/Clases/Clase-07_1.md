---
publish: true
---

# Python Científico

## de la ecuación al programa

### Clase 71 - Un monton de nada

![](Imgs/Pasted image 20261031170445.png)

---

# Bilbliotecas amigas....

## `pathlib` todos los caminos conducen a Roma

`pathlib` permite representar y manipular rutas del sistema de archivos mediante objetos Python. Hace que el manejo de los directorios sea **identico** en Windows y en Linux!

```python
from pathlib import Path

ruta = Path.cwd()
print(ruta)

base = Path.home()
proyecto = base / "Python" / "Experimentos"
archivo = proyecto / "mediciones.csv"
print(archivo)
```

Tiene funciones utilitarias como:

```python
from pathlib import Path  

ruta = Path("datos/mediciones.csv")

print(f"{ruta.resolve() = }")  # Absolute path
print(f"{ruta.exists() = }")   # Does it exist?
print(f"{ruta.is_file() = }")  # Is it a file?
print(f"{ruta.is_dir() = }")   # Is it a directory?
print(f"{ruta.name = }")       # File name
print(f"{ruta.stem = }")       # Name without extension
print(f"{ruta.suffix = }")     # Extension

directorio = Path("resultados") # Crea todos los directorios
directorio.mkdir(parents=True, exist_ok=True)

print(f"{directorio.resolve() = }") # Absolute path
```

e  incorpora el `glob`

```python
from pathlib import Path

data = Path.home()

for archivo in data.glob(".ba*"):
    print(archivo)
```

## `argparse` pasando argumentos

```python
#!/usr/bin/env python3
import argparse
import math


def main():

    parser = argparse.ArgumentParser(
        description="Calcula el radio de una esfera a partir de su volumen.",
        epilog="El volumen se expresa en cm³ y el radio en cm.",
    )

    parser.add_argument(
        "-v", "--volumen", type=float, required=True, 
        help="Volumen de la esfera en cm³"
    )

    args = parser.parse_args()

    if args.volumen <= 0:
        parser.error("El volumen debe ser positivo.")

    radio = (3 * args.volumen / (4 * math.pi)) ** (1 / 3)

    print(f"Volumen: {args.volumen} cm³")
    print(f"Radio: {radio:.4f} cm")


if __name__ == "__main__":
    main()

```

## `datetime` el timpo es dinero...

Trabajar con fechas, horas, intervalos temporales y marcas de tiempo o `timestamps` siempre ha sido algo engorroso . Sin embargo es especialmente útil para organizar mediciones experimentales, registrar adquisiciones y analizar series temporales.

`datetime` forma parte de la biblioteca estándar de Python. No requiere instalación.

```python
from datetime import datetime

ahora = datetime.now()
print(ahora)

experimento = datetime(2026, 10, 31, 14, 30, 0)
print(experimento)

print(ahora-experimento)

```

```python
from datetime import datetime, timedelta

inicio = datetime.now()

# Simulate an experiment duration
duracion = timedelta(hours=2, minutes=30)

final = inicio + duracion

print(f"Start: {inicio}")
print(f"End:   {final}")

```

### Timestamp y Unix Time

En computación científica es muy habitual representar fechas y horas mediante un número en lugar de utilizar una cadena de texto.

Esta representación se conoce como Unix Timestamp o Unix Time.y se define como la cantidad de segundos transcurridos desde el **1 de enero de 1970 a las 00:00:00 UTC**, conocido como Unix Epoch.

```python
from datetime import datetime

ahora = datetime.now()
timestamp = ahora.timestamp()

print(ahora)
print(timestamp)

timestamp = 1793458200
fecha = datetime.fromtimestamp(timestamp)

print(timestamp)
print(fecha)
```

## `subprocess` divide y triunfaras

`subprocess` es una biblioteca de Python que permite ejecutar programas y comandos del sistema operativo desde un script. La idea central es que Python **no tiene** que hacer todo por sí mismo: puede coordinar otros programas.

Sumpongamos que tenemos  el programa

```python
import argparse

parser = argparse.ArgumentParser(
    description="Calcula el cuadrado de un número"
)

parser.add_argument(
    "n",
    type=float,
    help="Número de entrada"
)

args = parser.parse_args()

resultado = args.n**2

print(resultado)
```

Puedo ejecutar un programa en python que llame a ese programa  y su salida sea capturada....

```python
#!/usr/bin/env python3
import subprocess
import sys

# Encabezado de la tabla
print("n\tCuadrado")
print("-"*20)

# Campaña de corridas
for n in range(11):

    # Ejecutar el programa de cálculo
    proceso = subprocess.run(
        [sys.executable, "./cuadrado.py", str(n)],
        capture_output=True,
        text=True,
        check=False,
    )

    # Recuperar el resultado
    resultado = float(proceso.stdout)

    # Mostrar resultados
    print(f"{n}\t{resultado}")
```

Esto ejecuta los procesos secuencialmente, es decir que espera que termine uno para inicial otro.

Si queremos que esto no ocurra se usoa `subprocess.Popen`

```python
#!/usr/bin/env python3

import subprocess
import sys

# Encabezado de la tabla
print("n\tCuadrado")
print("-" * 20)

# Campaña de corridas
for n in range(11):

    # Ejecutar el programa de cálculo
    proceso = subprocess.Popen(
        [sys.executable, "./cuadrado.py", str(n)],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
    )

    # Recuperar la salida del proceso
    stdout, stderr = proceso.communicate()

    # Recuperar el resultado
    resultado = float(stdout)

    # Mostrar resultados
    print(f"{n}\t{resultado}")
```

## `loguru` Everything Counts

Permite:

- Registrar información sobre el funcionamiento del programa.
- Identificar advertencias y errores.
- Guardar automáticamente los registros en archivos.
- Incorporar fecha y hora a cada mensaje.
- Rotar archivos de registro cuando alcanzan cierto tamaño.
- Registrar excepciones con información sobre dónde ocurrió el error.
- Facilitar el diagnóstico de programas que se ejecutan durante mucho tiempo.

```python
#!/usr/bin/env python3
from loguru import logger
import numpy as np
import sys


def main() -> int:
    logger.remove()  # evitar el handler stderr por defecto si no lo querés
    logger.add(
        "experimento.log",
        level="DEBUG",
        rotation="10 MB",
        retention="7 days",
        compression="zip",
        encoding="utf-8",
        enqueue=True,
    )
    logger.add(sys.stdout, level="INFO", colorize=True)

    mediciones = np.array([10.2, 10.4, 10.1, 10.3, 10.5])
    logger.debug("Datos: {}", mediciones)
    logger.info("Cantidad de mediciones: {}", mediciones.size)
    logger.success("Promedio calculado: {:.3f}", mediciones.mean())
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

```

---
