import 'package:flutter/material.dart';

class NullableNetworkImage extends StatelessWidget {
  const NullableNetworkImage({
    super.key,
    required this.url,
    this.height,
  });
  final String? url;
  final double? height;
  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return Container(
        height: height,
        width: height,
        color: Colors.grey,
        child: Text('?', style: Theme.of(context).textTheme.displayMedium),
      );
    }

    return Image.network(
      url!,
      height: height,
    );
  }
}
