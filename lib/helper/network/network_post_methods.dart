import 'package:game_app/helper/enums.dart';
import 'package:game_app/repositories/models/auth_models/sign_in_user.dart';
import 'package:game_app/repositories/models/auth_models/sign_up_user.dart';

import 'network.dart';
import 'network_config.dart';

extension NetworkPostMethods on Net {
  Future<dynamic> signIn(SignInUser? user) {
    return performWebServiceRequest(
      uri: NetConfig.getAuthUri(path: NetConfig.login),
      requestType: NETWORK_REQUEST_TYPE.post,
      headers: commonHeaders(),
      contentType: CONTENT_TYPE.jsonEncoded,
      paramData: user?.toJson(),
    );
  }

  Future<dynamic> signUp(SignUpUser? user) {
    return performWebServiceRequest(
      uri: NetConfig.getAuthUri(path: NetConfig.register),
      requestType: NETWORK_REQUEST_TYPE.post,
      headers: commonHeaders(),
      contentType: CONTENT_TYPE.jsonEncoded,
      paramData: user?.toJson(),
      isLogEnable: true,
    );
  }
}
