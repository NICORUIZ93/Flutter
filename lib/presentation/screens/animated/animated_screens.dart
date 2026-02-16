import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.black12;
  double borderRadius = 20.0;

  void changeShape() {
    final random = Random();
    width = random.nextInt(200) + 50;
    height = random.nextInt(300) + 50;
    color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );
    borderRadius = random.nextDouble() * 20;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animaciones')),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeIn,
          width: width < 0 ? 0 : width,
          height: height < 0 ? 0 : height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: color,
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeShape();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
