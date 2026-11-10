---
publish: true
---

(<a href="static/notebooks/clase_09.ipynb" download data-router-ignore>Descargar notebook</a>)

# Clase 09 — Objetos

Simulación de un gas de partículas duras en 2D con condiciones de borde periódicas.

```python jupyter={"is_executing": false}
import math as m


class Vector():
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __str__(self):
        return f"({self.x},{self.y})"

    def __repr__(self):
        return f"Vector({self.x},{self.y})"

    def mod2(self):
        return self.x**2 + self.y**2

    def mod(self):
        return m.sqrt(self.mod2())

    def __neg__(self):
        return Vector(-self.x, -self.y)

    def __add__(self, other):
        return(Vector(self.x + other.x, self.y + other.y))

    def __sub__(self, other):
        return self + (-other)

    # escalar * Vector
    def __mul__(self, k):
        return Vector(k*self.x, k*self.y)

    __rmul__ = __mul__

    def __truediv__(self, k):
            return Vector(self.x/k, self.y/k)

    def dot(self, other):
        return self.x*other.x + self.y*other.y

    def cross(self, other):
        return self.x * other.y - self.y * other.x

    def cross_z(self, z):
        return Vector(self.y*z, -self.x*z)


def sign(x):
    return int(x > 0) - int(x < 0)

A = Vector(1,0)
B = Vector (1,1)

-A/3
```

```python jupyter={"is_executing": false}
class Particle():

    L = 100
    alpha = 1

    def __init__(self, m, rho, r, v, color="tab:blue"):
        self.m = m
        self.rho = rho
        self.color = color
        self.r = r  #Vector
        self.v = v  #Vector
        self.trajectory = [(r.x, r.y)]
        self.velocities = [v]

    def evolve(self, dt):
        self.r = self.r + self.v * dt
        if not (0 <= self.r.x < self.L and 0 <= self.r.y < self.L):
            self.trajectory.append((float("nan"), float("nan")))   # corta la línea al graficar
            self.r = Vector(self.r.x % self.L, self.r.y % self.L)
        self.trajectory.append((self.r.x, self.r.y))
        self.velocities.append(self.v)

    def __matmul__(self, other):
        r1, r2 = self.r, other.r
        rho1, rho2 = self.rho, other.rho
        if (r1-r2).mod() > rho1+rho2 or (r1-r2).dot(self.v-other.v) >= 0:
            return False

        m1, m2 = self.m, other.m
        v1, v2 = self.v, other.v
        M = m1 + m2
        R = (m1*r1 + m2*r2)/M
        V = (m1*v1 + m2*v2)/M

        # Cambio al CM
        r1, r2 = r1-R, r2-R
        v1, v2 = v1-V, v2-V

        cross_u1 = r1.cross(v1)
        dot_u1 = -sign(r1.dot(v1)) * m.sqrt(self.alpha * r1.mod2() * v1.mod2() - r1.cross(v1)**2)
        u1 = (dot_u1*r1 - r1.cross_z(cross_u1))/r1.mod()**2
        u2 = - m1/m2 * u1

        ## Salgo del CM
        u1, u2 = u1+V, u2+V

        ## fine
        self.v = u1
        other.v = u2
        return True
```

## Animación

Esta es una animación muy elemental usando matplotlib.

Para hacer algo más complejo, se puede usar la librería `manim` o `ffmpeg`.

```python jupyter={"is_executing": false}
import matplotlib.pyplot as plt
from matplotlib.patches import Circle
from matplotlib.animation import FuncAnimation
```

```python jupyter={"is_executing": false}
def animar(particulas, dt=0.05, pasos=1000):
    fig, ax = plt.subplots()
    ax.set_xlim(0, Particle.L)
    ax.set_ylim(0, Particle.L)
    ax.set_aspect("equal")

    circulos = [Circle((p.r.x, p.r.y), p.rho, color=p.color) for p in particulas]
    for c in circulos:
        ax.add_patch(c)

    def update(frame):
        for p in particulas:
            p.evolve(dt)
        for i in range(len(particulas)):              # todos los pares, una sola vez
            for j in range(i + 1, len(particulas)):
                particulas[i] @ particulas[j]         # tu choque
        for c, p in zip(circulos, particulas):
            c.center = (p.r.x, p.r.y)
        return circulos

    anim = FuncAnimation(fig, update, frames=pasos, interval=20, blit=True)
    plt.show()
    return anim          # hay que guardar la referencia, si no se recolecta y no anima
```

