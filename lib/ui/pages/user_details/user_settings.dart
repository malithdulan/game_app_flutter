import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/helper/extensions.dart';
import 'package:game_app/helper/utils.dart';
import 'package:game_app/ui/global_blocs/theme_bloc/theme_bloc.dart';
import 'package:game_app/ui/global_widgets/common_layout_card.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({Key? key}) : super(key: key);

  void _switchTheme(BuildContext context, bool value) {
    context.read<ThemeBloc>().add(ChangeTheme(value: value));
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayoutCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Dark Mode",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: Utils.shared.fScale(17),
            ),
          ),
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) => Switch.adaptive(
              value: (state.themeMode.isDark) ? true : false,
              onChanged: (value) => _switchTheme(context, value),
            ),
          ),
        ],
      ),
    );
  }
}
