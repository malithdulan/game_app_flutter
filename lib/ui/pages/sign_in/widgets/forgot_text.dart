import 'package:flutter/material.dart';

import '../../../../helper/utils.dart';

class ForgotText extends StatelessWidget {
  const ForgotText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("clicked"),
      child: Text(
        "Forgot ?",
        style: TextStyle(
          fontSize: Utils.shared.fScale(20),
          fontWeight: FontWeight.w700,
          color: Colors.grey[400],
        ),
      ),
    );
  }
}
