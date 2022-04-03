import 'package:flutter/material.dart';

import '../../../../../../helper/utils.dart';

class CategoryItemCircleCard extends StatelessWidget {
  final bool state;
  final ImageProvider? image;
  final Widget? child;
  const CategoryItemCircleCard({Key? key, this.image, this.child, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: state
          ? Utils.shared.percentW(20)
          : Utils.shared.percentW(18),
      height: state
          ? Utils.shared.percentW(20)
          : Utils.shared.percentW(18),
      decoration: BoxDecoration(
        image: (image != null) ? DecorationImage(
          image: image!,
          fit: BoxFit.cover,
          colorFilter: state ? const ColorFilter.mode(
            Colors.black12,
            BlendMode.lighten,
          ) : const ColorFilter.mode(
            Colors.black45,
            BlendMode.darken,
          ),
        ) : null,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(blurRadius: 5),
        ],
      ),
      child: child,
    );
  }
}
