import 'package:flutter/material.dart';

class LoadingPlaceholder extends StatelessWidget {
  final double width;
  final double height;
  const LoadingPlaceholder({Key? key, this.width = 40, this.height = 40}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: const CircularProgressIndicator(
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}
