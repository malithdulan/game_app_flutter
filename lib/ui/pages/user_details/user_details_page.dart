import 'package:flutter/material.dart';
import 'package:game_app/ui/pages/user_details/user_details_layout.dart';

class UserDetailsPage extends StatelessWidget {
  static const String name = "/userDetailsPage";
  const UserDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: UserDetailsLayout(),
      ),
    );
  }
}
