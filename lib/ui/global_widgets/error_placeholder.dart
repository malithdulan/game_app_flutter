import 'package:flutter/material.dart';
import 'package:game_app/helper/constants.dart';
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
          if (showImage)
            Padding(
              padding: EdgeInsets.only(bottom: Utils.shared.percentPH(1.5)),
              child: LayoutBuilder(
                builder: (context, constraints) => Image.asset(
                  AssetImageUrls.errorWidgetImage,
                  fit: BoxFit.cover,
                  width: constraints.maxWidth * (50 / 100),
                  height: constraints.maxWidth * (25 / 100),
                ),
              ),
            ),
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
