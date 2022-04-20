import 'package:flutter/material.dart';

import '../../../../helper/utils.dart';

class RegisterText extends StatelessWidget {
  const RegisterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("clicked"),
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
