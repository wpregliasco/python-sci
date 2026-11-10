---
publish: true
---

# Clase 7

## GIT++

![bg right:73% 80%](Imgs/Clase-07.png)

Los ejemplos son de
[learngitbranching.js.org](https://learngitbranching.js.org/)

---

<style scoped> table { margin-left: auto; margin-right: auto; }
</style>

|  Commit                           |                             |     |
| --------------------------- | --------------------------- | --- |
| ![h:500px](Imgs/Clase-07-2.png) | **git commit**---> |  ![h:500px](Imgs/Clase-07-1.png)    |

---

<style scoped> table { margin-left: auto; margin-right: auto; }
</style>

|                           Branch                                           |     |                                    |     |                                                |     |                             |
|:--------------------------------------------------------------------:|:---:|:----------------------------------:|:---:|:---------------------------:|:---:|:-------------------------------|
| ![h:200px](Imgs/Clase-07-7.png)![h:200px](Imgs/Clase-07-6.png) | >>  | ![h:400px](Imgs/Clase-07-5.png) | >>  | ![h:400px](Imgs/Clase-07-4.png) | >>  | ![h:400px](Imgs/Clase-07-3.png) |
|                           switch -c ramita                           |     | commit                             |     | switch main                    |     | commit  |

---

<style scoped> table { margin-left: auto; margin-right: auto; }
</style>

|               Merge               |     |                                     |     |                                    |
|:---------------------------------:|:---:|:-----------------------------------:|:---:|:---------------------------------- |
| ![h:400](Imgs/Clase-07-11.png) | >>  | ![h:400px](Imgs/Clase-07-10.png) | >>  | ![h:400px](Imgs/Clase-07-8.png) |
|                                   |     |            merge ramita             |     | switch ramita <br> merge main      |

---

## Merge anda bien

- si se editaron archivos diferentes
- si se editó el mismo archivo en lugares diferentes

## Merge falla

- si hay ediciones **en la misma línea**

<div align="right">

![h:200px](Imgs/Clase-07-12.png)

</div>

---

<style scoped> section { font-size: 32px; } </style>

## Merge fallado

```bash
❯ git merge ramita
Auto-merging pyproject.toml
CONFLICT (content): Merge conflict in pyproject.toml
Automatic merge failed; fix conflicts and then commit the result.
```

Siempre

```bash
git status
```

Rajemos

```bash
git merge --abort
```

---

## Conflicto señalado

![h:500px](Imgs/Clase-07-13.png)

---

## Resolución

- edito a mano
- `git add <archivo con conflicto>` <- sale del estado de conflicto
- `git commit -m "merge resuelto: ganaron los buenos"`

Cosas Útiles

```bash
git status
git diff --check
```

(ejemplo en vivo)

---

# `rebase`

![bg](Imgs/Clase-07-14.png)

---

# Repositorios

<style scoped> table { margin-left: auto; margin-right: auto; }
</style>

| Clone                        |
| ---------------------------- |
| ![h:400px](Imgs/Clase-07-15.png) |

---

<style scoped> table { margin-left: auto; margin-right: auto; }
</style>

|  Fetch                          |                             |     |
| --------------------------- | --------------------------- | --- |
| ![h:400px](Imgs/Clase-07-18.png) | ![h:400px](Imgs/Clase-07-17.png) |  |

---

<style scoped> table { margin-left: auto; margin-right: auto; }
</style>

| Pull                         |                              |                              |
| ---------------------------- | ---------------------------- | ---------------------------- |
| ![h:250px w:300](Imgs/Clase-07-20.png) | ![h:300px](Imgs/Clase-07-23.png) | ![h:300px](Imgs/Clase-07-22.png) |
|                              | fetch                        | merge origin/main            |

---

<style scoped> table { margin-left: auto; margin-right: auto; }
</style>

| Pull                         |                              |                              |
| ---------------------------- | ---------------------------- | ---------------------------- |
| ![h:250px w:300](Imgs/Clase-07-20.png) | ![h:300px](Imgs/Clase-07-23.png) | ![h:300px](Imgs/Clase-07-22.png) |
|                              | fetch                        | merge origin/main            |

---

<style scoped> table { margin-left: auto; margin-right: auto; }
</style>

| Push                         |                              |
| ---------------------------- | ---------------------------- |
| ![](Imgs/Clase-07-25.png) | ![](Imgs/Clase-07-24.png) |

suele solicitar un `git pull`

---

![bg h:100%](Imgs/Clase-07-26.png)
