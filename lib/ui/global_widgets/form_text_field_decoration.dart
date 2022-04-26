import 'package:flutter/material.dart';

import '../../helper/utils.dart';

class FormTextFieldDecoration extends InputDecoration {
  final IconData iconData;
  final String text;

  const FormTextFieldDecoration({required this.iconData, required this.text});

  @override
  TextStyle? get hintStyle => TextStyle(
        fontSize: Utils.shared.fScale(20),
        color: Colors.grey,
      );

  @override
  InputBorder? get border => InputBorder.none;

  @override
  Widget? get icon => Icon(
        iconData,
        color: Colors.grey,
      );

  @override
  String? get hintText => text;

  @override
  bool? get isDense => true;

  @override
  EdgeInsetsGeometry? get contentPadding =>
      const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 4.0);
}
