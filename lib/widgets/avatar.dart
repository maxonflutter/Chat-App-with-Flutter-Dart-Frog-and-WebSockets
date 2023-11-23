import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.imageUrl,
    required this.radius,
  });

  final String imageUrl;
  final int radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius.toDouble() + 2,
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: CircleAvatar(
        radius: radius.toDouble(),
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}
