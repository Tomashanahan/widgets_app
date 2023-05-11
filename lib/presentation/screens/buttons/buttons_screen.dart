import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'ButtonsScreen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons Screen')),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated button'),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('Elevated disable'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.cabin),
              label: const Text('Elevated button'),
            ),
            FilledButton(onPressed: () {}, child: const Text('Filled')),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.abc),
              label: const Text('Filled icon'),
            ),
            OutlinedButton(onPressed: () {}, child: const Text('Outline')),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.abc),
              label: const Text('Outline icon'),
            ),
            TextButton(onPressed: () {}, child: const Text('Text')),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.abc),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.abc,
                color: Colors.white,
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.primary)),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.abc),
              label: const Text('Text icon'),
            ),
            const CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        color: Theme.of(context).colorScheme.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Custom button',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
