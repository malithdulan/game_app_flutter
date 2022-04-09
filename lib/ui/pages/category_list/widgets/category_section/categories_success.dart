import 'package:flutter/material.dart';

import 'package:game_app/helper/utils.dart';

import 'package:game_app/ui/pages/category_list/widgets/category_section/category_item_section/category_item.dart';

import '../../../../../repositories/models/genre.dart';

class CategoriesSuccess extends StatelessWidget {
  final List<Genre>? categories;
  const CategoriesSuccess({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (context, index) => CategoryItem(
        key: ValueKey("${categories?[index].name}$index"),
        category: categories?[index],
      ),
      itemCount: categories?.length,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisExtent: Utils.shared.percentW(25),
      ),
    );
  }
}
