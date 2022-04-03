import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final BorderRadius? radius;
  final bool shadow;
  final ImageProvider? image;
  final Widget? child;
  const ImageCard({
    Key? key,
    this.radius,
    this.shadow = true,
    this.image,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: child,
      decoration: BoxDecoration(
        borderRadius: radius,
        image: (image != null) ? DecorationImage(
          image: image!,
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.mode(
            Colors.black12,
            BlendMode.darken,
          ),
        ) : null,
        boxShadow: shadow
            ? const [
                BoxShadow(blurRadius: 5),
              ]
            : null,
      ),
    );
  }
}
