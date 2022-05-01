import 'package:flutter/material.dart';
import 'package:game_app/helper/constants.dart';
import 'package:game_app/helper/extensions.dart';
import 'package:game_app/helper/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/ui/global_widgets/common_layout_card.dart';
import 'package:game_app/ui/pages/user_details/blocs/user_data_bloc/user_data_bloc.dart';
import 'package:game_app/ui/pages/user_details/widgets/user_details_tile.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonLayoutCard(
      child: BlocConsumer<UserDataBloc, UserDataState>(
        listenWhen: (previous, current) => current.status.isError,
        listener: (context, state) => Utils.shared
            .showErrorToastMessage(context, Constants.userDataStorageError),
        buildWhen: (previous, current) =>
            (previous.userData != current.userData && current.status.isSuccess),
        builder: (context, state) => Column(
          children: [
            UserDetailsTile(
                text: "Username: ", value: state.userData?.name ?? ""),
            SizedBox(height: Utils.shared.percentPH(1.5)),
            UserDetailsTile(
                text: "Email: ", value: state.userData?.email ?? ""),
            SizedBox(height: Utils.shared.percentPH(1.5)),
            UserDetailsTile(
                text: "Account Type: ",
                value: state.userData?.accountType?.toUpperCase() ?? ""),
          ],
        ),
      ),
    );
  }
}
