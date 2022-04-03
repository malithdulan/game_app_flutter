import 'package:flutter/material.dart';

import '../../../../../helper/utils.dart';

class GameDetailsDateTile extends StatelessWidget {
  final DateTime? date;
  const GameDetailsDateTile({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Released date:",
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: Utils.shared.percentW(2),
        ),
        Text(
          date?.toString() ?? "",
          style: const TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
