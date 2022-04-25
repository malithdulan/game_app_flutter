import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:game_app/helper/utils.dart';
import 'package:game_app/ui/global_widgets/form_button.dart';
import 'package:game_app/ui/global_widgets/form_container.dart';
import 'package:game_app/ui/global_widgets/form_text_field.dart';
import 'package:game_app/ui/global_widgets/form_text_field_decoration.dart';

import '../../../../repositories/models/auth_models/sign_in_user.dart';
import '../blocs/sign_in_bloc/sign_in_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  void _signIn(BuildContext context) {
    context.read<SignInBloc>().add(EmailSignIn(
            user: SignInUser(
          email: emailController.text,
          password: passwordController.text,
          accountType: "email",
        )));
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: Utils.shared.percentPH(6),
                child: FormTextField(
                  fieldDecoration: const FormTextFieldDecoration(
                    iconData: Icons.account_circle_rounded,
                    text: "Email",
                  ),
                  textController: emailController,
                ),
              ),
              SizedBox(
                height: Utils.shared.percentPH(6),
                child: FormTextField(
                  isObscureText: true,
                  fieldDecoration: const FormTextFieldDecoration(
                    iconData: Icons.password_rounded,
                    text: "Password",
                  ),
                  textController: passwordController,
                ),
              ),
            ],
          ),
          Positioned(
            //form container right padding 7 + half width of submit button
            right: Utils.shared.percentW(13),
            //(formContainer height 12 / 2) - half height of submit button
            top: (Utils.shared.percentPH(12) / 2) - Utils.shared.percentW(6),
            child: FormButton(
              callback: () => _signIn(context),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
