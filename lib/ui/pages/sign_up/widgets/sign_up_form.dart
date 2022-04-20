import 'package:flutter/material.dart';
import 'package:game_app/ui/global_widgets/form_text_field.dart';
import 'package:game_app/ui/global_widgets/form_text_field_decoration.dart';

import '../../../../helper/utils.dart';
import '../../../global_widgets/form_button.dart';
import '../../../global_widgets/form_container.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

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
            ],
          ),
          Positioned(
            //form container right padding 7 + half width of submit button
            right: -Utils.shared.percentW(13),
            //(formContainer height 18 / 2) - half height of submit button
            top: (Utils.shared.percentPH(18) / 2) - Utils.shared.percentW(6),
            child: const FormButton(),
          ),
        ],
      ),
    );
  }
}
