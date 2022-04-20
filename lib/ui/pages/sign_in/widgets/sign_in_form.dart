import 'package:flutter/material.dart';
import 'package:game_app/helper/utils.dart';
import 'package:game_app/ui/global_widgets/form_button.dart';
import 'package:game_app/ui/global_widgets/form_container.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

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
                child: TextField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: Utils.shared.fScale(20),
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    icon: const Icon(
                      Icons.account_circle_rounded,
                      color: Colors.grey,
                    ),
                    hintText: "Email",
                  ),
                  cursorColor: Colors.black,
                  style: TextStyle(fontSize: Utils.shared.fScale(20)),
                ),
              ),
              SizedBox(
                height: Utils.shared.percentPH(6),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: Utils.shared.fScale(20),
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    icon: const Icon(
                      Icons.password_rounded,
                      color: Colors.grey,
                    ),
                    hintText: "Password",
                  ),
                  cursorColor: Colors.black,
                  style: TextStyle(
                    fontSize: Utils.shared.fScale(20),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            //form container right padding 7 + half width of submit button
            right: -Utils.shared.percentW(13),
            //(formContainer height 12 / 2) - half height of submit button
            top: (Utils.shared.percentPH(12) / 2) - Utils.shared.percentW(6),
            child: const FormButton(),
          ),
        ],
      ),
    );
  }
}
