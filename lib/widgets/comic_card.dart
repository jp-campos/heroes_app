import 'package:flutter/material.dart';

import 'nullable_image.dart';

class ComicImage extends StatelessWidget {
  const ComicImage({
    required this.image,
    super.key,
  });

  final String? image;
  @override
  Widget build(BuildContext context) {
    return NullableNetworkImage(
      url: image,
      height: 200,
    );
  }
}
