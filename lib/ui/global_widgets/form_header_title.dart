import 'package:flutter/material.dart';
import 'package:game_app/helper/utils.dart';

class FormHeaderTitle extends StatelessWidget {
  final String text;

  const FormHeaderTitle({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Utils.shared.percentW(100),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: Utils.shared.fScale(45),
          fontWeight: FontWeight.w700,
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}
