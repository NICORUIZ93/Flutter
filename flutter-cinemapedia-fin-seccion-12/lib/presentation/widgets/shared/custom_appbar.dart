import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
        bottom: false,
        child: Container(
          color: colores.secondary,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Icon(
                    Icons.movie_outlined,
                    color: colores.primary,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'cinemapedia',
                    style: textStyle,
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.search_rounded))
                ],
              ),
            ),
          ),
        ));
  }
}
