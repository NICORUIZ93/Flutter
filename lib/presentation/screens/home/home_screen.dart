import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wingets_app/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter + Material 3')),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _CustomListType(menuItem: menuItem);
      },
    );
  }
}

class _CustomListType extends StatelessWidget {
  const _CustomListType({required this.menuItem});

  final MenuItems menuItem;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return ListTile(
      hoverColor: Color.fromARGB(26, 38, 255, 0),
      leading: Icon(menuItem.icon, color: color.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: color.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subtitle),
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute<void>(builder: (context) => const ButtonsScreen()),
        // );
        //Navigator.pushNamed(context, menuItem.link);

        context.push(menuItem.link);
      },
    );
  }
}
