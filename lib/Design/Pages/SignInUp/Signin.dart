import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:monumental_habits/Design/Constants/stylesandcolors.dart';
import 'package:monumental_habits/Design/Constants/usefulfunctions.dart';
import 'package:monumental_habits/Design/CustomWidgets/custombutton.dart';
import 'package:monumental_habits/Design/CustomWidgets/customtextfield.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TapGestureRecognizer recognizer = TapGestureRecognizer()
      ..onTap = () => Navigator.pushNamed(context, '/signup');

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Stack(
          children: [
            Image.asset(
              imagepath + 'SignIn/Background.png',
              fit: BoxFit.fitWidth,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 42 * getscale(context),
                      top: 302 * getscale(context),
                      left: 32 * getscale(context),
                      right: 32 * getscale(context)),
                  child: Text(
                    'Welcome to monumental habits'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: GeneralTheme.onboardingHeader,
                  ),
                ),
                buildsigninbuttons(
                    'Continue with Google', 'Google.png', context, 29),
                SizedBox(
                  height: 8,
                ),
                buildsigninbuttons(
                    'Continue with Facebook', 'FB.png', context, 29),
                SizedBox(
                  height: 25 * getscale(context),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(),
                      SizedBox(
                        height: 12 * getscale(context),
                      ),
                      Text(
                        'Log in with email',
                        style: GeneralTheme.littleTitles,
                      ),
                      SizedBox(
                        height: 28 * getscale(context),
                      ),
                      CustomTextField(
                        color: backgroundInputColor,
                        prefixpadding: EdgeInsets.symmetric(
                            horizontal: 17 * getscale(context),
                            vertical: 15 * getscale(context)),
                        iconData: Icons.mail_outline,
                        hintText: 'Email',
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                          hintText: 'Password',
                          color: backgroundColor,
                          prefixpadding: EdgeInsets.all(20),
                          iconData: CupertinoIcons.lock),
                      Padding(
                        padding: EdgeInsets.all(20 * getscale(context)),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, '/mainpage');
                            },
                            child: CustomButton(text: 'Login', sidepadding: 0)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/forgetpassword');
                        },
                        child: Text(
                          'Forgot Password?',
                          style: GeneralTheme.bottomSigninmessages
                              .copyWith(decoration: TextDecoration.underline),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      subtitlesign(
                        recognizer: recognizer,
                        firsttext: "Don't have an account?",
                        secondtext: ' Sign up',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        )),
      ),
    );
  }
}

class subtitlesign extends StatelessWidget {
  const subtitlesign({
    Key? key,
    required this.firsttext,
    required this.secondtext,
    required this.recognizer,
  }) : super(key: key);
  final String firsttext;
  final String secondtext;

  final TapGestureRecognizer recognizer;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(style: GeneralTheme.bottomSigninmessages, children: [
      TextSpan(text: firsttext),
      TextSpan(
          recognizer: recognizer,
          text: secondtext,
          style: TextStyle(fontWeight: FontWeight.w700))
    ]));
  }
}

buildsigninbuttons(text, icon, context, padding) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.symmetric(horizontal: 32 * getscale(context)),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: SizedBox(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 63 * getscale(context),
          ),
          Container(
            color: Colors.black,
            child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 23),
                child: Image.asset(
                  imagepath + 'SignIn/' + icon,
                  fit: BoxFit.none,
                )),
          ),
          SizedBox(
            width: padding * getscale(context),
          ),
          Text(
            text,
            style: GeneralTheme.buttonText,
          ),
        ],
      ),
    ),
  );
}
