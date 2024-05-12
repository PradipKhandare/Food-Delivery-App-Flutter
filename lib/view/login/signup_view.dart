import 'package:flutter/material.dart';
import 'package:food_delivery/common_widget/round_button.dart';
import 'package:food_delivery/view/login/login_view.dart';

import '../../common/color_extensions.dart';
import '../../common_widget/round_icon_button.dart';
import '../../common_widget/round_textfield.dart';
import 'otp_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 64),
              Text("SignUp",
                  style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 30,
                      fontWeight: FontWeight.w800)),
              // const SizedBox(height: 64),
              Text("Add your details to sign up",
                  style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 25),
              RoundTextField(
                  hintText: 'Name',
                  controller: txtName,
                  keyboardType: TextInputType.name),
              const SizedBox(height: 20),
              RoundTextField(
                  hintText: 'Email',
                  controller: txtEmail,
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 20),
              RoundTextField(
                  hintText: 'Mobile',
                  controller: txtMobile,
                  keyboardType: TextInputType.phone),
              const SizedBox(height: 20),
              RoundTextField(
                  hintText: 'Address',
                  controller: txtMobile,
                  keyboardType: TextInputType.streetAddress),
              const SizedBox(height: 20),
              RoundTextField(
                  hintText: 'Password',
                  controller: txtPassword,
                  obscureText: true),
              const SizedBox(height: 20),
              RoundTextField(
                  hintText: 'Confirm Password',
                  controller: txtConfirmPassword,
                  obscureText: true),
              const SizedBox(height: 25),
              RoundButton(title: 'Sign Up', onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OtpView()));
              }),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Already have an account? ",
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                      Text("Login",
                          style: TextStyle(
                              color: TColor.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700)),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
