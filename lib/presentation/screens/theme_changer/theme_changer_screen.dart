import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChanger extends ConsumerWidget {
  static const name = 'ThemeChanger';
  const ThemeChanger({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkModeProvider = ref.watch(themeNotifierProvider).isDarkMode;
    // final acaNuevoProvider = ref.watch(themeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme changer'),
        actions: [
          IconButton(
              icon: Icon(isDarkModeProvider
                  ? Icons.dark_mode_rounded
                  : Icons.light_mode_outlined),
              onPressed: () =>
                  ref.read(themeNotifierProvider.notifier).toggleDarkMode())
        ],
      ),
      body: const _ThemeChanger(),
    );
  }
}

class _ThemeChanger extends ConsumerWidget {
  const _ThemeChanger();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(themeColorsProvider);
    final colorSelected = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        return RadioListTile(
          title: Text(
            'Este color',
            style: TextStyle(color: colors[index]),
          ),
          value: index,
          onChanged: (value) {
            ref
                .read(themeNotifierProvider.notifier)
                .changeSelectedColor(value as int);
          },
          groupValue: colorSelected,
          activeColor: colors[index],
        );
      },
    );
  }
}
