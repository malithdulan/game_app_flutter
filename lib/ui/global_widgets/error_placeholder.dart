import 'package:flutter/material.dart';
import 'package:game_app/helper/utils.dart';

class ErrorPlaceholder extends StatelessWidget {
  final String? message;
  final Function callBack;
  final bool showImage;
  const ErrorPlaceholder(
      {Key? key, required this.callBack, this.showImage = false, this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message ?? "",
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: Utils.shared.percentPH(1.5),
          ),
          SizedBox(
            height: Utils.shared.percentPH(4),
            width: Utils.shared.percentW(20),
            child: ElevatedButton(
              onPressed: () => callBack(),
              child: const Text(
                "Reload",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
