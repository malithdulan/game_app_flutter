import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/helper/extensions.dart';
import 'package:game_app/repositories/models/auth_models/sign_up_user.dart';

import 'package:game_app/ui/global_widgets/form_text_field_decoration.dart';

import '../../../../helper/utils.dart';
import '../../../global_widgets/form_button.dart';
import '../../../global_widgets/form_container.dart';
import '../../../global_widgets/loading_placeholder.dart';
import '../blocs/sign_up_bloc.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({Key? key}) : super(key: key);
  final SignUpUser user = SignUpUser(
    name: "",
    email: "",
    password: "",
    accountType: "email",
    deviceType: "mobile",
    phoneNumber: "",
  );
  final _signUpFormKey = GlobalKey<FormState>();

  void _signUp(BuildContext context) {
    if (_signUpFormKey.currentState!.validate()) {
      _signUpFormKey.currentState?.save();
      context.read<SignUpBloc>().add(EmailSignUp(user: user));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Utils.shared.percentW(100),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          FormContainer(
            child: Form(
              key: _signUpFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: Utils.shared.percentPH(1)),
                  SizedBox(
                    height: Utils.shared.percentPH(6),
                    child: TextFormField(
                      onSaved: (value) => user.name = value,
                      decoration: const FormTextFieldDecoration(
                        iconData: Icons.account_circle_rounded,
                        text: "Username",
                      ),
                      cursorColor: Colors.black,
                      style: TextStyle(fontSize: Utils.shared.fScale(20)),
                      validator: (value) =>
                          Utils.shared.validationCheck("username", value),
                    ),
                  ),
                  SizedBox(height: Utils.shared.percentPH(1)),
                  SizedBox(
                    height: Utils.shared.percentPH(6),
                    child: TextFormField(
                      onSaved: (value) => user.email = value,
                      decoration: const FormTextFieldDecoration(
                        iconData: Icons.email_rounded,
                        text: "Email",
                      ),
                      cursorColor: Colors.black,
                      style: TextStyle(fontSize: Utils.shared.fScale(20)),
                      validator: (value) =>
                          Utils.shared.validationCheck("email", value),
                    ),
                  ),
                  SizedBox(height: Utils.shared.percentPH(1)),
                  SizedBox(
                    height: Utils.shared.percentPH(6),
                    child: TextFormField(
                      onSaved: (value) => user.password = value,
                      decoration: const FormTextFieldDecoration(
                        iconData: Icons.password_rounded,
                        text: "Password",
                      ),
                      obscureText: true,
                      cursorColor: Colors.black,
                      style: TextStyle(fontSize: Utils.shared.fScale(20)),
                      validator: (value) =>
                          Utils.shared.validationCheck("password", value),
                    ),
                  ),
                  SizedBox(height: Utils.shared.percentPH(1)),
                  SizedBox(
                    height: Utils.shared.percentPH(6),
                    child: TextFormField(
                      onSaved: (value) => user.phoneNumber = value,
                      decoration: const FormTextFieldDecoration(
                        iconData: Icons.phone,
                        text: "+94716948293",
                      ),
                      cursorColor: Colors.black,
                      style: TextStyle(fontSize: Utils.shared.fScale(20)),
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          Utils.shared.validationCheck("phone number", value),
                    ),
                  ),
                  SizedBox(height: Utils.shared.percentPH(1)),
                ],
              ),
            ),
          ),
          Positioned(
            right: Utils.shared.percentW(19),
            //(formContainer height 31 / 2) - half height of submit button
            top: (Utils.shared.percentPH(31) / 2) - Utils.shared.percentW(6),
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
