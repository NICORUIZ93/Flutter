import 'package:flutter/material.dart';

class AnimatedScreen extends StatelessWidget {
  static const String name = 'animated_Screen';

  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animaciones')),
      body: Center(child: Text('En construcción')),
    );
  }
}
