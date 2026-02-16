import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wingets_app/config/theme/app_theme.dart';
import 'package:wingets_app/config/theme/router/app_router.dart';
import 'package:wingets_app/presentation/providers/theme_provider.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final selectedColor = ref.watch(selectedColorProvider);

    return MaterialApp.router(
      title: 'Flutter Widget',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: selectedColor, isDarkMode: false).getTheme(),
      darkTheme: AppTheme(selectedColor: selectedColor, isDarkMode: true).getTheme(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
