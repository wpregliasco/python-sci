---
publish: true
---

# Python Científico

## de la ecuación al programa

### Clase 2b

![bg left:40% 100%](Imgs/Clase-02_2.png)

- variables `set`, `dict`
- loops y estructuras de control

---

# set

- Declaración: `{1,2,3}`  `set([1,2,3])`
- Métodos: `add`, `discard`, `in`, `len`
- Operaciones:
  - `|` union
  - `&` intersection
  - `-` diferencia
  - `^` diferencia simétrica
- _No hay índices ni orden_

---

# dict

_clave -> valor_

- Declaración: `a = {'nombre':'pepe', 'edad':35 }`
- Acceso: `a['nombre']`  `a.get('nombre', 'NN')`
- `in` pregunta por claves
- Recorrer con `keys()`  `items()`

---

## Condicionales (if..elif..else)

```Python
for temp in [95, 75, 60, 25, 5]: 
	if temp > 90: 
		print(f"{temp:>3} °C → 🔥 Yerba quemada") 
	elif temp >= 70: 
		print(f"{temp:>3} °C → 🧉 Mate perfecto") 
	elif temp >= 50: 
		print(f"{temp:>3} °C → 😐 Tibio y decepcionante") 
	elif temp >= 20: 
		print(f"{temp:>3} °C → 🥶 Tereré") 
	else: 
		print(f"{temp:>3} °C → 🧊 Refrescante")
```

---

## Loops (continue y break)

<style scoped> section { font-size: 30px; } </style>

```Python
# buscadores de oro

recolectado = { 'plata':'reluce',
                'oro':'reluce',
                'madera': 'desluce',
                'estrella':'reluce'}

for key,value in recolectado.items():
	if value!='reluce':
		continue
	else:
		if key=='oro':
			print('encontré oro !!!')
			break

```
