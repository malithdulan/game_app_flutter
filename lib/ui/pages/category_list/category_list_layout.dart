import 'package:flutter/material.dart';

import 'package:game_app/ui/pages/category_list/widgets/category_header_widget.dart';
import 'package:game_app/ui/pages/category_list/widgets/category_section_widgets/category_widget.dart';
import 'package:game_app/ui/pages/category_list/widgets/games_by_category_section_widgets/games_by_category_widget.dart';

class CategoryListLayout extends StatelessWidget {
  const CategoryListLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CategoryHeaderWidget(),
        CategoryWidget(),
        GamesByCategoryWidget(),
      ],
    );
  }
}