```python
import numpy as np
from numpy import random
from IPython.display import HTML
from matplotlib.collections import LineCollection

plt.rcParams['animation.embed_limit'] = 100   # MB, por defecto 20

def simular(particulas, dt, pasos):
    """Evoluciona el sistema; posiciones en p.trajectory y velocidades en p.velocities."""
    largos = [[] for _ in particulas]          # largo de p.trajectory al final de cada paso
    for _ in range(pasos):
        for p in particulas:
            p.evolve(dt)
        for i in range(len(particulas)):
            for j in range(i + 1, len(particulas)):
                particulas[i] @ particulas[j]
        for p in particulas:                   # velocidad post-choque del paso
            p.velocities[-1] = p.v
        for k, p in enumerate(particulas):
            largos[k].append(len(p.trajectory))
    return np.array(largos)                    # (N, pasos)

def animar_hist(particulas, dt=0.05, pasos=1000, pasos_por_cuadro=5, bins=15, flecha=5):
    largos = simular(particulas, dt, pasos)
    n_cuadros = pasos // pasos_por_cuadro + 1

    tray = [np.array(p.trajectory) for p in particulas]      # (M_i, 2), con nan en bordes
    vels = [[(v.x, v.y) for v in p.velocities] for p in particulas]

    def estado(i, s):
        """(x, y, vx, vy) de la partícula i al final del paso s."""
        k = largos[i, s - 1] - 1 if s > 0 else 0
        x, y = tray[i][k]
        j = s if s < len(vels[i]) else len(vels[i]) - 1
        vx, vy = vels[i][j]
        return x, y, vx, vy

    fig, (ax_p, ax_h) = plt.subplots(1, 2, figsize=(11, 5))

    # --- partículas ---
    ax_p.set_xlim(0, Particle.L); ax_p.set_ylim(0, Particle.L); ax_p.set_aspect("equal")
    circulos = [Circle((0, 0), p.rho, color=p.color) for p in particulas]
    for c in circulos:
        ax_p.add_patch(c)

    # --- trayectorias (con nan para cortar al cruzar los bordes) ---
    lineas = []
    for p in particulas:
        ln, = ax_p.plot([], [], lw=0.4, color=p.color, alpha=0.4)
        lineas.append(ln)

    # --- flechas de velocidad ---
    lc = LineCollection([], colors=[p.color for p in particulas], linewidths=1, alpha=0.8)
    ax_p.add_collection(lc)

    # --- Maxwell-Boltzmann 2D: f(v) = (v/σ²) exp(-v²/2σ²), con σ² = <v²>/2 ---
    # (se excluye la última partícula, la pesada de referencia)
    v2_medio = np.mean([vels[i][0][0]**2 + vels[i][0][1]**2 for i in range(len(particulas) - 1)])
    sigma2 = v2_medio / 2
    v_max = 3 * np.sqrt(v2_medio)
    vv = np.linspace(0, v_max, 200)
    mb = vv / sigma2 * np.exp(-vv**2 / (2 * sigma2))

    def dibujar(f):
        s = f * pasos_por_cuadro
        if s > pasos:
            s = pasos
        t = s * dt

        # posiciones, trayectorias y flechas
        segmentos = []
        for i, (c, ln) in enumerate(zip(circulos, lineas)):
            x, y, vx, vy = estado(i, s)
            c.center = (x, y)
            k = largos[i, s - 1] if s > 0 else 1
            ln.set_data(tray[i][:k, 0], tray[i][:k, 1])
            segmentos.append([(x, y), (x + flecha*vx, y + flecha*vy)])
        lc.set_segments(segmentos)

        # histograma del módulo de velocidad (sin la partícula pesada)
        mods = [np.hypot(*estado(i, s)[2:]) for i in range(len(particulas) - 1)]
        ax_h.clear()
        ax_h.hist(mods, bins=bins, range=(0, v_max), density=True, alpha=0.7)
        ax_h.plot(vv, mb, "r-", label="Maxwell-Boltzmann 2D")
        ax_h.set_xlim(0, v_max); ax_h.set_ylim(0, 1.5 * mb.max())
        ax_h.set_xlabel("|v|"); ax_h.set_ylabel("densidad")
        ax_h.set_title(f"t = {t:.1f}")
        ax_h.legend(loc="upper right")
        return circulos + lineas + [lc]

    anim = FuncAnimation(fig, dibujar, frames=n_cuadros, interval=50, blit=False)
    plt.close(fig)        # evita que se muestre la figura estática además del HTML
    return anim
```

```python jupyter={"is_executing": false}
from math import cos, sin, pi

N = 200
# Gas con todas las velocidades de módulo 10 en direcciones aleatorias:
# el histograma arranca como una delta y debe termalizar hacia Maxwell-Boltzmann
v = 1
ps = [Particle(1, .5, Vector(x, y), Vector(v*cos(a), v*sin(a)))
      for x, y, a in zip(random.uniform(0, 50, N), random.uniform(0, 50, N), random.uniform(0, 2*pi, N))]
ps.append(Particle(10, 5, Vector(50, 50), Vector(0, 0), color='tab:red'))

anim = animar_hist(ps)
with open('Clase-09_anim.html', 'w') as f:
    f.write(anim.to_jshtml())                        # versión interactiva, un solo archivo
anim.save('../Imgs/Clase-09_anim.gif', writer='pillow', fps=20)   # para embeber en la web
# HTML(anim.to_jshtml())   # alternativa: embeber directo en el output (infla el .ipynb)
```

La animación interactiva puede verse **abriendo el archivo `Clase-09_anim.html` en el navegador** (se genera al ejecutar la celda anterior, queda en la misma carpeta que este notebook).

## Animación del histograma

![[Imgs/Clase-09_anim.gif]]

---
