import 'package:flutter/material.dart';

import '../../../../../helper/utils.dart';

import '../../../../global_widgets/glass_morphism.dart';

class GameDetailsBackButton extends StatelessWidget {
  const GameDetailsBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: Utils.shared.percentW(5),
      top: Utils.shared.percentPH(8),
      child: GlassMorphism(
        width: Utils.shared.percentW(13),
        height: Utils.shared.percentW(13),
        blur: 20,
        opacity: 0.2,
        radius: (Utils.shared.percentW(13) / 2),
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
    );
  }
}
