import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:game_app/ui/pages/game_details/blocs/game_details_back_button_bloc/game_details_back_button_bloc.dart';

import '../../../../helper/utils.dart';

import '../../../global_widgets/glass_morphism.dart';

class GameDetailsBackButton extends StatelessWidget {
  const GameDetailsBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: Utils.shared.percentW(5),
      top: Utils.shared.percentPH(8),
      child: BlocSelector<GameDetailsBackButtonBloc, GameDetailsBackButtonState,
          bool>(
        selector: (state) => state.isColorChanged,
        builder: (context, state) => GlassMorphism(
          width: Utils.shared.percentW(13),
          height: Utils.shared.percentW(13),
          blur: 20,
          opacity: 0.2,
          radius: (Utils.shared.percentW(13) / 2),
          color: state ? Colors.deepOrange : Colors.white,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: state ? Colors.deepOrange : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
