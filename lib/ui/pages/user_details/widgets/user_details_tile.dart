import 'package:flutter/material.dart';
import 'package:game_app/helper/utils.dart';

class UserDetailsTile extends StatelessWidget {
  final String text;
  final String value;
  const UserDetailsTile({required this.text, required this.value, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: Utils.shared.fScale(17),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: Utils.shared.fScale(17),
          ),
        ),
      ],
    );
  }
}
