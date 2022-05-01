import 'package:flutter/material.dart';

import '../../../../helper/navigator_keys.dart';
import '../../../../helper/utils.dart';
import '../../sign_in/sign_in_page.dart';

class LoginText extends StatelessWidget {
  const LoginText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavigatorKeys.globalNavKey.currentState?.pushReplacement(
        MaterialPageRoute(
          builder: (context) => const SignInPage(),
        ),
      ),
      child: Text(
        "Sign In",
        style: TextStyle(
          fontSize: Utils.shared.fScale(20),
          fontWeight: FontWeight.w700,
          color: const Color(0xffe98f60),
        ),
      ),
    );
  }
}
