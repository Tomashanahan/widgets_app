import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provides.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'CounterScreen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int value = ref.watch(counterProvider);
    final bool isDarkModeProvider = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: Icon(isDarkModeProvider
                ? Icons.dark_mode_rounded
                : Icons.light_mode_outlined),
            onPressed: () =>
                ref.read(themeNotifierProvider.notifier).toggleDarkMode(),
          )
        ],
      ),
      body: Center(
        child: Text('Valor: $value',
            style: Theme.of(context).textTheme.titleLarge),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.notifier).state++,
        // ref.read(counterProvider.notifier).update((state) => state + 1);
        child: const Icon(Icons.add),
      ),
    );
  }
}
