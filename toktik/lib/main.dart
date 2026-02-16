import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme().getTheme(),
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Demo Home Page')),
        body: Center(child: Text('Hello, World!')),
      ),
    );
  }
}
