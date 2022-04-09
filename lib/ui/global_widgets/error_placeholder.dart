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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (showImage)
          Padding(
            padding: EdgeInsets.only(bottom: Utils.shared.percentPH(1.5)),
            child: Image.asset(
              AssetImageUrls.errorWidgetImage,
              fit: BoxFit.cover,
              width: Utils.shared.percentW(60),
              height: Utils.shared.percentPH(15), //intentionally
            ),
          ),
        Text(
          message ?? "",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            fontSize: Utils.shared.fScale(16),
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
            child: Text(
              "Reload",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: Utils.shared.fScale(14)),
            ),
          ),
        )
      ],
    );
  }
}
