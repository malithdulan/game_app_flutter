import 'package:flutter/material.dart';

import '../../../../helper/utils.dart';

class GameDetailsCard extends StatelessWidget {
  final List<Widget> children;
  final bool marginTop;
  const GameDetailsCard(
      {Key? key, required this.children, this.marginTop = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        top: marginTop ? Utils.shared.percentW(3) : 0.0,
        bottom: Utils.shared.percentW(3),
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
