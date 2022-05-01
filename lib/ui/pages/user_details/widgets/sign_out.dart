import 'package:flutter/material.dart';
import 'package:game_app/helper/extensions.dart';
import 'package:game_app/ui/global_widgets/common_layout_card.dart';
import 'package:game_app/ui/global_widgets/loading_placeholder.dart';
import 'package:game_app/ui/pages/sign_in/sign_in_page.dart';
import 'package:game_app/ui/pages/user_details/blocs/sign_out_bloc/sign_out_bloc.dart';
import 'package:game_app/ui/pages/user_details/widgets/app_settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../helper/navigator_keys.dart';
import '../../../../helper/utils.dart';

class SignOut extends StatelessWidget {
  const SignOut({Key? key}) : super(key: key);

  void _signOut(BuildContext context) {
    context.read<SignOutBloc>().add(UserSignOut());
  }

  void _goToSignIn(BuildContext context) {
    NavigatorKeys.globalNavKey.currentState?.pushReplacement(
      MaterialPageRoute(
        builder: (context) => const SignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayoutCard(
      child: Column(
        children: [
          const AppSettings(),
          BlocConsumer<SignOutBloc, SignOutState>(
            listenWhen: (previous, current) =>
                (current.status.isSuccess && current.isSignedOut) ||
                current.status.isError,
            listener: (context, state) {
              if (state.status.isSuccess) {
                //signOut success
                //dismiss alter dialog
                Navigator.of(context, rootNavigator: true).pop();
                _goToSignIn(context);
              } else {
                //signOut error
                //dismiss alter dialog
                Navigator.of(context, rootNavigator: true).pop();
                Utils.shared.showErrorToastMessage(context, state.errorMessage);
              }
            },
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              return (state.status.isLoading)
                  ? const LoadingPlaceholder()
                  : ElevatedButton(
                      onPressed: () => Utils.shared
                          .showConfirmDialog(context, () => _signOut(context)),
                      child: Text(
                        "Sign Out",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: Utils.shared.fScale(14)),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
