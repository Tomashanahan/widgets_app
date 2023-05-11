import 'package:flutter/material.dart';
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
    subTitle: 'Progress Indicators',
    title: 'Progress Indicators',
    iconData: Icons.refresh_rounded,
    routeName: ProgressScreen.name,
    routeComponentName: ProgressScreen(),
  ),
  Menuitem(
    link: '/snack-bars',
    subTitle: 'snack-bars',
    title: 'Snack Bars',
    iconData: Icons.info_outline,
    routeName: SnackBarScreen.name,
    routeComponentName: SnackBarScreen(),
  ),
];
