import 'package:flutter/material.dart';

import '../../helper/utils.dart';

class CommonLayoutCard extends StatelessWidget {
  final Widget child;
  final bool isLastItem;
  const CommonLayoutCard(
      {Key? key, required this.child, this.isLastItem = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        top: Utils.shared.percentW(3),
        bottom:
            isLastItem ? Utils.shared.percentW(3) : Utils.shared.percentW(1),
        left: Utils.shared.percentW(3),
        right: Utils.shared.percentW(3),
      ),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(Utils.shared.percentW(3)),
        child: child,
      ),
    );
  }
}
