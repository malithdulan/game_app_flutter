import 'package:flutter/material.dart';

import '../../../../helper/utils.dart';

class GameDetailsCardWidget extends StatelessWidget {
  final List<Widget> children;
  const GameDetailsCardWidget({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(Utils.shared.percentW(3)),
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
