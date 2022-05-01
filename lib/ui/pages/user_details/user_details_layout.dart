import 'package:flutter/material.dart';
import 'package:game_app/ui/pages/user_details/widgets/sign_out.dart';
import 'package:game_app/ui/pages/user_details/widgets/user_details.dart';
import 'package:game_app/ui/pages/user_details/widgets/theme_settings.dart';

class UserDetailsLayout extends StatelessWidget {
  const UserDetailsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        UserDetails(),
        ThemeSettings(),
        SignOut(),
      ],
    );
  }
}
