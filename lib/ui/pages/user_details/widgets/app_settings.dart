import 'package:flutter/material.dart';
import 'package:game_app/helper/extensions.dart';
import 'package:game_app/ui/pages/user_details/blocs/app_settings_bloc/app_settings_bloc.dart';
import 'package:game_app/ui/pages/user_details/widgets/user_details_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../helper/constants.dart';
import '../../../../helper/utils.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppSettingsBloc, AppSettingsState>(
      listenWhen: (previous, current) => current.status.isError,
      listener: (context, state) => Utils.shared
          .showErrorToastMessage(context, Constants.appSettingsError),
      buildWhen: (previous, current) =>
          (previous.settings != current.settings && current.status.isSuccess),
      builder: (context, state) => Column(
        children: [
          UserDetailsTile(
              text: "Version:", value: state.settings?.versionNumber ?? ""),
          SizedBox(height: Utils.shared.percentPH(1.5)),
          UserDetailsTile(
              text: "Build:", value: state.settings?.buildNumber ?? ""),
          SizedBox(height: Utils.shared.percentPH(4)),
        ],
      ),
    );
  }
}
