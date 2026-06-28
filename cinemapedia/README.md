# Cinemapedia

Aplicacion Flutter para explorar peliculas usando la API de The Movie Database (TMDB).

## Requisitos

- Flutter SDK instalado
- Cuenta en TMDB y API key activa

## Configuracion de variables de entorno

1. Crea tu archivo local `.env` a partir del template:

```powershell
Copy-Item .env.template .env
```

2. Abre `.env` y agrega tu clave:

```env
THE_MOVIE_KEY=tu_api_key_de_tmdb
```

3. Verifica que **no** compartes ese archivo en Git.
   El proyecto ya incluye `.env` en `.gitignore`.

## Como obtener la API key

1. Crea una cuenta en TMDB: `https://www.themoviedb.org/signup`
2. Solicita acceso developer: `https://www.themoviedb.org/settings/api`
3. Copia tu API key (v3) y pegala en `.env`

## Ejecutar el proyecto

```powershell
flutter pub get
flutter run
```
