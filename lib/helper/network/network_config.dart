class NetConfig {

  static const String scheme = "https";
  static const host = "api.rawg.io";
  static const api = "/api";
  static const key = "0326118b5a4d41e1b496a872cbc2875d";//I didn't put this in a .env file, because, others can easily test the app

  static const String getGames = "$api/games";
  static const String getGenres = "$api/genres";

  static Uri getUri({required String path, Map<String, String>? queryParameters}) {
    Map<String,String> param = {"key": key};
    param.addAll(queryParameters ?? {});
    return Uri(scheme: scheme,host: host,path: path, queryParameters: param);
  }
}