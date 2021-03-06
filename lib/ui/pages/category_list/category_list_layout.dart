import 'package:flutter/material.dart';

import 'package:game_app/ui/pages/category_list/widgets/category_header.dart';
import 'package:game_app/ui/pages/category_list/widgets/category_section/category.dart';
import 'package:game_app/ui/pages/category_list/widgets/games_by_category_section/games_by_category.dart';

class CategoryListLayout extends StatelessWidget {
  const CategoryListLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MediaQuery.of(context).size.height !=
            0) //mediaQuery returns 0 values in first build loop in release
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              CategoryHeader(),
              Category(),
              GamesByCategory(),
            ],
          )
        : const SizedBox();
  }
}
