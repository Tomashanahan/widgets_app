import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const String name = 'SnackBarScreen';
  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Hola')),
    );
  }

  void openCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text(
          'Estas seguro? Estas seguro? Estas seguro? Estas seguro? Estas seguro? Estas seguro? Estas seguro? Estas seguro? Estas seguro?',
        ),
        actions: [
          TextButton(
              onPressed: () => context.pop(),
              child: const Text('Cancelar')),
          FilledButton(onPressed: () {}, child: const Text('Aceptar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snacks y diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () => showAboutDialog(context: context),
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openCustomDialog(context),
              child: const Text('Mostrar dialogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
