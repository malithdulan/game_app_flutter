import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/category_bloc/category_bloc.dart';
import 'package:game_app/helper/extensions.dart';

import 'package:game_app/ui/pages/category_list/widgets/category_section/categories_success.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      buildWhen: (previous, current) => (current is CategoryDataState),
      builder: (context, state) =>
          (state is CategoryDataState && state.status.isSuccess)
              ? CategoriesSuccess(categories: state.data)
              : const SizedBox(),
    );
  }
}
