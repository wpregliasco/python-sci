---
publish: true
---

# Python Científico

## de la ecuación al programa

### Clase 3b

![200](Imgs/Clase-03_2.png)

- `global`, y `nonlocal`
- definición de funciones

---

# Ámbito de las variables en Python

Una variable creada dentro de una función, en general, pertenece a esa función y no existe fuera de ella.

## Un caso sencillo

```python
def saludar():
    nombre = "Mariano"
    print(nombre)       

saludar()

# print(nombre) #ERROR
```

Porque `nombre` es una **variable local** de `saludar`. Cuando termina la función, ese nombre deja de estar disponible en ese ámbito. Lo mismo vale para los parametros.

Veamos que pasa si la variable esta definida fuera de la funcion.
\`

```python
def saludar():
    print(nombre)
    
nombre = "Mariano"

saludar()

print(nombre)
```

Esto funciona,  porque `nombre` fue creada **fuera de la función**.  La función puede **leer** una variable global.

Si la variable esta definida dentro de la función, esta defincion tiene precedencia.

```python
def saludar():
    nombre = "Mariano"
    print(nombre)
    
nombre = "Willy"

print(nombre)

saludar()

print(nombre)         
```

Mas aun, si modifico el valor de la variable local **no** se modifica el valor  de la instancia superior.

## Modificador `global`

Si quiero explicitamente que pueda modificar los valores de las variables desde fuera de la funcion tengo que aclararlos mediate la directiva `global`.

```python
def saludar():
	global nombre
	nombre = "Mariano"
	print(nombre)
    
nombre = "Willy"

print (nombre)

saludar()

print(nombre)         
```

## Modificador `nolocal`

`nonlocal` es parecido a global, pero se utiliza con funciones anidadas...

```python
def contador():
	n = 0
	def incrementar():
		nonlocal n
		n += 1
		return n
	return incrementar
	
c1 = contador() # crea el contador UNA vez
c2 = contador()

print(c1()) # 1
print(c1()) # 2
print(c1()) # 3
print()
print(c2()) #1
print(c2()) #2

```

## Una herramienta excelente: `locals()` y `globals()`

Python permite inspeccionar los nombres disponibles.

```python
def prueba():
    y = 20
    print(locals())
    # print(globals())

x = 10

prueba()
```

---

---
