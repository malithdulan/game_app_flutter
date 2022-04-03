import 'package:flutter/material.dart';

import '../../../../../../helper/utils.dart';

class GameByCategoryTitle extends StatelessWidget {
  const GameByCategoryTitle({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: Utils.shared.percentW(1.5)),
      alignment: Alignment.centerLeft,
      height: Utils.shared.percentPH(5),
      width: Utils.shared.percentW(44),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
        color: Colors.grey.withOpacity(0.4),
      ),
      child: Text(
        name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontFamily: "Roboto",
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}