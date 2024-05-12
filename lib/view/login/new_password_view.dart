import 'package:flutter/material.dart';
import 'package:food_delivery/common_widget/round_button.dart';
import '../../common/color_extensions.dart';
import '../../common_widget/round_textfield.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 64),
              Text("New Password",
                  style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 30,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 15),
              // const SizedBox(height: 64),
              Text("Please enter your new password",
                  style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 60),
              RoundTextField(
                  hintText: 'Password',
                  controller: txtPassword,
                  obscureText: true),
              const SizedBox(height: 25),
              RoundTextField(
                  hintText: 'Confirm Password',
                  controller: txtConfirmPassword,
                  obscureText: true),
              const SizedBox(height: 30),
              RoundButton(title: 'Next', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
