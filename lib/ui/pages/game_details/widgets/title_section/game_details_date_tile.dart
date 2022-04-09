import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../../../../helper/utils.dart';

class GameDetailsDateTile extends StatelessWidget {
  final DateTime? date;
  const GameDetailsDateTile({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Released:",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: Utils.shared.fScale(16),
          ),
        ),
        SizedBox(
          width: Utils.shared.percentW(2),
        ),
        Text(
          (date != null) ? DateFormat("yyyy-MM-dd").format(date!) : "",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: Utils.shared.fScale(16),
          ),
        ),
      ],
    );
  }
}
