import 'package:flutter/material.dart';
import 'package:game_app/helper/utils.dart';

class FormContainer extends StatelessWidget {
  final Widget child;
  const FormContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Utils.shared.percentW(75),
      padding: EdgeInsets.only(
        left: Utils.shared.percentW(7),
        right: Utils.shared.percentW(7),
        top: Utils.shared.percentPH(1),
        bottom: Utils.shared.percentPH(1),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
