import 'package:flutter/material.dart';

abstract final class AppRoutes {
  static const buttons = '/buttons';
  static const cards = '/cards';
  static const progress = '/progress';
  static const tutorial = '/tutorial';
  static const infinite = '/infinite';
  static const snackbar = '/snackbar';
  static const uiControls = '/ui-controls';
  static const animated = '/animated';
  static const counter = '/counter';
  static const themeChange = '/theme_change';
}

enum MenuSection { main, showcase }

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;
  final MenuSection section;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
    required this.section,
  });
}

const mainMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subtitle: 'Catalogo de botones Material 3',
    link: AppRoutes.buttons,
    icon: Icons.touch_app_outlined,
    section: MenuSection.main,
  ),
  MenuItem(
    title: 'Tarjetas',
    subtitle: 'Ejemplos de Card y variantes visuales',
    link: AppRoutes.cards,
    icon: Icons.dashboard_customize_outlined,
    section: MenuSection.main,
  ),
  MenuItem(
    title: 'Progreso',
    subtitle: 'Cargas lineales y circulares',
    link: AppRoutes.progress,
    icon: Icons.hourglass_top_outlined,
    section: MenuSection.main,
  ),
];

const showcaseMenuItems = <MenuItem>[
  MenuItem(
    title: 'Tutorial',
    subtitle: 'Guia inicial de uso',
    link: AppRoutes.tutorial,
    icon: Icons.play_lesson_outlined,
    section: MenuSection.showcase,
  ),
  MenuItem(
    title: 'Scroll infinito',
    subtitle: 'Carga continua de contenido',
    link: AppRoutes.infinite,
    icon: Icons.sync_alt_outlined,
    section: MenuSection.showcase,
  ),
  MenuItem(
    title: 'Snackbar',
    subtitle: 'Alertas y dialogos del sistema',
    link: AppRoutes.snackbar,
    icon: Icons.campaign_outlined,
    section: MenuSection.showcase,
  ),
  MenuItem(
    title: 'UI Controls',
    subtitle: 'Switches, radios y checkboxes',
    link: AppRoutes.uiControls,
    icon: Icons.toggle_on_outlined,
    section: MenuSection.showcase,
  ),
  MenuItem(
    title: 'Animaciones',
    subtitle: 'Animaciones implicitas y transiciones',
    link: AppRoutes.animated,
    icon: Icons.motion_photos_on_outlined,
    section: MenuSection.showcase,
  ),
  MenuItem(
    title: 'Riverpod Contador',
    subtitle: 'Estado global con Riverpod',
    link: AppRoutes.counter,
    icon: Icons.calculate_outlined,
    section: MenuSection.showcase,
  ),
  MenuItem(
    title: 'Cambio de tema',
    subtitle: 'Modo claro/oscuro y paleta',
    link: AppRoutes.themeChange,
    icon: Icons.color_lens_outlined,
    section: MenuSection.showcase,
  ),
];

const appMenuItems = <MenuItem>[
  ...mainMenuItems,
  ...showcaseMenuItems,
];

final routeToMenuItem = <String, MenuItem>{
  for (final item in appMenuItems) item.link: item,
};

MenuItem? menuItemByRoute(String route) => routeToMenuItem[route];
