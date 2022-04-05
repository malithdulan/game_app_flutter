

import '../enums.dart';
import 'network.dart';
import 'network_config.dart';

extension NetworkGetMethods on Net {
  Future<dynamic> getGames(int pageNo) {
    Map<String, String> query = {"page_size" : "10", "page" : "$pageNo"};
    return performWebServiceRequest(
      uri: NetConfig.getUri(
        path: NetConfig.getGames,
        queryParameters: query,
      ),
      requestType: NETWORK_REQUEST_TYPE.get,
      headers: Net.shared.commonHeaders(),
    );
  }

  Future<dynamic> getGenres() {
    return performWebServiceRequest(
      uri: NetConfig.getUri(path: NetConfig.getGenres),
      requestType: NETWORK_REQUEST_TYPE.get,
      headers: commonHeaders(),
    );
  }

  Future<dynamic> getGamesByCategory(int? genreId) {
    Map<String, String> query = {"genres": "$genreId", "page_size": "100"};
    return performWebServiceRequest(
      uri: NetConfig.getUri(path: NetConfig.getGames, queryParameters: query),
      requestType: NETWORK_REQUEST_TYPE.get,
      headers: commonHeaders(),
    );
  }
}