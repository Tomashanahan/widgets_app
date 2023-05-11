import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

class Menuitem {
  final String title;
  final String subTitle;
  final String link;
  final String routeName;
  final IconData iconData;

  const Menuitem({
    required this.link,
    required this.subTitle,
    required this.title,
    required this.iconData,
    required this.routeName,
  });
}

const menuItems = <Menuitem>[
  Menuitem(
    link: '/buttons',
    subTitle: 'Varios botones en Flutter',
    title: 'Botones',
    iconData: Icons.smart_button_rounded,
    routeName: ButtonsScreen.name,
  ),
  Menuitem(
    link: '/cards',
    subTitle: 'Un contenedor estilizado',
    title: 'Tarjetas',
    iconData: Icons.credit_card_outlined,
    routeName: CardsScreen.name,
  ),
];
