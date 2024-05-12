import 'package:flutter/material.dart';
import 'package:food_delivery/common_widget/round_button.dart';
import '../../common/color_extensions.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  ///  Otp pin Controller
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 64),
              Text("We have sent an otp to your mobile",
                  style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 30,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 15),
              // const SizedBox(height: 64),
              Text(
                  "Please check your mobile number 922*****07\ncontinue to reset password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 60),
              SizedBox(
                height: 60,
                child: OtpPinField(
                    key: _otpPinFieldController,
                    autoFillEnable: true,

                    ///for Ios it is not needed as the SMS autofill is provided by default, but not for Android, that's where this key is useful.
                    textInputAction: TextInputAction.done,

                    ///in case you want to change the action of keyboard
                    /// to clear the Otp pin Controller
                    onSubmit: (text) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      /// return the entered pin
                    },
                    onChange: (text) {
                      print('Enter on change pin is $text');

                      /// return the entered pin
                    },
                    onCodeChanged: (code) {
                      print('onCodeChanged  is $code');
                    },

                    /// to decorate your Otp_Pin_Field
                    otpPinFieldStyle: OtpPinFieldStyle(
                      /// border color for inactive/unfocused Otp_Pin_Field
                      defaultFieldBorderColor: Colors.transparent,

                      /// border color for active/focused Otp_Pin_Field
                      activeFieldBorderColor: Colors.transparent,

                      /// Background Color for inactive/unfocused Otp_Pin_Field
                      defaultFieldBackgroundColor: TColor.textBox,

                      /// Background Color for active/focused Otp_Pin_Field
                      activeFieldBackgroundColor: TColor.textBox,
                    ),
                    maxLength: 4,

                    /// no of pin field
                    showCursor: true,

                    /// bool to show cursor in pin field or not
                    cursorColor: TColor.placeholder,

                    /// to choose cursor color
                    upperChild: const Column(
                      children: [
                        SizedBox(height: 30),
                        Icon(Icons.flutter_dash_outlined, size: 150),
                        SizedBox(height: 20),
                      ],
                    ),
                    showCustomKeyboard: false,

                    ///bool which manage to show custom keyboard
                    // customKeyboard: Container(),
                    /// Widget which help you to show your own custom keyboard in place if default custom keyboard
                    showDefaultKeyboard: true,

                    ///bool which manage to show default OS keyboard
                    cursorWidth: 3,

                    /// to select cursor width
                    mainAxisAlignment: MainAxisAlignment.center,

                    /// place otp pin field according to yourself

                    /// predefine decorate of pinField use  OtpPinFieldDecoration.defaultPinBoxDecoration||OtpPinFieldDecoration.underlinedPinBoxDecoration||OtpPinFieldDecoration.roundedPinBoxDecoration
                    ///use OtpPinFieldDecoration.custom  (by using this you can make Otp_Pin_Field according to yourself like you can give fieldBorderRadius,fieldBorderWidth and etc things)
                    otpPinFieldDecoration:
                        OtpPinFieldDecoration.defaultPinBoxDecoration),
              ),

              const SizedBox(height: 30),
              RoundButton(
                  title: 'Next',
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  }),
              TextButton(
                  onPressed: () {

                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Didn't Received? ",
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                      Text("Click Here",
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
