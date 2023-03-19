import 'package:flutter/material.dart';

import 'nullable_image.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.onTap,
    super.key,
  });

  final int id;
  final String name;
  final String? thumbnail;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: Alguna animación si queda tiempo
        onTap();
      },
      child: Stack(
        children: [
          Hero(tag: id, child: NullableNetworkImage(url: thumbnail)),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ColoredBox(
              color: Theme.of(context).colorScheme.surface,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
