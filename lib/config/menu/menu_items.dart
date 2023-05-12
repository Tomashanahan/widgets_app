import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/animated/animated_screen.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

class Menuitem {
  final String title;
  final String subTitle;
  final String link;
  final String routeName;
  final IconData iconData;
  final Widget routeComponentName;

  const Menuitem({
    required this.link,
    required this.subTitle,
    required this.title,
    required this.iconData,
    required this.routeName,
    required this.routeComponentName,
  });
}

const menuItems = <Menuitem>[
  Menuitem(
    link: '/buttons',
    subTitle: 'Varios botones en Flutter',
    title: 'Botones',
    iconData: Icons.smart_button_rounded,
    routeName: ButtonsScreen.name,
    routeComponentName: ButtonsScreen(),
  ),
  Menuitem(
    link: '/cards',
    subTitle: 'Un contenedor estilizado',
    title: 'Tarjetas',
    iconData: Icons.credit_card_outlined,
    routeName: CardsScreen.name,
    routeComponentName: CardsScreen(),
  ),
  Menuitem(
    link: '/progress-indicator',
    subTitle: 'Barras/indicadores de carga',
    title: 'Progress Indicators',
    iconData: Icons.refresh_rounded,
    routeName: ProgressScreen.name,
    routeComponentName: ProgressScreen(),
  ),
  Menuitem(
    link: '/snack-bars',
    subTitle: 'son mini modales, tipo hot-toast',
    title: 'Snack Bars',
    iconData: Icons.info_outline,
    routeName: SnackBarScreen.name,
    routeComponentName: SnackBarScreen(),
  ),
  Menuitem(
    link: '/animated-container',
    subTitle: 'animaciones a un Container',
    title: 'Animated Container',
    iconData: Icons.playlist_play_rounded,
    routeName: AnimatedScreen.name,
    routeComponentName: AnimatedScreen(),
  ),
  Menuitem(
    link: '/ui-controls',
    subTitle: 'Check-boxes y selects',
    title: 'Ui Controls',
    iconData: Icons.check_box_rounded,
    routeName: UiControlsScreen.name,
    routeComponentName: UiControlsScreen(),
  ),
  Menuitem(
    link: '/tutorial',
    subTitle: 'Pequeño tutorial para mostrar la app',
    title: 'Tutorial',
    iconData: Icons.play_lesson,
    routeName: AppTutorialScreen.name,
    routeComponentName: AppTutorialScreen(),
  ),
];
