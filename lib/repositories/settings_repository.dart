import 'package:game_app/helper/constants.dart';
import 'package:game_app/helper/managers/shared_preference_manager.dart';
import 'package:game_app/repositories/models/settings_models/app_settings.dart';
import 'package:game_app/repositories/models/settings_models/user_data.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsRepository {
  //get data from the shared preference or user defaults
  Future<UserData> getUserDatFromStorage() async {
    String? name =
        await SharedPreference.shared.getValue(key: Constants.name) as String?;
    String? email =
        await SharedPreference.shared.getValue(key: Constants.email) as String?;
    String? accountType = await SharedPreference.shared
        .getValue(key: Constants.accountType) as String?;
    return Future.value(
        UserData(name: name, email: email, accountType: accountType));
  }

  Future<AppSettings> getSettings() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return Future.value(AppSettings(
      versionNumber: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
    ));
  }
}
