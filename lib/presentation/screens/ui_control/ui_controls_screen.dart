import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UI Controls')),
      body: _UiControlsView(),
    );
  }
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDevelop = true;
  bool recibirNotificaciones = false;
  Transportation selectedTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isDevelop,
          title: Text('Developer Mode'),
          subtitle: Text('Controles adicionales'),
          onChanged: (value) => setState(() {
            isDevelop = value;
          }),
        ),
        ExpansionTile(
          title: Text('Transporte'),

          children: [
            RadioGroup<Transportation>(
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                if (value != null) selectedTransportation = value;
              }),
              child: Column(
                children: [
                  RadioListTile(
                    title: Text('Carro'),
                    value: Transportation.car,
                  ),
                  RadioListTile(
                    title: Text('Avion'),
                    value: Transportation.plane,
                  ),
                  RadioListTile(
                    title: Text('bote'),
                    value: Transportation.boat,
                  ),
                  RadioListTile(
                    title: Text('Submarino'),
                    value: Transportation.submarine,
                  ),
                ],
              ),
            ),
          ],
        ),

        CheckboxListTile(
          title: Text('Recibir notificaciones'),
          subtitle: Text(recibirNotificaciones.toString().toUpperCase()),
          value: recibirNotificaciones,
          onChanged: (value) => setState(() {
            recibirNotificaciones = !recibirNotificaciones;
          }),
        ),
      ],
    );
  }
}
