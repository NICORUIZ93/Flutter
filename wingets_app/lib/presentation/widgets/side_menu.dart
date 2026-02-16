import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wingets_app/menu/menu_items.dart';

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
    final bool hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    final currentPath = GoRouterState.of(context).uri.path;
    final selectedIndex = appMenuItems.indexWhere(
      (item) => item.link == currentPath,
    );
    final effectiveIndex = selectedIndex >= 0 ? selectedIndex : navDrawerIndex;

    return NavigationDrawer(
      selectedIndex: effectiveIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.go(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: Text('Main'),
        ),

        ...mainMenuItems
            .map(
              (menu) => NavigationDrawerDestination(
                icon: Icon(menu.icon),
                label: Text(menu.title),
              ),
            ),

        Padding(padding: EdgeInsets.fromLTRB(28, 16, 16, 10), child: Divider()),

        ...showcaseMenuItems
            .map(
              (menu) => NavigationDrawerDestination(
                icon: Icon(menu.icon),
                label: Text(menu.title),
              ),
            ),
      ],
    );
  }
}
