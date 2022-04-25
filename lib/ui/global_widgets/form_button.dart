import 'package:flutter/material.dart';

import '../../helper/utils.dart';

class FormButton extends StatelessWidget {
  final Function callback;
  const FormButton({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: Utils.shared.percentW(12),
        height: Utils.shared.percentW(12),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.green[200]?.withOpacity(0.5) ?? Colors.green,
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xff1bccba),
              Color(0xff22e2ab),
            ],
          ),
        ),
        child: Icon(
          Icons.arrow_forward_outlined,
          color: Colors.white,
          size: Utils.shared.percentW(6),
        ),
      ),
    );
  }
}
