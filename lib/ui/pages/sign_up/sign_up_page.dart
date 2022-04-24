import 'package:flutter/material.dart';
import 'package:game_app/ui/pages/sign_up/sign_up_layout.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SignUpLayout(),
    );
  }
}
