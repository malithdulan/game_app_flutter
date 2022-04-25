import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/helper/extensions.dart';
import 'package:game_app/repositories/models/auth_models/sign_up_user.dart';

import 'package:game_app/ui/global_widgets/form_text_field.dart';
import 'package:game_app/ui/global_widgets/form_text_field_decoration.dart';

import '../../../../helper/utils.dart';
import '../../../global_widgets/form_button.dart';
import '../../../global_widgets/form_container.dart';
import '../../../global_widgets/loading_placeholder.dart';
import '../blocs/sign_up_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  void _signUp(BuildContext context) {
    SignUpUser user = SignUpUser(
      name: "kuruwita",
      email: "malithdulan@gmail.com",
      password: "ROshen8888",
      accountType: "email",
      deviceType: "mobile",
      phoneNumber: "+94724820850",
    );
    context.read<SignUpBloc>().add(EmailSignUp(user: user));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Utils.shared.percentW(100),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          FormContainer(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: Utils.shared.percentPH(6),
                  child: const FormTextField(
                    fieldDecoration: FormTextFieldDecoration(
                      iconData: Icons.account_circle_rounded,
                      text: "Username",
                    ),
                  ),
                ),
                SizedBox(
                  height: Utils.shared.percentPH(6),
                  child: const FormTextField(
                    fieldDecoration: FormTextFieldDecoration(
                      iconData: Icons.email_rounded,
                      text: "Email",
                    ),
                  ),
                ),
                SizedBox(
                  height: Utils.shared.percentPH(6),
                  child: const FormTextField(
                    fieldDecoration: FormTextFieldDecoration(
                      iconData: Icons.password_rounded,
                      text: "Password",
                    ),
                  ),
                ),
                SizedBox(
                  height: Utils.shared.percentPH(6),
                  child: const FormTextField(
                    fieldDecoration: FormTextFieldDecoration(
                      iconData: Icons.phone,
                      text: "+94716948293",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: Utils.shared.percentW(19),
            //(formContainer height 26 / 2) - half height of submit button
            top: (Utils.shared.percentPH(26) / 2) - Utils.shared.percentW(6),
            child: BlocBuilder<SignUpBloc, SignUpState>(
              buildWhen: (previous, current) =>
                  previous.authState != current.authState,
              builder: (context, state) => state.authState.isLoading
                  ? const LoadingPlaceholder()
                  : FormButton(
                      callback: () => _signUp(context),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
