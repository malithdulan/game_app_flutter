import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/ui/global_widgets/error_placeholder.dart';
import 'package:game_app/ui/global_widgets/loading_placeholder.dart';

import '../../../../../helper/enums.dart';
import '../../../../../helper/utils.dart';
import '../../blocs/category_bloc/category_bloc.dart';

import 'package:game_app/ui/pages/category_list/widgets/category_section/categories_success.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  void _getCategories(BuildContext context) {
    context.read<CategoryBloc>().add(ShowReloadCategory());//show reloading after reload button press
    Future.delayed(
      //a delay to show it's working, avoiding the user confusion of pressing the reload button
      const Duration(seconds: 1),
      () => context.read<CategoryBloc>().add(GetCategories()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Utils.shared.percentPH(19),
      child: BlocBuilder<CategoryBloc, CategoryState>(
          buildWhen: (previous, current) => (current is CategoryDataState),
          builder: (context, state) {
            switch ((state as CategoryDataState).status) {
              case LOADING_STATUS.success:
                return CategoriesSuccess(categories: state.data);
              case LOADING_STATUS.error:
                return ErrorPlaceholder(
                  message: state.errorMessage,
                  callBack: () => _getCategories(context),
                );
              case (LOADING_STATUS.loading):
                return const LoadingPlaceholder();
              default:
                return const SizedBox();
            }
          }),
    );
  }
}
