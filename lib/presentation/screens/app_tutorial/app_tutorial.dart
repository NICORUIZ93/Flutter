import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
    title: 'Buscar comida',
    caption:
        'Nostrud quis tempor anim eiusmod sint ut deserunt ipsum pariatur sit. Sint cillum sint eiusmod ad fugiat voluptate. Adipisicing enim elit do enim reprehenderit officia commodo et nostrud eu do laborum. Proident voluptate in consequat reprehenderit laboris velit quis tempor proident Lorem elit. Ad do exercitation deserunt Lorem incididunt officia culpa enim dolor non quis. Nulla do cupidatat consectetur pariatur ex consequat irure. Dolore aliqua sunt esse occaecat magna occaecat enim fugiat minim.',
    imageUrl: 'assets/images/1.png',
  ),
  SlideInfo(
    title: 'Entrega rapida',
    caption:
        'Aliqua aute irure dolor est minim dolore reprehenderit ut ea reprehenderit esse nostrud. Laborum ullamco consequat fugiat aliquip pariatur do tempor magna in ullamco labore tempor. Elit adipisicing officia deserunt eu aute tempor ad magna incididunt qui. Id anim commodo eiusmod deserunt culpa. Dolore duis cupidatat ut pariatur enim anim.',
    imageUrl: 'assets/images/2.png',
  ),
  SlideInfo(
    title: 'Disfruta la comida',
    caption:
        'Labore in nisi dolor id aute minim anim cillum consectetur nulla. Lorem mollit enim sunt aliqua nisi excepteur magna eu. Nisi Lorem laboris reprehenderit veniam consectetur voluptate.',
    imageUrl: 'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageController = PageController();
  bool endReach = false;

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      final page = pageController.page ?? 0;
      final shouldShowButton = page >= (slides.length - 1);

      if (shouldShowButton != endReach) {
        setState(() {
          endReach = shouldShowButton;
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tutorial')),
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: BouncingScrollPhysics(),
            children: slides
                .map(
                  (slideData) => _Slides(
                    slideData.title,
                    slideData.caption,
                    slideData.imageUrl,
                  ),
                )
                .toList(),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text('Saltar'),
            ),
          ),

          Positioned(
            right: 20,
            bottom: 30,
            child: AnimatedSlide(
              offset: endReach ? Offset.zero : Offset(0, 1),
              duration: Durations.medium3,
              curve: Curves.easeOutBack,
              child: AnimatedOpacity(
                opacity: endReach ? 1 : 0,
                duration: Durations.medium2,
                child: IgnorePointer(
                  ignoring: !endReach,
                  child: FilledButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text('Comenzar'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Slides extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slides(this.title, this.caption, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage(imageUrl)),
              SizedBox(height: 20),
              Text(title, style: titleStyle),
              SizedBox(height: 20),
              Text(caption, style: captionStyle),
            ],
          ),
        ),
      ],
    );
  }
}
