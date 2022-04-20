import 'package:flutter/material.dart';

import '../../helper/utils.dart';
import 'form_text_field_decoration.dart';

class FormTextField extends TextField {
  final Key? fieldKey;
  final FormTextFieldDecoration fieldDecoration;
  final bool isObscureText;

  const FormTextField(
      {required this.fieldDecoration,
      this.fieldKey,
      this.isObscureText = false})
      : super(key: fieldKey);

  @override
  Key? get key => fieldKey;

  @override
  InputDecoration? get decoration => fieldDecoration;

  @override
  Color? get cursorColor => Colors.black;

  @override
  TextStyle? get style => TextStyle(
        fontSize: Utils.shared.fScale(20),
      );

  @override
  bool get obscureText => isObscureText;
}
