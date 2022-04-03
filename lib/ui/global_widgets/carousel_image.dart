import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  final ImageProvider image;
  const CarouselImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
        image: image,
      )),
    );
  }
}
