# Wingets App

Demo app en Flutter con Material 3, `go_router` y `flutter_riverpod`.

## Requisitos

- Flutter SDK `3.10.8` o compatible con `sdk: ^3.10.8`
- Dart incluido con Flutter

## Ejecutar

```bash
flutter pub get
flutter run
```

## Calidad de código

```bash
flutter analyze
flutter test
```

## Estructura principal

- `lib/main.dart`: arranque de app y configuración global de tema.
- `lib/config/theme/`: tema y router.
- `lib/menu/menu_items.dart`: rutas y metadata del menú.
- `lib/presentation/screens/`: pantallas de ejemplo.
- `lib/presentation/providers/`: estado global con Riverpod.

## Funcionalidades actuales

- Navegación declarativa con `go_router`.
- Cambio global de tema (claro/oscuro + color semilla).
- Ejemplos de UI: botones, tarjetas, progreso, tutorial, scroll infinito, snackbar, controles, animaciones y contador.
