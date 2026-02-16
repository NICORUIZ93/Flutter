import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wingets_app/config/theme/app_theme.dart';
import 'package:wingets_app/presentation/providers/theme_provider.dart';

class ThemeChangeScreen extends ConsumerWidget {
  static const String name = 'theme_change_screen';

  const ThemeChangeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final selectedColor = ref.watch(selectedColorProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Cambio de tema')),
      body: ListView(
        children: [
          SwitchListTile(
            value: isDarkMode,
            title: const Text('Modo oscuro'),
            subtitle: const Text('Activa el tema oscuro global'),
            onChanged: (value) {
              ref.read(isDarkModeProvider.notifier).state = value;
            },
          ),
          const Divider(),
          RadioGroup<int>(
            groupValue: selectedColor,
            onChanged: (value) {
              if (value == null) return;
              ref.read(selectedColorProvider.notifier).state = value;
            },
            child: Column(
              children: List.generate(colors.length, (index) {
                final color = colors[index];
                return RadioListTile<int>(
                  value: index,
                  title: Text('Color ${index + 1}'),
                  subtitle: Text(
                    '#${color.toARGB32().toRadixString(16).padLeft(8, '0').toUpperCase()}',
                  ),
                  secondary: CircleAvatar(backgroundColor: color),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
