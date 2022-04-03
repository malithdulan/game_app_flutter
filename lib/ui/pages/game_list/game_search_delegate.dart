import 'package:flutter/material.dart';

import 'package:game_app/ui/pages/game_list/widgets/game_list_item_section/game_list_item.dart';

import '../../../repositories/models/result.dart';

class GameSearchDelegate extends SearchDelegate {
  final List<Result>? data;
  GameSearchDelegate({required this.data});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _getSearchItemListView(data: _getMatchedQueryData(), key: "SearchGameListResult");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _getSearchItemListView(data: _getMatchedQueryData(), key: "SearchGameListSuggestions");
  }

  List<Result> _getMatchedQueryData() {
    List<Result> matchedQueryData = [];
    for (Result value in data ?? []) {
      String? name = value.name;
      if (((name != null) ? name.toLowerCase().contains(query.toLowerCase()) : false)) {
        matchedQueryData.add(value);
      }
    }
    return matchedQueryData;
  }

  ListView _getSearchItemListView({required List<Result> data, required String key}) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GameListItem(
          key: ValueKey("${data[index].name}$key"),
          data: data[index],
        );
      },
      itemCount: data.length,
    );
  }
}
