import 'package:flutter/material.dart';

import '../../helper/utils.dart';

class CardBottomTitle extends StatelessWidget {
  final String name;
  final double width;
  const CardBottomTitle({Key? key, required this.name, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: Utils.shared.percentW(1.5)),
      alignment: Alignment.centerLeft,
      height: Utils.shared.percentPH(5),
      width: width,
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
