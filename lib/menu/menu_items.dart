import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItems({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItems>[
  MenuItems(
    title: 'Botones',
    subtitle: 'Varios botones en flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItems(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card_outlined,
  ),
  MenuItems(
    title: 'Progreso',
    subtitle: 'Indicadores de progreso',
    link: '/progress',
    icon: Icons.query_stats_outlined,
  ),
  MenuItems(
    title: 'Tutorial',
    subtitle: 'Guía de la aplicación',
    link: '/tutorial',
    icon: Icons.school_outlined,
  ),
  MenuItems(
    title: 'Scroll infinito',
    subtitle: 'Lista con carga progresiva',
    link: '/infinite',
    icon: Icons.all_inclusive_outlined,
  ),
  MenuItems(
    title: 'Snackbar',
    subtitle: 'Mensajes temporales',
    link: '/snackbar',
    icon: Icons.notifications_outlined,
  ),
  MenuItems(
    title: 'UI Controls',
    subtitle: 'Controles y switches',
    link: '/ui-controls',
    icon: Icons.tune_outlined,
  ),
  MenuItems(
    title: 'Animaciones',
    subtitle: 'Transiciones y animaciones',
    link: '/animated',
    icon: Icons.animation_outlined,
  ),
];
