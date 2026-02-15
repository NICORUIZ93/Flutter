import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: Text('Hola mundo'),
      backgroundColor: Colors.amberAccent,
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('¿Estas seguro?'),
        content: Text(
          'Et deserunt consectetur ut sit excepteur excepteur quis deserunt aliquip. Eiusmod velit ex quis in proident sunt. Ut enim esse eu incididunt excepteur irure enim nulla nostrud irure minim id. Id ullamco laboris ipsum quis fugiat reprehenderit commodo ea aliquip. Nulla sit qui proident nulla deserunt culpa. Lorem proident aliqua laborum elit magna minim deserunt esse consectetur pariatur aute deserunt. Et sit anim laborum qui ut duis officia occaecat.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text('Cancelar'),
          ),
          FilledButton(onPressed: () {}, child: Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbar y dialogos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    Text(
                      'Dolore exercitation Lorem dolore dolor qui veniam culpa. Tempor duis quis ut est exercitation deserunt duis laboris labore laborum incididunt ullamco proident consequat. Officia ipsum veniam qui ex elit ex commodo nostrud id ullamco laborum velit. Eu consectetur commodo officia magna fugiat occaecat nostrud exercitation amet eiusmod. Ipsum ut officia veniam sunt nostrud sint ea. Excepteur mollit pariatur aute reprehenderit dolor do occaecat.',
                    ),
                  ],
                );
              },
              child: Text('Licencias usadas'),
            ),
            SizedBox(height: 20),
            FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: Text('Mostrar dialogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showCustomSnackbar(context);
        },
        label: Text('Mostrar Snackbar'),
        icon: Icon(Icons.airline_seat_recline_extra_outlined),
      ),
    );
  }
}
