import 'package:flutter/material.dart';

class ErrorItem extends StatelessWidget {
  const ErrorItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.error,
      color: Colors.deepOrangeAccent,
    );
  }
}
