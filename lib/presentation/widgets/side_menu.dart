import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) => setState(() {
        navDrawerIndex = value;
        context.pushNamed(menuItems[value].routeName);
        widget.scaffoldKey.currentState?.closeDrawer();
      }),
      children: [
        ...menuItems.sublist(0, 3).map(
              (menuItem) => NavigationDrawerDestination(
                icon: Icon(menuItem.iconData),
                label: Text(menuItem.title),
              ),
            ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        ...menuItems
            .sublist(
              3,
            )
            .map(
              (menuItem) => NavigationDrawerDestination(
                icon: Icon(menuItem.iconData),
                label: Text(menuItem.title),
              ),
            ),
      ],
    );
  }
}
