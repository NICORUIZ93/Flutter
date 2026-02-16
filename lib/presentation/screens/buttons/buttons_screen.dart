import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buttons Screen')),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Elevated')),
            ElevatedButton(onPressed: null, child: Text('disable')),
            ElevatedButton(onPressed: () {}, child: Text('Elevated')),
            ElevatedButton.icon(
              onPressed: () {},
              label: Text('Elevated icon'),
              icon: Icon(Icons.safety_check),
            ),
            FilledButton(onPressed: () {}, child: Text('Filled')),
            FilledButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add_chart_sharp),
              label: Text('FilledButton icon'),
            ),
            OutlinedButton(onPressed: () {}, child: Text('OutlinedButton')),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.zoom_in_map_rounded),
              label: Text('OutlinedButton'),
            ),
            TextButton(onPressed: () {}, child: Text('TextButton')),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.accessible_forward_sharp),
              label: Text('TextButton.icon'),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_balance_wallet_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_business_outlined),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola mundo', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
