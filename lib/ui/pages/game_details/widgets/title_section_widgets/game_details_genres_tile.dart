import 'package:flutter/material.dart';

import '../../../../../repositories/models/genre.dart';

class GameDetailsGenresTile extends StatelessWidget {
  final List<Genre>? data;
  const GameDetailsGenresTile({Key? key, required this.data}) : super(key: key);

  TextStyle _fontStyle() {
    return const TextStyle(
      fontFamily: "Roboto",
      fontWeight: FontWeight.w500,
      fontSize: 16,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: data
              ?.map((e) => (e.id != data?.last.id)
                  ? Text("${e.name} \\ ", style: _fontStyle(),)
                  : Text(e.name ?? "", style: _fontStyle(),))
              .toList() ??
          [],
    );
  }
}
