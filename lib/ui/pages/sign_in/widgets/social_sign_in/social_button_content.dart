import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game_app/helper/utils.dart';

class SocialButtonContent extends StatelessWidget {
  final IconData? icon;
  final String? text;

  const SocialButtonContent({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FaIcon(
          icon,
          color: Colors.white,
        ),
        Text(
          text ?? "",
          style: TextStyle(
            fontSize: Utils.shared.fScale(16),
          ),
        )
      ],
    );
  }
}
