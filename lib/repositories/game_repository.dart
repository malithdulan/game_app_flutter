import 'package:game_app/helper/network/network.dart';
import 'package:game_app/helper/network/network_get_methods.dart';
import 'package:game_app/helper/utils.dart';

import 'package:game_app/repositories/models/game.dart';
import 'package:game_app/repositories/models/genre.dart';
import 'package:game_app/repositories/models/result.dart';

class GameRepository {
  Future<Game> getGames(int pageNo) async {
    Map<String, dynamic> data = await Net.shared.getGames(pageNo);
    return Game.fromJson(Utils.shared.getJsonBody(data));
  }

  Future<List<Genre>> getGenres() async {
    Map<String, dynamic> data = await Net.shared.getGenres();
    List<dynamic>? results =
        Utils.shared.getJsonBody(data)?['results'] as List<dynamic>?;
    return (results != null)
        ? results
            .map((value) => Genre.fromJson(value as Map<String, dynamic>?))
            .toList()
        : [];
  }

  Future<List<Result>> getGamesByCategory(int? id) async {
    Map<String, dynamic> data = await Net.shared.getGamesByCategory(id);
    List<dynamic>? results =
        Utils.shared.getJsonBody(data)?['results'] as List<dynamic>?;
    return (results != null)
        ? results
            .map((value) => Result.fromJson(value as Map<String, dynamic>?))
            .toList()
        : [];
  }
}
