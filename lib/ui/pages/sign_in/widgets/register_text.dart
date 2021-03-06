import 'package:flutter/material.dart';
import 'package:game_app/ui/pages/sign_up/sign_up_page.dart';

import '../../../../helper/navigator_keys.dart';
import '../../../../helper/utils.dart';

class RegisterText extends StatelessWidget {
  const RegisterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavigatorKeys.globalNavKey.currentState?.pushReplacement(
        MaterialPageRoute(
          builder: (context) => const SignUpPage(),
        ),
      ),
      child: Text(
        "Sign Up",
        style: TextStyle(
          fontSize: Utils.shared.fScale(20),
          fontWeight: FontWeight.w700,
          color: const Color(0xffe98f60),
        ),
      ),
    );
  }
}
