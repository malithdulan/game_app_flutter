import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:game_app/ui/pages/category_list/blocs/category_bloc/category_bloc.dart';
import 'package:game_app/ui/pages/category_list/blocs/games_by_category_bloc/games_by_category_bloc.dart';

import '../../../../../helper/utils.dart';
import '../../../../../repositories/models/genre.dart';

class CategoryItem extends StatelessWidget {
  final Genre? category;

  const CategoryItem({Key? key, required this.category}) : super(key: key);

  void _selectCategory(BuildContext context) {
    context.read<CategoryBloc>().add(SelectCategory(
          selectedId: category?.id,
        ));
    context.read<GamesByCategoryBloc>().add(GetGamesByCategory(
          selectedId: category?.id,
          categoryName: category?.name,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocSelector<CategoryBloc, CategoryState, bool>(
        selector: (state) =>
            (state is CategorySelectState && state.selectedId == category?.id)
                ? true
                : false,
        builder: (context, state) => GestureDetector(
          onTap: () => (!state) ? _selectCategory(context) : () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: category?.imageBackground ?? "",
                imageBuilder: (context, imageProvider) =>
                    Utils.shared.categoryItemCircle(
                  state: state,
                  image: imageProvider,
                ),
                placeholder: (context, url) => Utils.shared.categoryItemCircle(
                  state: state,
                  child: const Center(
                    child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(),),
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Utils.shared.categoryItemCircle(
                  state: state,
                  child: const Icon(
                    Icons.error,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
              SizedBox(
                height: Utils.shared.percentPH(1),
              ),
              Text(
                category?.name ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: state ? 15 : 12,
                  overflow: TextOverflow.ellipsis,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
