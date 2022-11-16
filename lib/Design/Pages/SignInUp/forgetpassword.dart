import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:monumental_habits/Design/Constants/stylesandcolors.dart';
import 'package:monumental_habits/Design/Constants/usefulfunctions.dart';
import 'package:monumental_habits/Design/CustomWidgets/circularbutton.dart';
import 'package:monumental_habits/Design/CustomWidgets/custombutton.dart';
import 'package:monumental_habits/Design/Pages/SignInUp/Signin.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TapGestureRecognizer recognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 20 * getscale(context),
                  top: 39 * getscale(context),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Circularbutton(
                        content:
                            Image.asset(imagepath + 'SignIn/Back Icon.png'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 37 * getscale(context),
              ),
              Text(
                'Forgot your password?',
                style: GeneralTheme.onboardingHeader.copyWith(
                    fontSize: 24, height: 32 / 24, letterSpacing: -24 * 0.03),
              ),
              SizedBox(
                height: 39 * getscale(context),
              ),
              Image.asset(
                imagepath + 'SignIn/password.png',
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: 45 * getscale(context),
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: 20 * getscale(context)),
                padding: EdgeInsets.all(20 * getscale(context)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Enter your registered email below to receive\n password reset instruction',
                      textAlign: TextAlign.center,
                      style: GeneralTheme.bottomSigninmessages,
                    ),
                    SizedBox(
                      height: 30 * getscale(context),
                    ),
                    buildrecoveryemailfield('Email', backgroundInputColor),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(text: 'Send Reset Link', sidepadding: 0)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

buildrecoveryemailfield(hinttext, color) {
  var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none);
  return TextFormField(
    decoration: InputDecoration(
        border: outlineInputBorder,
        filled: true,
        fillColor: color,
        hintText: hinttext,
        hintStyle: GeneralTheme.disabledText,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16)),
  );
}
