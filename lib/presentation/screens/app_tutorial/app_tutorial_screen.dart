import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imgUrl;

  SlideInfo(this.title, this.caption, this.imgUrl);
}

final slide = <SlideInfo>[
  SlideInfo(
      'Busca lo que queres comer',
      "Nulla mollit quis incididunt cillum dolore laboris. Enim aute aliquip labore anim excepteur deserunt Lorem tempor velit consectetur aliqua ut esse anim. Esse ipsum ut nulla nostrud nulla est culpa ipsum. Non exercitation mollit ut ad id eu. Est in exercitation deserunt incididunt nisi fugiat culpa incididunt culpa aliqua elit. Ea anim reprehenderit pariatur elit enim aute officia consectetur minim excepteur esse. Tempor et sunt id et sunt sunt amet quis.",
      "assets/Images/1.png"),
  SlideInfo(
      'Realiza el pago del lo seleccionado',
      "Culpa deserunt deserunt minim anim in exercitation commodo ex id et. Nostrud ut quis id culpa cillum aliquip velit veniam incididunt irure eu. Enim ex commodo est culpa sit fugiat mollit commodo fugiat. Aliquip do qui ea deserunt consectetur eiusmod eiusmod. Laboris culpa laboris cillum laborum proident amet deserunt do ea ullamco sit ea nostrud ullamco. Irure cupidatat consequat dolore commodo dolor occaecat.",
      "assets/Images/2.png"),
  SlideInfo(
      'Espera a que el repartidor llegue a tu casa',
      "Cillum mollit duis ullamco pariatur consequat in duis fugiat ex commodo irure incididunt sint. Enim commodo officia aliqua in enim sit magna elit ea ea. Adipisicing sint laboris aliquip in amet.",
      "assets/Images/3.png"),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'AppTutorialScreen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      if (endReached == false && pageViewController.page! > 1.8) {
        setState(() {
          endReached = true;
        });
      } else if (pageViewController.page! < 1.8) {
        setState(() {
          endReached = false;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slide
                .map(
                  (slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imgUrl: slideData.imgUrl),
                )
                .toList(),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            right: 20,
            child: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.close_rounded),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: MediaQuery.of(context).padding.bottom,
                  right: 20,
                  child: FadeInRight(
                    from: 15,
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Icon(Icons.close_rounded),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imgUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imgUrl),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
