import 'dart:convert';

import 'package:game_app/helper/network/network_config.dart';
import 'package:http/http.dart' as http_client;
// ignore: implementation_imports
import 'package:http/src/response.dart';

import '../enums.dart';
import '../log.dart';
import '../utils.dart';

class Net {
  //singleton implementation
  Net._privateConstructor(); //private constructor
  static Net? _shared; //shared instance
  static Net get shared {
    _shared ??= Net._privateConstructor();
    return _shared!;
  }

  ///reusable network service method, use this method with combination with extension methods in this class.
  ///
  ///for post, put, patch make sure to put paramData and contentType
  Future<Map<String, dynamic>> _performWebServiceRequest<T>({
    required Uri uri,
    CONTENT_TYPE contentType = CONTENT_TYPE.jsonEncoded,
    required NETWORK_REQUEST_TYPE requestType,
    T? paramData,
    required Map<String, String> headers,
    bool isLogEnable = false,
  }) async {
    Encoding? _encoding;
    if (contentType == CONTENT_TYPE.xWwwFormUrlencoded) {
      _encoding = Encoding.getByName('utf-8');
    }

    if (isLogEnable) Log.shared.logInfo(message: "${requestType.name} request sent");

    try {
      Response response;
      switch (requestType) {
        case NETWORK_REQUEST_TYPE.get: //Get request
          response = await http_client.get(uri, headers: headers);
          //.timeout(const Duration(seconds: 1));
          break;

        case NETWORK_REQUEST_TYPE.post: //Pose request
          response = await http_client.post(uri,
              headers: headers,
              body: json.encode(paramData),
              encoding: _encoding);
          break;

        case NETWORK_REQUEST_TYPE.put: //Put request
          response = await http_client.put(uri,
              headers: headers,
              body: json.encode(paramData),
              encoding: _encoding);
          break;

        case NETWORK_REQUEST_TYPE.patch: //Patch request
          response = await http_client.patch(uri,
              headers: headers,
              body: json.encode(paramData),
              encoding: _encoding);
          break;

        case NETWORK_REQUEST_TYPE.delete: //Delete request
          response = await http_client.delete(uri, headers: headers);

          break;
      }

      if (isLogEnable) Utils.shared.displayResponseData(response.statusCode, response.body);

      return _getResponseData(response.body,
          response.statusCode); //return response body and status code

    } catch (error, stackTrace) {
      Log.shared.logError(
          message: "network exception error",
          className: "Network - _performWebServiceRequest()",
          error: error.toString(),
          stackTrace: stackTrace);
      throw Exception(error);
    }
  }

  Map<String, dynamic> _getResponseData(String? body, int? statusCode) {
    return {
      "body": (body != null && body.isNotEmpty) ? json.decode(body) : null,
      "statusCode": statusCode,
    };
  }

  Map<String, String> _commonHeaders() {
    return {"Content-Type": "application/json"};
  }
}

extension NetworkMethods on Net {
  Future<dynamic> getGames(int pageNo) {
    Map<String, String> query = {"page_size" : "10", "page" : "$pageNo"};
    return _performWebServiceRequest(
      uri: NetConfig.getUri(
        path: NetConfig.getGames,
        queryParameters: query,
      ),
      requestType: NETWORK_REQUEST_TYPE.get,
      headers: _commonHeaders(),
    );
  }

  Future<dynamic> getGenres() {
    return _performWebServiceRequest(
      uri: NetConfig.getUri(path: NetConfig.getGenres),
      requestType: NETWORK_REQUEST_TYPE.get,
      headers: _commonHeaders(),
    );
  }

  Future<dynamic> getGamesByCategory(int? genreId) {
    Map<String, String> query = {"genres": "$genreId", "page_size": "100"};
    return _performWebServiceRequest(
      uri: NetConfig.getUri(path: NetConfig.getGames, queryParameters: query),
      requestType: NETWORK_REQUEST_TYPE.get,
      headers: _commonHeaders(),
    );
  }
}
