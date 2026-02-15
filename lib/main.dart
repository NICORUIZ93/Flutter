import 'package:flutter/material.dart';
import 'package:wingets_app/config/theme/app_theme.dart';
import 'package:wingets_app/config/theme/router/app_router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Widget',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 4).getTheme(),
    );
  }
}
