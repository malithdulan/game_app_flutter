import 'package:flutter/material.dart';

import '../../helper/utils.dart';

class CommonListLayoutCard extends StatelessWidget {
  final List<Widget> children;
  final bool isLastItem;
  const CommonListLayoutCard(
      {Key? key, required this.children, this.isLastItem = false})
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
