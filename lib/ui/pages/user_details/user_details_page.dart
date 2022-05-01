import 'package:flutter/material.dart';
import 'package:game_app/repositories/auth_repository.dart';
import 'package:game_app/repositories/settings_repository.dart';
import 'package:game_app/ui/pages/user_details/blocs/app_settings_bloc/app_settings_bloc.dart';
import 'package:game_app/ui/pages/user_details/blocs/sign_out_bloc/sign_out_bloc.dart';
import 'package:game_app/ui/pages/user_details/blocs/user_data_bloc/user_data_bloc.dart';
import 'package:game_app/ui/pages/user_details/user_details_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsPage extends StatelessWidget {
  static const String name = "/userDetailsPage";
  const UserDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => UserDataBloc(
                      repository: context.read<SettingsRepository>(),
                    )..add(GetUserData())),
            BlocProvider(
                create: (context) => AppSettingsBloc(
                    repository: context.read<SettingsRepository>())
                  ..add(GetSettings())),
            BlocProvider(
              create: (context) => SignOutBloc(
                repository: context.read<AuthRepository>(),
              ),
            ),
          ],
          child: const UserDetailsLayout(),
        ),
      ),
    );
  }
}
