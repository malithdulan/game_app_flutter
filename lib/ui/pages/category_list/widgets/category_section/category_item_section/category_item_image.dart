import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:game_app/helper/constants.dart';
import 'package:game_app/ui/global_widgets/error_item.dart';
import 'package:game_app/ui/global_widgets/loading_item.dart';

import 'category_item_circle_card.dart';

class CategoryItemImage extends StatelessWidget {
  final bool state;
  final String? image;
  const CategoryItemImage({
    Key? key,
    required this.state,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image ?? Constants.defaultUrl,
      imageBuilder: (context, imageProvider) => CategoryItemCircleCard(
        state: state,
        image: imageProvider,
      ),
      placeholder: (context, url) => CategoryItemCircleCard(
        state: state,
        child: const Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: LoadingItem(),
          ),
        ),
      ),
      errorWidget: (context, url, error) => CategoryItemCircleCard(
        state: state,
        child: const ErrorItem(),
      ),
    );
  }
}
