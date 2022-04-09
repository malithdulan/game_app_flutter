import 'package:flutter/material.dart';
import 'package:game_app/ui/pages/user_details/user_settings.dart';

class UserDetailsLayout extends StatelessWidget {
  const UserDetailsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [UserSettings()],
    );
  }
}
