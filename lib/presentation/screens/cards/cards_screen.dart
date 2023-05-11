import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {"elevation": 1.0, "label": "Elevation 1"},
  {"elevation": 2.0, "label": "Elevation 2"},
  {"elevation": 3.0, "label": "Elevation 3"},
  {"elevation": 4.0, "label": "Elevation 4"},
];

class CardsScreen extends StatelessWidget {
  static const String name = 'CardsScreen';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...cards.map(
              (card) => _CardTypeOne(
                  label: card['label'], elevation: card['elevation']),
            ),
            ...cards.map(
              (card) => _CardType2(
                  label: card['label'], elevation: card['elevation']),
            ),
            ...cards.map(
              (card) => _CardType3(
                  label: card['label'], elevation: card['elevation']),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}

class _CardTypeOne extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardTypeOne({
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Theme.of(context).colorScheme.outline),
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.ac_unit)),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardType2({
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surfaceVariant,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Theme.of(context).colorScheme.outline),
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.ac_unit)),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text("$label - Filled"),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardType3({
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/350',
            height: 350,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))),
              child:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
            ),
          )
        ],
      ),
    );
  }
}
