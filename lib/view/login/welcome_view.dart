import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extensions.dart';
import 'package:food_delivery/view/login/login_view.dart';
import 'package:food_delivery/view/login/signup_view.dart';

import '../../common_widget/round_button.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset("assets/img/welcome_top_shape.png",
                  width: media.width),
              Image.asset(
                "assets/img/app_logo.png",
                width: media.width * 0.40,
                height: media.height * 0.40,
                fit: BoxFit.contain,
              ),
              const Text(
                "Pradip's Food Delivery Services",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
          SizedBox(height: media.width * 0.1),
          Text(
            "Discover the best food from over 1,000\nrestaurants and fast delivery to your\ndoorstep",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: TColor.secondaryText,
                fontSize: 13,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: media.width * 0.1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: RoundButton(
              title: "Login",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView()));
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: RoundButton(
              title: "Create an Account",
              type: RoundButtonType.textPrime,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpView()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
