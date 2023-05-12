import 'package:flutter/material.dart';

class AppTutorialScreen extends StatelessWidget {
  static const String name = 'AppTutorialScreen';
  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ui controls'),
      ),
    );
  }
}
